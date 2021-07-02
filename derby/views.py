from django.core import paginator
from django.db.models.expressions import OrderBy
from django.shortcuts import render
from django.core.paginator import EmptyPage,PageNotAnInteger, Paginator
from django.views import View
from .forms import DerbyRegistration, EntryRegistration, FightRegistration
from .models import Derby, Entry, Fight
import string, random
# Create your views here.


class Index(View):
    template_name = 'derby/index.html'
    context = {}

    def dispatch(self, request, *args, **kwargs):
        print('what the hell')
        self.context["derby_list"] = Derby.objects.filter(user_id=request.user.id).order_by('-id')
        return super(Index, self).dispatch(request, *args, **kwargs)   

    def get(self, request, **kwargs):           
        self.context['form'] = DerbyRegistration()
        return render(request, template_name=self.template_name, context=self.context)

    def post(self, request, **kwargs):
        
        form = DerbyRegistration(request.POST)
        self.context['form'] = form
        if form.is_valid():
            try:
                derby = Derby(user_id=request.user.id,
                              name=form.cleaned_data.get('name'),
                              location=form.cleaned_data.get('location'),
                              derby_type=form.cleaned_data.get('derby_type'),
                              no_entry=form.cleaned_data.get('no_entry'),
                              min_bet=form.cleaned_data.get('min_bet'),
                              s_date=form.cleaned_data.get('s_date'),
                              e_date=form.cleaned_data.get('e_date'))
                derby.save()
                self.context['success_add_derby'] = 'You successfully register a new derby.'
            except Derby.DoesNotExist:
                pass
        return render(request, template_name=self.template_name, context=self.context)


class DerbyEntry(View):
    template_name = 'derby/add_entry.html'
    context = {}
        
    def get(self, request, **kwargs):
        page_num = request.GET.get('page', 1)
        entry_list = Entry.objects.filter(user_id=request.user.id, tournament_id=kwargs['derby_id']).order_by('-id')
        paginator = Paginator(entry_list, 5)
        try:
            entries = paginator.page(page_num)
        except PageNotAnInteger:
            entries = paginator.page(1)
        except EmptyPage:
            entries = paginator.page(1)
        form = EntryRegistration()
        self.context = {'derby': Derby.objects.get(id=kwargs['derby_id']),
                        'form': form, 'entry_list': entry_list, 'entries': entries}
        return render(request, template_name=self.template_name, context=self.context)

    def post(self, request, **kwargs):
        page_num = request.GET.get('page', 1)
        is_member = False

        entry_list = Entry.objects.filter(user_id=request.user.id, tournament_id=kwargs['derby_id']).order_by('-id')
        
        paginator = Paginator(entry_list, 5)
        try:
            entries = paginator.page(page_num)
        except PageNotAnInteger:
            entries = paginator.page(1)
        except EmptyPage:
            entries = paginator.page(1)

        self.context['entries'] = entries
        form = EntryRegistration(request.POST)
        self.context = {'derby': Derby.objects.get(id=kwargs['derby_id']),
                        'form': form,
                        'entry_list': entry_list, 'entries': entries}
        if form.is_valid():
            if not form.cleaned_data.get('member_id') == 0:
                is_member = True
            entry = Entry(tournament_id=form.cleaned_data.get('tournament_id'),
                          user_id=request.user.id,
                          member_id=form.cleaned_data.get('member_id'),
                          is_member=is_member,
                          owner=form.cleaned_data.get('owner'),
                          entry_name=form.cleaned_data.get('entry_name'),
                          email=form.cleaned_data.get('email'),
                          contact_number=form.cleaned_data.get('contact_number'))
            entry.save()
            self.context['form'] = EntryRegistration()
            self.context['success_add_entry'] = f'Entry {form.cleaned_data.get("entry_name")} successfully added'
        return render(request, template_name=self.template_name, context=self.context)


