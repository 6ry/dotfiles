#!/usr/bin/perl

use threads;
use threads::shared;

my @url = qw(
https://github.com/bling/vim-airline.git
https://github.com/ervandew/supertab.git
https://github.com/fholgado/minibufexpl.vim.git
https://github.com/kien/ctrlp.vim.git
https://github.com/kshenoy/vim-signature.git
https://github.com/mileszs/ack.vim.git
https://github.com/plasticboy/vim-markdown.git
https://github.com/scrooloose/nerdtree.git
https://github.com/scrooloose/syntastic.git
https://github.com/sjl/gundo.vim.git
https://github.com/vim-scripts/Align.git
https://github.com/vim-scripts/TaskList.vim.git
https://github.com/vim-scripts/taglist.vim.git
https://github.com/xolox/vim-easytags.git
https://github.com/xolox/vim-misc
);

my @tt;

foreach my $v (@url) {
    push(@tt, threads->create(
            sub {
                my $u = shift;
                system("git", "clone", "$u");
            }, "$v"));
}

foreach my $t (@tt) {$t->join();}

#foreach(@url){ system("git", "clone", "$_"); }
