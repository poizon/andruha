package Myblog;
use Mojo::Base 'Mojolicious';
use lib '../lib';
use Myblog::Model::Fetch;
use DBI;

has db => sub {
      my $self = shift;
      my $dbfile = $self->config('dbfile');

      state  $dbh = DBI->connect("dbi:SQLite:dbname=$dbfile", "", "",
        { RaiseError => 1, AutoCommit => 0, sqlite_unicode => 1 } );
      return $dbh;
    };

# This method will run once at server start
sub startup {
  my $app = shift;

  my $config = $app->plugin('Config');

  $app->helper( 'model' => sub {
    my $self = shift;
    state $model = Myblog::Model::Fetch->new( dbh  => $app->db, conf => $app->config);
    return $model;
  });

  # Documentation browser under "/perldoc"
  $app->plugin('PODRenderer') if $config->{perldoc};

  # Router
  my $r = $app->routes;

  # Normal route to controller
  $r->get('/')->to('example#main');
}

1;
