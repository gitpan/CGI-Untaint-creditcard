use ExtUtils::MakeMaker;

WriteMakefile(
    NAME		=> 'CGI::Untaint::creditcard',
    VERSION_FROM	=> 'lib/CGI/Untaint/creditcard.pm', 
    PREREQ_PM		=> { 
                              CGI::Untaint => 0.01,
                              Business::CreditCard => 0.21,
                              Test::More => 0.10,
                           }, 
    ($] > 5.005 ? () : (
      ABSTRACT_FROM => 'lib/CGI/Untaint/creditcard.pm', 
      AUTHOR        => 'Tony Bowden <kasei@tmtm.com>',
    )),
);