class DerbyFight(View):
    template_name = 'derby/add_fight.html'
    form = {}
    context = {}
    def get(self, request, **kwargs):
        self.form = FightRegistration()
        derby_id = kwargs['derby_id']
        entry_id = kwargs['entry_id']
        disabled = ''
        error_count_fight_gt_num_fight = 0
        
        count_fight = Fight.objects.filter(user_id=request.user.id, tournament_id=derby_id, owner_id=entry_id).count()
        if derby_id == 1 and count_fight == 0:
            disabled = 'disabled'
            error_count_fight_gt_num_fight = 'Can\'t add another fight because it reached the minimum number of entry.'

            min_bet = Derby.objects.get(id=1, user_id=1).min_bet
            entry = Entry.objects.get(tournament_id=1, id=entry_id, user_id=1)
            fights = Fight.objects.filter(tournament_id=derby_id, owner_id=entry_id, user_id=1)
            self.context = {'entry': entry, 'fights': fights, 'min_bet': min_bet, 'form': self.form, 'disabled': disabled,
                            'error_count_fight_gt_num_fight': error_count_fight_gt_num_fight}
        else:
            "check if the total entry is greater than the number of fight in the derby"
            num_fight = Derby.objects.get(id=derby_id, user_id=request.user.id).no_entry
            if count_fight == num_fight:
                disabled = 'disabled'
                error_count_fight_gt_num_fight = 'Can\'t add another fight because it reached the minimum number of entry.'

            min_bet = Derby.objects.get(id=derby_id, user_id=request.user.id).min_bet
            entry = Entry.objects.get(tournament_id=derby_id, id=entry_id, user_id=request.user.id)
            fights = Fight.objects.filter(tournament_id=derby_id, owner_id=entry_id, user_id=request.user.id)
            self.context = {'entry': entry, 'fights': fights, 'min_bet': min_bet, 'form': self.form, 'disabled': disabled,
                            'error_count_fight_gt_num_fight': error_count_fight_gt_num_fight}
            
            "this is a randon LEGBAND WINGBAND AND WEIGHT OF ENTRY FIGHT OF THE OWNER"
            N = 8
            legband = 'WB:'+''.join(random.choices(string.ascii_uppercase + string.digits, k=N))
            wingband = 'LB:'+''.join(random.choices(string.ascii_uppercase + string.digits, k=N))
            weight = random.randint(2300,2340)
            rand_data = {
                'legband': legband,
                'wingband': wingband,
                'weight': weight
            }
            self.context['rand_data'] = rand_data

        return render(request, template_name=self.template_name, context=self.context)

    def post(self, request, **kwargs):
        self.form = FightRegistration(request.POST)
        derby_id = kwargs['derby_id']
        entry_id = kwargs['entry_id']
        min_bet = Derby.objects.get(id=derby_id, user_id=request.user.id).min_bet
        entry = Entry.objects.get(tournament_id=derby_id, id=entry_id, user_id=request.user.id)
        fights = Fight.objects.filter(tournament_id=derby_id, owner_id=entry_id, user_id=request.user.id)
        self.context = {'entry': entry, 'fights': fights, 'min_bet': min_bet, 'form': self.form}
        "check if the total entry is greater than the number of fight in the derby"
        num_fight = Derby.objects.get(id=derby_id, user_id=request.user.id).no_entry
        count_fight = Fight.objects.filter(user_id=request.user.id, tournament_id=derby_id, owner_id=entry_id).count()
        if count_fight >= num_fight:
            self.context['disabled'] = 'disabled'
            self.context['error_count_fight_gt_num_fight'] = 'Can\'t add another fight because it ' \
                                                             'reached the minimum number of entry.'
            self.context['form'] = FightRegistration()
        else:
            if self.form.is_valid():
                fight = Fight(tournament_id=derby_id,
                              user_id=request.user.id,
                              owner_id=entry_id,
                              leg_band=self.form.cleaned_data.get('leg_band'),
                              wing_band=self.form.cleaned_data.get('wing_band'),
                              weight=self.form.cleaned_data.get('weight'),
                              bet=self.form.cleaned_data.get('bet'))
                fight.save()
                self.context['success_add_fight'] = f'You successfully added new entry of {entry.entry_name}'
                self.context['form'] = FightRegistration()

                N = 8
                legband = 'WB:'+''.join(random.choices(string.ascii_uppercase + string.digits, k=N))
                wingband = 'LB:'+''.join(random.choices(string.ascii_uppercase + string.digits, k=N))
                weight = random.randint(2300,2340)
                rand_data = {
                    'legband': legband,
                    'wingband': wingband,
                    'weight': weight
                }
                self.context['rand_data'] = rand_data
                
        return render(request, template_name=self.template_name, context=self.context)


class DerbyProfile(View):
    template_name = 'derby/derby_profile.html'
    context = {}

    def get(self, request, **kwargs):
        derby_id = kwargs['derby_id']
        derby = Derby.objects.get(id=derby_id, user_id=request.user.id)
        self.context = {'derby': derby}
        return render(request, template_name=self.template_name, context=self.context)

