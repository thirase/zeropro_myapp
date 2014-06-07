use FindBin;
use lib "$FindBin::Bin/mojo/lib";

use Mojolicious::Lite;

# use strict; use warnings; 自動
# get関数,app関数が使える
# /kimoto?animal=dog&age=19
get '/:name' => sub {
  # コントローラーオブジェクト
  my $self = shift;
  # パラメーターの受け取り
  my $name = $self->param('name');
  my $animal = $self->param('animal');
  # 描画
  $self->render('index', name => $name, animal => $animal);
};
# アプリケーションの開始
app->start;

# データセクション
__DATA__

@@ layouts/common.html.ep
<html>
  <head>
    <meta charset="UTF-8">
    <title>越谷 ゼロプロ #7</title>
  </head>
  <body>
    <%= content %>
  </body>
</html>

@@ index.html.ep
<%
  # コメント
  my $name = stash('name');
  my $animal = stash('animal');
%>
<% layout 'common'; %>
<%= include 'include/header' %>
Name: <%= $name %> <br> Animal:  <%= $animal %> <br>あいうえお

@@ include/header.html.ep
<h1 style="border-bottom:1px solid gray">越谷 ゼロプロ #7</h1>

__END__

use Mojolicious::Lite;

# use strict; use warnings; 自動
# get関数,app関数が使える

get '/foo' => sub {
  # コントローラーオブジェクト
  my $self = shift;
  
  # 描画
  $self->render(text => 'foo');
};

get '/hello' => sub {
  # コントローラーオブジェクト
  my $self = shift;
  
  # 描画
  $self->render(text => 'hello');
};

# アプリケーションの開始
app->start;

# perl -c myapp.pl
# サーバーの起動(3000番ポート)
# 「http://localhost:3000」でアクセスできる
# morbo myapp.pl

