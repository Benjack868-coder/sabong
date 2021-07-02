from django.shortcuts import render
from django.views import View
from django.views.generic import DetailView, ListView
from django.views.generic.base import TemplateView
from derby.models import Derby, Entry, Fight
from django.core.paginator import EmptyPage,PageNotAnInteger, Paginator


# Create your views here.

class Index(View):
    template_name = 'matches/index.html'
    context = {}

    def get(self, request, **kwargs):
        derbys = Derby.objects.filter(user_id=request.user.id).order_by('-id')
        self.context['derbys'] = derbys

        return render(request, self.template_name,self.context)


class Match(View):
    template_name = 'matches/match.html'
    context = {}

    def get(self, request, *args, **kwargs):
        derby_id = kwargs['derby_id']
        derby = Derby.objects.get(id=derby_id, user_id=request.user.id)
        page_num = request.GET.get('page', 1)
        entry_list = Entry.objects.filter(user_id=request.user.id, tournament_id=kwargs['derby_id']).order_by('-owner')
        paginator = Paginator(entry_list, 5)
        try:
            entries = paginator.page(page_num)
        except PageNotAnInteger:
            entries = paginator.page(1)
        except EmptyPage:
            entries = paginator.page(1)
        
        self.context['derby'] = derby
        self.context['entrys'] = entries
        return render(request, self.template_name, self.context)


class Entrys(View):
    template_name = 'matches/entry.html'
    context = {}     

    def dispatch(self, request, *args, **kwargs):
        user_id = request.user.id
        derby_id = kwargs['derby_id']
        owner_id = kwargs['entry_id']
        derby = Derby.objects.get(id=derby_id,user_id=request.user.id)
        fights = Fight.objects.filter(tournament_id=derby_id, owner_id=owner_id, user_id=user_id)
        owner = Entry.objects.get(id=owner_id,tournament_id=derby_id,user_id=user_id)
        entrys = Entry.objects.filter(user_id=user_id, tournament_id = derby_id).order_by('-owner')
        self.context['derby'] = derby
        self.context['fights'] = fights
        self.context['owner'] = owner
        self.context['entrys'] = entrys
        return super(Entrys, self).dispatch(request, *args, **kwargs)

    def get(self, request, *args, **kwargs):        
        return render(request, self.template_name, self.context)


