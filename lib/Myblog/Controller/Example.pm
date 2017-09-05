package Myblog::Controller::Example;
use Mojo::Base 'Mojolicious::Controller';
use DDP;


sub main {
  my $self = shift;
  my $row = $self->model->main->list;

  $self->stash(list => $row);
  $self->render();
}

1;
