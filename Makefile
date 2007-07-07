# This Makefile is for the joshissexy extension to perl.
#
# It was generated automatically by MakeMaker version
# 6.30_01 (Revision: Revision: 4535 ) from the contents of
# Makefile.PL. Don't edit this file, edit Makefile.PL instead.
#
#       ANY CHANGES MADE HERE WILL BE LOST!
#
#   MakeMaker ARGV: ()
#
#   MakeMaker Parameters:

#     ABSTRACT => q[Catalyst based application]
#     AUTHOR => q[Josh Braegger, "arnie@geekahertz.org"]
#     DIR => []
#     DISTNAME => q[joshissexy]
#     EXE_FILES => [q[script/joshissexy_cgi.pl], q[script/joshissexy_create.pl], q[script/joshissexy_fastcgi.pl], q[script/joshissexy_server.pl], q[script/joshissexy_test.pl]]
#     NAME => q[joshissexy]
#     NO_META => q[1]
#     PL_FILES => {  }
#     PREREQ_PM => { YAML=>q[0], Catalyst::Plugin::Static::Simple=>q[0], DBD::Pg=>q[0], Catalyst::Plugin::ConfigLoader=>q[0], Catalyst=>q[5.7006], DBIx::Class=>q[0], Catalyst::Action::RenderView=>q[0] }
#     VERSION => q[0.01]
#     dist => { PREOP=>q[$(PERL) -I. -MModule::Install::Admin -e "dist_preop(q($(DISTVNAME)))"] }
#     test => { TESTS=>q[t/01app.t t/02pod.t t/03podcoverage.t t/controller_Admin.t t/controller_News.t t/controller_Users.t t/model_joshissexyDB.t] }

# --- MakeMaker post_initialize section:


# --- MakeMaker const_config section:

# These definitions are from config.sh (via /usr/lib/perl/5.8/Config.pm)

# They may have been overridden via Makefile.PL or on the command line
AR = ar
CC = cc
CCCDLFLAGS = -fPIC
CCDLFLAGS = -Wl,-E
DLEXT = so
DLSRC = dl_dlopen.xs
LD = cc
LDDLFLAGS = -shared -L/usr/local/lib
LDFLAGS =  -L/usr/local/lib
LIBC = /lib/libc-2.4.so
LIB_EXT = .a
OBJ_EXT = .o
OSNAME = linux
OSVERS = 2.6.15.7
RANLIB = :
SITELIBEXP = /usr/local/share/perl/5.8.8
SITEARCHEXP = /usr/local/lib/perl/5.8.8
SO = so
EXE_EXT = 
FULL_AR = /usr/bin/ar
VENDORARCHEXP = /usr/lib/perl5
VENDORLIBEXP = /usr/share/perl5


# --- MakeMaker constants section:
AR_STATIC_ARGS = cr
DIRFILESEP = /
DFSEP = $(DIRFILESEP)
NAME = joshissexy
NAME_SYM = joshissexy
VERSION = 0.01
VERSION_MACRO = VERSION
VERSION_SYM = 0_01
DEFINE_VERSION = -D$(VERSION_MACRO)=\"$(VERSION)\"
XS_VERSION = 0.01
XS_VERSION_MACRO = XS_VERSION
XS_DEFINE_VERSION = -D$(XS_VERSION_MACRO)=\"$(XS_VERSION)\"
INST_ARCHLIB = blib/arch
INST_SCRIPT = blib/script
INST_BIN = blib/bin
INST_LIB = blib/lib
INST_MAN1DIR = blib/man1
INST_MAN3DIR = blib/man3
MAN1EXT = 1p
MAN3EXT = 3pm
INSTALLDIRS = site
DESTDIR = 
PREFIX = /usr
PERLPREFIX = $(PREFIX)
SITEPREFIX = $(PREFIX)/local
VENDORPREFIX = $(PREFIX)
INSTALLPRIVLIB = $(PERLPREFIX)/share/perl/5.8
DESTINSTALLPRIVLIB = $(DESTDIR)$(INSTALLPRIVLIB)
INSTALLSITELIB = $(SITEPREFIX)/share/perl/5.8.8
DESTINSTALLSITELIB = $(DESTDIR)$(INSTALLSITELIB)
INSTALLVENDORLIB = $(VENDORPREFIX)/share/perl5
DESTINSTALLVENDORLIB = $(DESTDIR)$(INSTALLVENDORLIB)
INSTALLARCHLIB = $(PERLPREFIX)/lib/perl/5.8
DESTINSTALLARCHLIB = $(DESTDIR)$(INSTALLARCHLIB)
INSTALLSITEARCH = $(SITEPREFIX)/lib/perl/5.8.8
DESTINSTALLSITEARCH = $(DESTDIR)$(INSTALLSITEARCH)
INSTALLVENDORARCH = $(VENDORPREFIX)/lib/perl5
DESTINSTALLVENDORARCH = $(DESTDIR)$(INSTALLVENDORARCH)
INSTALLBIN = $(PERLPREFIX)/bin
DESTINSTALLBIN = $(DESTDIR)$(INSTALLBIN)
INSTALLSITEBIN = $(SITEPREFIX)/bin
DESTINSTALLSITEBIN = $(DESTDIR)$(INSTALLSITEBIN)
INSTALLVENDORBIN = $(VENDORPREFIX)/bin
DESTINSTALLVENDORBIN = $(DESTDIR)$(INSTALLVENDORBIN)
INSTALLSCRIPT = $(PERLPREFIX)/bin
DESTINSTALLSCRIPT = $(DESTDIR)$(INSTALLSCRIPT)
INSTALLSITESCRIPT = $(SITEPREFIX)/bin
DESTINSTALLSITESCRIPT = $(DESTDIR)$(INSTALLSITESCRIPT)
INSTALLVENDORSCRIPT = $(VENDORPREFIX)/bin
DESTINSTALLVENDORSCRIPT = $(DESTDIR)$(INSTALLVENDORSCRIPT)
INSTALLMAN1DIR = $(PERLPREFIX)/share/man/man1
DESTINSTALLMAN1DIR = $(DESTDIR)$(INSTALLMAN1DIR)
INSTALLSITEMAN1DIR = $(SITEPREFIX)/man/man1
DESTINSTALLSITEMAN1DIR = $(DESTDIR)$(INSTALLSITEMAN1DIR)
INSTALLVENDORMAN1DIR = $(VENDORPREFIX)/share/man/man1
DESTINSTALLVENDORMAN1DIR = $(DESTDIR)$(INSTALLVENDORMAN1DIR)
INSTALLMAN3DIR = $(PERLPREFIX)/share/man/man3
DESTINSTALLMAN3DIR = $(DESTDIR)$(INSTALLMAN3DIR)
INSTALLSITEMAN3DIR = $(SITEPREFIX)/man/man3
DESTINSTALLSITEMAN3DIR = $(DESTDIR)$(INSTALLSITEMAN3DIR)
INSTALLVENDORMAN3DIR = $(VENDORPREFIX)/share/man/man3
DESTINSTALLVENDORMAN3DIR = $(DESTDIR)$(INSTALLVENDORMAN3DIR)
PERL_LIB =
PERL_ARCHLIB = /usr/lib/perl/5.8
LIBPERL_A = libperl.a
FIRST_MAKEFILE = Makefile
MAKEFILE_OLD = Makefile.old
MAKE_APERL_FILE = Makefile.aperl
PERLMAINCC = $(CC)
PERL_INC = /usr/lib/perl/5.8/CORE
PERL = /usr/bin/perl "-Iinc"
FULLPERL = /usr/bin/perl "-Iinc"
ABSPERL = $(PERL)
PERLRUN = $(PERL)
FULLPERLRUN = $(FULLPERL)
ABSPERLRUN = $(ABSPERL)
PERLRUNINST = $(PERLRUN) "-I$(INST_ARCHLIB)" "-Iinc" "-I$(INST_LIB)"
FULLPERLRUNINST = $(FULLPERLRUN) "-I$(INST_ARCHLIB)" "-Iinc" "-I$(INST_LIB)"
ABSPERLRUNINST = $(ABSPERLRUN) "-I$(INST_ARCHLIB)" "-Iinc" "-I$(INST_LIB)"
PERL_CORE = 0
PERM_RW = 644
PERM_RWX = 755

MAKEMAKER   = /usr/share/perl/5.8/ExtUtils/MakeMaker.pm
MM_VERSION  = 6.30_01
MM_REVISION = Revision: 4535 

# FULLEXT = Pathname for extension directory (eg Foo/Bar/Oracle).
# BASEEXT = Basename part of FULLEXT. May be just equal FULLEXT. (eg Oracle)
# PARENT_NAME = NAME without BASEEXT and no trailing :: (eg Foo::Bar)
# DLBASE  = Basename part of dynamic library. May be just equal BASEEXT.
FULLEXT = joshissexy
BASEEXT = joshissexy
PARENT_NAME = 
DLBASE = $(BASEEXT)
VERSION_FROM = 
OBJECT = 
LDFROM = $(OBJECT)
LINKTYPE = dynamic
BOOTDEP = 

# Handy lists of source code files:
XS_FILES = 
C_FILES  = 
O_FILES  = 
H_FILES  = 
MAN1PODS = script/joshissexy_cgi.pl \
	script/joshissexy_create.pl \
	script/joshissexy_fastcgi.pl \
	script/joshissexy_server.pl \
	script/joshissexy_test.pl
MAN3PODS = lib/joshissexy.pm \
	lib/joshissexy/Controller/Admin.pm \
	lib/joshissexy/Controller/News.pm \
	lib/joshissexy/Controller/Root.pm \
	lib/joshissexy/Model/joshissexyDB.pm \
	lib/joshissexy/View/TT.pm \
	lib/joshissexyDB.pm \
	lib/joshissexyDB/Comments.pm \
	lib/joshissexyDB/News.pm \
	lib/joshissexyDB/Roles.pm \
	lib/joshissexyDB/UserRoles.pm \
	lib/joshissexyDB/Users.pm

# Where is the Config information that we are using/depend on
CONFIGDEP = $(PERL_ARCHLIB)$(DFSEP)Config.pm $(PERL_INC)$(DFSEP)config.h

# Where to build things
INST_LIBDIR      = $(INST_LIB)
INST_ARCHLIBDIR  = $(INST_ARCHLIB)

INST_AUTODIR     = $(INST_LIB)/auto/$(FULLEXT)
INST_ARCHAUTODIR = $(INST_ARCHLIB)/auto/$(FULLEXT)

INST_STATIC      = 
INST_DYNAMIC     = 
INST_BOOT        = 

# Extra linker info
EXPORT_LIST        = 
PERL_ARCHIVE       = 
PERL_ARCHIVE_AFTER = 


TO_INST_PM = lib/joshissexy.pm \
	lib/joshissexy/Controller/Admin.pm \
	lib/joshissexy/Controller/News.pm \
	lib/joshissexy/Controller/Root.pm \
	lib/joshissexy/Model/joshissexyDB.pm \
	lib/joshissexy/View/TT.pm \
	lib/joshissexyDB.pm \
	lib/joshissexyDB/Comments.pm \
	lib/joshissexyDB/News.pm \
	lib/joshissexyDB/Roles.pm \
	lib/joshissexyDB/UserRoles.pm \
	lib/joshissexyDB/Users.pm

PM_TO_BLIB = lib/joshissexyDB/Roles.pm \
	blib/lib/joshissexyDB/Roles.pm \
	lib/joshissexy/Controller/News.pm \
	blib/lib/joshissexy/Controller/News.pm \
	lib/joshissexy/Model/joshissexyDB.pm \
	blib/lib/joshissexy/Model/joshissexyDB.pm \
	lib/joshissexy.pm \
	blib/lib/joshissexy.pm \
	lib/joshissexy/Controller/Admin.pm \
	blib/lib/joshissexy/Controller/Admin.pm \
	lib/joshissexyDB/UserRoles.pm \
	blib/lib/joshissexyDB/UserRoles.pm \
	lib/joshissexy/Controller/Root.pm \
	blib/lib/joshissexy/Controller/Root.pm \
	lib/joshissexyDB/News.pm \
	blib/lib/joshissexyDB/News.pm \
	lib/joshissexyDB.pm \
	blib/lib/joshissexyDB.pm \
	lib/joshissexyDB/Comments.pm \
	blib/lib/joshissexyDB/Comments.pm \
	lib/joshissexyDB/Users.pm \
	blib/lib/joshissexyDB/Users.pm \
	lib/joshissexy/View/TT.pm \
	blib/lib/joshissexy/View/TT.pm


# --- MakeMaker platform_constants section:
MM_Unix_VERSION = 1.50_01
PERL_MALLOC_DEF = -DPERL_EXTMALLOC_DEF -Dmalloc=Perl_malloc -Dfree=Perl_mfree -Drealloc=Perl_realloc -Dcalloc=Perl_calloc


# --- MakeMaker tool_autosplit section:
# Usage: $(AUTOSPLITFILE) FileToSplit AutoDirToSplitInto
AUTOSPLITFILE = $(ABSPERLRUN)  -e 'use AutoSplit;  autosplit($$ARGV[0], $$ARGV[1], 0, 1, 1)'



# --- MakeMaker tool_xsubpp section:


# --- MakeMaker tools_other section:
SHELL = /bin/sh
CHMOD = chmod
CP = cp
MV = mv
NOOP = $(SHELL) -c true
NOECHO = @
RM_F = rm -f
RM_RF = rm -rf
TEST_F = test -f
TOUCH = touch
UMASK_NULL = umask 0
DEV_NULL = > /dev/null 2>&1
MKPATH = $(ABSPERLRUN) "-MExtUtils::Command" -e mkpath
EQUALIZE_TIMESTAMP = $(ABSPERLRUN) "-MExtUtils::Command" -e eqtime
ECHO = echo
ECHO_N = echo -n
UNINST = 0
VERBINST = 0
MOD_INSTALL = $(ABSPERLRUN) -MExtUtils::Install -e 'install({@ARGV}, '\''$(VERBINST)'\'', 0, '\''$(UNINST)'\'');'
DOC_INSTALL = $(ABSPERLRUN) "-MExtUtils::Command::MM" -e perllocal_install
UNINSTALL = $(ABSPERLRUN) "-MExtUtils::Command::MM" -e uninstall
WARN_IF_OLD_PACKLIST = $(ABSPERLRUN) "-MExtUtils::Command::MM" -e warn_if_old_packlist
MACROSTART = 
MACROEND = 
USEMAKEFILE = -f
FIXIN = $(PERLRUN) "-MExtUtils::MY" -e "MY->fixin(shift)"


# --- MakeMaker makemakerdflt section:
makemakerdflt: all
	$(NOECHO) $(NOOP)


# --- MakeMaker dist section:
TAR = tar
TARFLAGS = cvf
ZIP = zip
ZIPFLAGS = -r
COMPRESS = gzip --best
SUFFIX = .gz
SHAR = shar
PREOP = $(PERL) -I. -MModule::Install::Admin -e "dist_preop(q($(DISTVNAME)))"
POSTOP = $(NOECHO) $(NOOP)
TO_UNIX = $(NOECHO) $(NOOP)
CI = ci -u
RCS_LABEL = rcs -Nv$(VERSION_SYM): -q
DIST_CP = best
DIST_DEFAULT = tardist
DISTNAME = joshissexy
DISTVNAME = joshissexy-0.01


# --- MakeMaker macro section:


# --- MakeMaker depend section:


# --- MakeMaker cflags section:


# --- MakeMaker const_loadlibs section:


# --- MakeMaker const_cccmd section:


# --- MakeMaker post_constants section:


# --- MakeMaker pasthru section:

PASTHRU = LIBPERL_A="$(LIBPERL_A)"\
	LINKTYPE="$(LINKTYPE)"\
	PREFIX="$(PREFIX)"


# --- MakeMaker special_targets section:
.SUFFIXES : .xs .c .C .cpp .i .s .cxx .cc $(OBJ_EXT)

.PHONY: all config static dynamic test linkext manifest blibdirs clean realclean disttest distdir



# --- MakeMaker c_o section:


# --- MakeMaker xs_c section:


# --- MakeMaker xs_o section:


# --- MakeMaker top_targets section:
all :: pure_all manifypods
	$(NOECHO) $(NOOP)


pure_all :: config pm_to_blib subdirs linkext
	$(NOECHO) $(NOOP)

subdirs :: $(MYEXTLIB)
	$(NOECHO) $(NOOP)

config :: $(FIRST_MAKEFILE) blibdirs
	$(NOECHO) $(NOOP)

help :
	perldoc ExtUtils::MakeMaker


# --- MakeMaker blibdirs section:
blibdirs : $(INST_LIBDIR)$(DFSEP).exists $(INST_ARCHLIB)$(DFSEP).exists $(INST_AUTODIR)$(DFSEP).exists $(INST_ARCHAUTODIR)$(DFSEP).exists $(INST_BIN)$(DFSEP).exists $(INST_SCRIPT)$(DFSEP).exists $(INST_MAN1DIR)$(DFSEP).exists $(INST_MAN3DIR)$(DFSEP).exists
	$(NOECHO) $(NOOP)

# Backwards compat with 6.18 through 6.25
blibdirs.ts : blibdirs
	$(NOECHO) $(NOOP)

$(INST_LIBDIR)$(DFSEP).exists :: Makefile.PL
	$(NOECHO) $(MKPATH) $(INST_LIBDIR)
	$(NOECHO) $(CHMOD) 755 $(INST_LIBDIR)
	$(NOECHO) $(TOUCH) $(INST_LIBDIR)$(DFSEP).exists

$(INST_ARCHLIB)$(DFSEP).exists :: Makefile.PL
	$(NOECHO) $(MKPATH) $(INST_ARCHLIB)
	$(NOECHO) $(CHMOD) 755 $(INST_ARCHLIB)
	$(NOECHO) $(TOUCH) $(INST_ARCHLIB)$(DFSEP).exists

$(INST_AUTODIR)$(DFSEP).exists :: Makefile.PL
	$(NOECHO) $(MKPATH) $(INST_AUTODIR)
	$(NOECHO) $(CHMOD) 755 $(INST_AUTODIR)
	$(NOECHO) $(TOUCH) $(INST_AUTODIR)$(DFSEP).exists

$(INST_ARCHAUTODIR)$(DFSEP).exists :: Makefile.PL
	$(NOECHO) $(MKPATH) $(INST_ARCHAUTODIR)
	$(NOECHO) $(CHMOD) 755 $(INST_ARCHAUTODIR)
	$(NOECHO) $(TOUCH) $(INST_ARCHAUTODIR)$(DFSEP).exists

$(INST_BIN)$(DFSEP).exists :: Makefile.PL
	$(NOECHO) $(MKPATH) $(INST_BIN)
	$(NOECHO) $(CHMOD) 755 $(INST_BIN)
	$(NOECHO) $(TOUCH) $(INST_BIN)$(DFSEP).exists

$(INST_SCRIPT)$(DFSEP).exists :: Makefile.PL
	$(NOECHO) $(MKPATH) $(INST_SCRIPT)
	$(NOECHO) $(CHMOD) 755 $(INST_SCRIPT)
	$(NOECHO) $(TOUCH) $(INST_SCRIPT)$(DFSEP).exists

$(INST_MAN1DIR)$(DFSEP).exists :: Makefile.PL
	$(NOECHO) $(MKPATH) $(INST_MAN1DIR)
	$(NOECHO) $(CHMOD) 755 $(INST_MAN1DIR)
	$(NOECHO) $(TOUCH) $(INST_MAN1DIR)$(DFSEP).exists

$(INST_MAN3DIR)$(DFSEP).exists :: Makefile.PL
	$(NOECHO) $(MKPATH) $(INST_MAN3DIR)
	$(NOECHO) $(CHMOD) 755 $(INST_MAN3DIR)
	$(NOECHO) $(TOUCH) $(INST_MAN3DIR)$(DFSEP).exists



# --- MakeMaker linkext section:

linkext :: $(LINKTYPE)
	$(NOECHO) $(NOOP)


# --- MakeMaker dlsyms section:


# --- MakeMaker dynamic section:

dynamic :: $(FIRST_MAKEFILE) $(INST_DYNAMIC) $(INST_BOOT)
	$(NOECHO) $(NOOP)


# --- MakeMaker dynamic_bs section:

BOOTSTRAP =


# --- MakeMaker dynamic_lib section:


# --- MakeMaker static section:

## $(INST_PM) has been moved to the all: target.
## It remains here for awhile to allow for old usage: "make static"
static :: $(FIRST_MAKEFILE) $(INST_STATIC)
	$(NOECHO) $(NOOP)


# --- MakeMaker static_lib section:


# --- MakeMaker manifypods section:

POD2MAN_EXE = $(PERLRUN) "-MExtUtils::Command::MM" -e pod2man "--"
POD2MAN = $(POD2MAN_EXE)


manifypods : pure_all  \
	script/joshissexy_fastcgi.pl \
	script/joshissexy_test.pl \
	script/joshissexy_create.pl \
	script/joshissexy_cgi.pl \
	script/joshissexy_server.pl \
	lib/joshissexyDB/Roles.pm \
	lib/joshissexy/Controller/News.pm \
	lib/joshissexy/Model/joshissexyDB.pm \
	lib/joshissexy.pm \
	lib/joshissexy/Controller/Admin.pm \
	lib/joshissexyDB/UserRoles.pm \
	lib/joshissexy/Controller/Root.pm \
	lib/joshissexyDB/News.pm \
	lib/joshissexyDB.pm \
	lib/joshissexyDB/Comments.pm \
	lib/joshissexyDB/Users.pm \
	lib/joshissexy/View/TT.pm \
	lib/joshissexyDB/Roles.pm \
	lib/joshissexy/Controller/News.pm \
	lib/joshissexy/Model/joshissexyDB.pm \
	lib/joshissexy.pm \
	lib/joshissexy/Controller/Admin.pm \
	lib/joshissexyDB/UserRoles.pm \
	lib/joshissexy/Controller/Root.pm \
	lib/joshissexyDB/News.pm \
	lib/joshissexyDB.pm \
	lib/joshissexyDB/Comments.pm \
	lib/joshissexyDB/Users.pm \
	lib/joshissexy/View/TT.pm
	$(NOECHO) $(POD2MAN) --section=$(MAN1EXT) --perm_rw=$(PERM_RW) \
	  script/joshissexy_fastcgi.pl $(INST_MAN1DIR)/joshissexy_fastcgi.pl.$(MAN1EXT) \
	  script/joshissexy_test.pl $(INST_MAN1DIR)/joshissexy_test.pl.$(MAN1EXT) \
	  script/joshissexy_create.pl $(INST_MAN1DIR)/joshissexy_create.pl.$(MAN1EXT) \
	  script/joshissexy_cgi.pl $(INST_MAN1DIR)/joshissexy_cgi.pl.$(MAN1EXT) \
	  script/joshissexy_server.pl $(INST_MAN1DIR)/joshissexy_server.pl.$(MAN1EXT) 
	$(NOECHO) $(POD2MAN) --section=$(MAN3EXT) --perm_rw=$(PERM_RW) \
	  lib/joshissexyDB/Roles.pm $(INST_MAN3DIR)/joshissexyDB::Roles.$(MAN3EXT) \
	  lib/joshissexy/Controller/News.pm $(INST_MAN3DIR)/joshissexy::Controller::News.$(MAN3EXT) \
	  lib/joshissexy/Model/joshissexyDB.pm $(INST_MAN3DIR)/joshissexy::Model::joshissexyDB.$(MAN3EXT) \
	  lib/joshissexy.pm $(INST_MAN3DIR)/joshissexy.$(MAN3EXT) \
	  lib/joshissexy/Controller/Admin.pm $(INST_MAN3DIR)/joshissexy::Controller::Admin.$(MAN3EXT) \
	  lib/joshissexyDB/UserRoles.pm $(INST_MAN3DIR)/joshissexyDB::UserRoles.$(MAN3EXT) \
	  lib/joshissexy/Controller/Root.pm $(INST_MAN3DIR)/joshissexy::Controller::Root.$(MAN3EXT) \
	  lib/joshissexyDB/News.pm $(INST_MAN3DIR)/joshissexyDB::News.$(MAN3EXT) \
	  lib/joshissexyDB.pm $(INST_MAN3DIR)/joshissexyDB.$(MAN3EXT) \
	  lib/joshissexyDB/Comments.pm $(INST_MAN3DIR)/joshissexyDB::Comments.$(MAN3EXT) \
	  lib/joshissexyDB/Users.pm $(INST_MAN3DIR)/joshissexyDB::Users.$(MAN3EXT) \
	  lib/joshissexy/View/TT.pm $(INST_MAN3DIR)/joshissexy::View::TT.$(MAN3EXT) 




# --- MakeMaker processPL section:


# --- MakeMaker installbin section:

EXE_FILES = script/joshissexy_cgi.pl script/joshissexy_create.pl script/joshissexy_fastcgi.pl script/joshissexy_server.pl script/joshissexy_test.pl

pure_all :: $(INST_SCRIPT)/joshissexy_fastcgi.pl $(INST_SCRIPT)/joshissexy_test.pl $(INST_SCRIPT)/joshissexy_create.pl $(INST_SCRIPT)/joshissexy_cgi.pl $(INST_SCRIPT)/joshissexy_server.pl
	$(NOECHO) $(NOOP)

realclean ::
	$(RM_F) \
	  $(INST_SCRIPT)/joshissexy_fastcgi.pl $(INST_SCRIPT)/joshissexy_test.pl \
	  $(INST_SCRIPT)/joshissexy_create.pl $(INST_SCRIPT)/joshissexy_cgi.pl \
	  $(INST_SCRIPT)/joshissexy_server.pl 

$(INST_SCRIPT)/joshissexy_fastcgi.pl : script/joshissexy_fastcgi.pl $(FIRST_MAKEFILE) $(INST_SCRIPT)$(DFSEP).exists $(INST_BIN)$(DFSEP).exists
	$(NOECHO) $(RM_F) $(INST_SCRIPT)/joshissexy_fastcgi.pl
	$(CP) script/joshissexy_fastcgi.pl $(INST_SCRIPT)/joshissexy_fastcgi.pl
	$(FIXIN) $(INST_SCRIPT)/joshissexy_fastcgi.pl
	-$(NOECHO) $(CHMOD) $(PERM_RWX) $(INST_SCRIPT)/joshissexy_fastcgi.pl

$(INST_SCRIPT)/joshissexy_test.pl : script/joshissexy_test.pl $(FIRST_MAKEFILE) $(INST_SCRIPT)$(DFSEP).exists $(INST_BIN)$(DFSEP).exists
	$(NOECHO) $(RM_F) $(INST_SCRIPT)/joshissexy_test.pl
	$(CP) script/joshissexy_test.pl $(INST_SCRIPT)/joshissexy_test.pl
	$(FIXIN) $(INST_SCRIPT)/joshissexy_test.pl
	-$(NOECHO) $(CHMOD) $(PERM_RWX) $(INST_SCRIPT)/joshissexy_test.pl

$(INST_SCRIPT)/joshissexy_create.pl : script/joshissexy_create.pl $(FIRST_MAKEFILE) $(INST_SCRIPT)$(DFSEP).exists $(INST_BIN)$(DFSEP).exists
	$(NOECHO) $(RM_F) $(INST_SCRIPT)/joshissexy_create.pl
	$(CP) script/joshissexy_create.pl $(INST_SCRIPT)/joshissexy_create.pl
	$(FIXIN) $(INST_SCRIPT)/joshissexy_create.pl
	-$(NOECHO) $(CHMOD) $(PERM_RWX) $(INST_SCRIPT)/joshissexy_create.pl

$(INST_SCRIPT)/joshissexy_cgi.pl : script/joshissexy_cgi.pl $(FIRST_MAKEFILE) $(INST_SCRIPT)$(DFSEP).exists $(INST_BIN)$(DFSEP).exists
	$(NOECHO) $(RM_F) $(INST_SCRIPT)/joshissexy_cgi.pl
	$(CP) script/joshissexy_cgi.pl $(INST_SCRIPT)/joshissexy_cgi.pl
	$(FIXIN) $(INST_SCRIPT)/joshissexy_cgi.pl
	-$(NOECHO) $(CHMOD) $(PERM_RWX) $(INST_SCRIPT)/joshissexy_cgi.pl

$(INST_SCRIPT)/joshissexy_server.pl : script/joshissexy_server.pl $(FIRST_MAKEFILE) $(INST_SCRIPT)$(DFSEP).exists $(INST_BIN)$(DFSEP).exists
	$(NOECHO) $(RM_F) $(INST_SCRIPT)/joshissexy_server.pl
	$(CP) script/joshissexy_server.pl $(INST_SCRIPT)/joshissexy_server.pl
	$(FIXIN) $(INST_SCRIPT)/joshissexy_server.pl
	-$(NOECHO) $(CHMOD) $(PERM_RWX) $(INST_SCRIPT)/joshissexy_server.pl



# --- MakeMaker subdirs section:

# none

# --- MakeMaker clean_subdirs section:
clean_subdirs :
	$(NOECHO) $(NOOP)


# --- MakeMaker clean section:

# Delete temporary files but do not touch installed files. We don't delete
# the Makefile here so a later make realclean still has a makefile to use.

clean :: clean_subdirs
	- $(RM_F) \
	  *$(LIB_EXT) core \
	  core.[0-9] $(INST_ARCHAUTODIR)/extralibs.all \
	  core.[0-9][0-9] $(BASEEXT).bso \
	  pm_to_blib.ts core.[0-9][0-9][0-9][0-9] \
	  $(BASEEXT).x $(BOOTSTRAP) \
	  perl$(EXE_EXT) tmon.out \
	  *$(OBJ_EXT) pm_to_blib \
	  $(INST_ARCHAUTODIR)/extralibs.ld blibdirs.ts \
	  core.[0-9][0-9][0-9][0-9][0-9] *perl.core \
	  core.*perl.*.? $(MAKE_APERL_FILE) \
	  perl $(BASEEXT).def \
	  core.[0-9][0-9][0-9] mon.out \
	  lib$(BASEEXT).def perlmain.c \
	  perl.exe so_locations \
	  $(BASEEXT).exp 
	- $(RM_RF) \
	  blib 
	- $(MV) $(FIRST_MAKEFILE) $(MAKEFILE_OLD) $(DEV_NULL)


# --- MakeMaker realclean_subdirs section:
realclean_subdirs :
	$(NOECHO) $(NOOP)


# --- MakeMaker realclean section:
# Delete temporary files (via clean) and also delete dist files
realclean purge ::  clean realclean_subdirs
	- $(RM_F) \
	  $(MAKEFILE_OLD) $(FIRST_MAKEFILE) 
	- $(RM_RF) \
	  $(DISTVNAME) 


# --- MakeMaker metafile section:
metafile:
	$(NOECHO) $(NOOP)


# --- MakeMaker signature section:
signature :
	cpansign -s


# --- MakeMaker dist_basics section:
distclean :: realclean distcheck
	$(NOECHO) $(NOOP)

distcheck :
	$(PERLRUN) "-MExtUtils::Manifest=fullcheck" -e fullcheck

skipcheck :
	$(PERLRUN) "-MExtUtils::Manifest=skipcheck" -e skipcheck

manifest :
	$(PERLRUN) "-MExtUtils::Manifest=mkmanifest" -e mkmanifest

veryclean : realclean
	$(RM_F) *~ *.orig */*~ */*.orig



# --- MakeMaker dist_core section:

dist : $(DIST_DEFAULT) $(FIRST_MAKEFILE)
	$(NOECHO) $(ABSPERLRUN) -l -e 'print '\''Warning: Makefile possibly out of date with $(VERSION_FROM)'\''' \
	  -e '    if -e '\''$(VERSION_FROM)'\'' and -M '\''$(VERSION_FROM)'\'' < -M '\''$(FIRST_MAKEFILE)'\'';'

tardist : $(DISTVNAME).tar$(SUFFIX)
	$(NOECHO) $(NOOP)

uutardist : $(DISTVNAME).tar$(SUFFIX)
	uuencode $(DISTVNAME).tar$(SUFFIX) $(DISTVNAME).tar$(SUFFIX) > $(DISTVNAME).tar$(SUFFIX)_uu

$(DISTVNAME).tar$(SUFFIX) : distdir
	$(PREOP)
	$(TO_UNIX)
	$(TAR) $(TARFLAGS) $(DISTVNAME).tar $(DISTVNAME)
	$(RM_RF) $(DISTVNAME)
	$(COMPRESS) $(DISTVNAME).tar
	$(POSTOP)

zipdist : $(DISTVNAME).zip
	$(NOECHO) $(NOOP)

$(DISTVNAME).zip : distdir
	$(PREOP)
	$(ZIP) $(ZIPFLAGS) $(DISTVNAME).zip $(DISTVNAME)
	$(RM_RF) $(DISTVNAME)
	$(POSTOP)

shdist : distdir
	$(PREOP)
	$(SHAR) $(DISTVNAME) > $(DISTVNAME).shar
	$(RM_RF) $(DISTVNAME)
	$(POSTOP)


# --- MakeMaker distdir section:
create_distdir :
	$(RM_RF) $(DISTVNAME)
	$(PERLRUN) "-MExtUtils::Manifest=manicopy,maniread" \
		-e "manicopy(maniread(),'$(DISTVNAME)', '$(DIST_CP)');"

distdir : create_distdir  
	$(NOECHO) $(NOOP)



# --- MakeMaker dist_test section:
disttest : distdir
	cd $(DISTVNAME) && $(ABSPERLRUN) Makefile.PL 
	cd $(DISTVNAME) && $(MAKE) $(PASTHRU)
	cd $(DISTVNAME) && $(MAKE) test $(PASTHRU)



# --- MakeMaker dist_ci section:

ci :
	$(PERLRUN) "-MExtUtils::Manifest=maniread" \
	  -e "@all = keys %{ maniread() };" \
	  -e "print(qq{Executing $(CI) @all\n}); system(qq{$(CI) @all});" \
	  -e "print(qq{Executing $(RCS_LABEL) ...\n}); system(qq{$(RCS_LABEL) @all});"


# --- MakeMaker distmeta section:
distmeta : create_distdir metafile
	$(NOECHO) cd $(DISTVNAME) && $(ABSPERLRUN) -MExtUtils::Manifest=maniadd -e 'eval { maniadd({q{META.yml} => q{Module meta-data (added by MakeMaker)}}) } ' \
	  -e '    or print "Could not add META.yml to MANIFEST: $${'\''@'\''}\n"'



# --- MakeMaker distsignature section:
distsignature : create_distdir
	$(NOECHO) cd $(DISTVNAME) && $(ABSPERLRUN) -MExtUtils::Manifest=maniadd -e 'eval { maniadd({q{SIGNATURE} => q{Public-key signature (added by MakeMaker)}}) } ' \
	  -e '    or print "Could not add SIGNATURE to MANIFEST: $${'\''@'\''}\n"'
	$(NOECHO) cd $(DISTVNAME) && $(TOUCH) SIGNATURE
	cd $(DISTVNAME) && cpansign -s



# --- MakeMaker install section:

install :: all pure_install doc_install
	$(NOECHO) $(NOOP)

install_perl :: all pure_perl_install doc_perl_install
	$(NOECHO) $(NOOP)

install_site :: all pure_site_install doc_site_install
	$(NOECHO) $(NOOP)

install_vendor :: all pure_vendor_install doc_vendor_install
	$(NOECHO) $(NOOP)

pure_install :: pure_$(INSTALLDIRS)_install
	$(NOECHO) $(NOOP)

doc_install :: doc_$(INSTALLDIRS)_install
	$(NOECHO) $(NOOP)

pure__install : pure_site_install
	$(NOECHO) $(ECHO) INSTALLDIRS not defined, defaulting to INSTALLDIRS=site

doc__install : doc_site_install
	$(NOECHO) $(ECHO) INSTALLDIRS not defined, defaulting to INSTALLDIRS=site

pure_perl_install ::
	$(NOECHO) umask 022; $(MOD_INSTALL) \
		$(INST_LIB) $(DESTINSTALLPRIVLIB) \
		$(INST_ARCHLIB) $(DESTINSTALLARCHLIB) \
		$(INST_BIN) $(DESTINSTALLBIN) \
		$(INST_SCRIPT) $(DESTINSTALLSCRIPT) \
		$(INST_MAN1DIR) $(DESTINSTALLMAN1DIR) \
		$(INST_MAN3DIR) $(DESTINSTALLMAN3DIR)
	$(NOECHO) $(WARN_IF_OLD_PACKLIST) \
		$(SITEARCHEXP)/auto/$(FULLEXT)


pure_site_install ::
	$(NOECHO) umask 02; $(MOD_INSTALL) \
		read $(SITEARCHEXP)/auto/$(FULLEXT)/.packlist \
		write $(DESTINSTALLSITEARCH)/auto/$(FULLEXT)/.packlist \
		$(INST_LIB) $(DESTINSTALLSITELIB) \
		$(INST_ARCHLIB) $(DESTINSTALLSITEARCH) \
		$(INST_BIN) $(DESTINSTALLSITEBIN) \
		$(INST_SCRIPT) $(DESTINSTALLSITESCRIPT) \
		$(INST_MAN1DIR) $(DESTINSTALLSITEMAN1DIR) \
		$(INST_MAN3DIR) $(DESTINSTALLSITEMAN3DIR)
	$(NOECHO) $(WARN_IF_OLD_PACKLIST) \
		$(PERL_ARCHLIB)/auto/$(FULLEXT)

pure_vendor_install ::
	$(NOECHO) umask 022; $(MOD_INSTALL) \
		$(INST_LIB) $(DESTINSTALLVENDORLIB) \
		$(INST_ARCHLIB) $(DESTINSTALLVENDORARCH) \
		$(INST_BIN) $(DESTINSTALLVENDORBIN) \
		$(INST_SCRIPT) $(DESTINSTALLVENDORSCRIPT) \
		$(INST_MAN1DIR) $(DESTINSTALLVENDORMAN1DIR) \
		$(INST_MAN3DIR) $(DESTINSTALLVENDORMAN3DIR)

doc_perl_install ::

doc_site_install ::
	$(NOECHO) $(ECHO) Appending installation info to $(DESTINSTALLSITEARCH)/perllocal.pod
	-$(NOECHO) umask 02; $(MKPATH) $(DESTINSTALLSITEARCH)
	-$(NOECHO) umask 02; $(DOC_INSTALL) \
		"Module" "$(NAME)" \
		"installed into" "$(INSTALLSITELIB)" \
		LINKTYPE "$(LINKTYPE)" \
		VERSION "$(VERSION)" \
		EXE_FILES "$(EXE_FILES)" \
		>> $(DESTINSTALLSITEARCH)/perllocal.pod

doc_vendor_install ::


uninstall :: uninstall_from_$(INSTALLDIRS)dirs
	$(NOECHO) $(NOOP)

uninstall_from_perldirs ::

uninstall_from_sitedirs ::
	$(NOECHO) $(UNINSTALL) $(SITEARCHEXP)/auto/$(FULLEXT)/.packlist

uninstall_from_vendordirs ::



# --- MakeMaker force section:
# Phony target to force checking subdirectories.
FORCE:
	$(NOECHO) $(NOOP)


# --- MakeMaker perldepend section:


# --- MakeMaker makefile section:
# We take a very conservative approach here, but it's worth it.
# We move Makefile to Makefile.old here to avoid gnu make looping.
$(FIRST_MAKEFILE) : Makefile.PL $(CONFIGDEP)
	$(NOECHO) $(ECHO) "Makefile out-of-date with respect to $?"
	$(NOECHO) $(ECHO) "Cleaning current config before rebuilding Makefile..."
	-$(NOECHO) $(RM_F) $(MAKEFILE_OLD)
	-$(NOECHO) $(MV)   $(FIRST_MAKEFILE) $(MAKEFILE_OLD)
	- $(MAKE) $(USEMAKEFILE) $(MAKEFILE_OLD) clean $(DEV_NULL)
	$(PERLRUN) Makefile.PL 
	$(NOECHO) $(ECHO) "==> Your Makefile has been rebuilt. <=="
	$(NOECHO) $(ECHO) "==> Please rerun the $(MAKE) command.  <=="
	false



# --- MakeMaker staticmake section:

# --- MakeMaker makeaperl section ---
MAP_TARGET    = perl
FULLPERL      = /usr/bin/perl

$(MAP_TARGET) :: static $(MAKE_APERL_FILE)
	$(MAKE) $(USEMAKEFILE) $(MAKE_APERL_FILE) $@

$(MAKE_APERL_FILE) : $(FIRST_MAKEFILE) pm_to_blib
	$(NOECHO) $(ECHO) Writing \"$(MAKE_APERL_FILE)\" for this $(MAP_TARGET)
	$(NOECHO) $(PERLRUNINST) \
		Makefile.PL DIR= \
		MAKEFILE=$(MAKE_APERL_FILE) LINKTYPE=static \
		MAKEAPERL=1 NORECURS=1 CCCDLFLAGS=


# --- MakeMaker test section:

TEST_VERBOSE=0
TEST_TYPE=test_$(LINKTYPE)
TEST_FILE = test.pl
TEST_FILES = t/01app.t t/02pod.t t/03podcoverage.t t/controller_Admin.t t/controller_News.t t/controller_Users.t t/model_joshissexyDB.t
TESTDB_SW = -d

testdb :: testdb_$(LINKTYPE)

test :: $(TEST_TYPE)

test_dynamic :: pure_all
	PERL_DL_NONLAZY=1 $(FULLPERLRUN) "-MExtUtils::Command::MM" "-e" "test_harness($(TEST_VERBOSE), 'inc', '$(INST_LIB)', '$(INST_ARCHLIB)')" $(TEST_FILES)

testdb_dynamic :: pure_all
	PERL_DL_NONLAZY=1 $(FULLPERLRUN) $(TESTDB_SW) "-Iinc" "-I$(INST_LIB)" "-I$(INST_ARCHLIB)" $(TEST_FILE)

test_ : test_dynamic

test_static :: test_dynamic
testdb_static :: testdb_dynamic


# --- MakeMaker ppd section:
# Creates a PPD (Perl Package Description) for a binary distribution.
ppd:
	$(NOECHO) $(ECHO) '<SOFTPKG NAME="$(DISTNAME)" VERSION="0,01,0,0">' > $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '    <TITLE>$(DISTNAME)</TITLE>' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '    <ABSTRACT>Catalyst based application</ABSTRACT>' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '    <AUTHOR>Josh Braegger, "arnie@geekahertz.org"</AUTHOR>' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '    <IMPLEMENTATION>' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <DEPENDENCY NAME="Catalyst" VERSION="5,7006,0,0" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <DEPENDENCY NAME="Catalyst-Action-RenderView" VERSION="0,0,0,0" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <DEPENDENCY NAME="Catalyst-Plugin-ConfigLoader" VERSION="0,0,0,0" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <DEPENDENCY NAME="Catalyst-Plugin-Static-Simple" VERSION="0,0,0,0" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <DEPENDENCY NAME="DBD-Pg" VERSION="0,0,0,0" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <DEPENDENCY NAME="DBIx-Class" VERSION="0,0,0,0" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <DEPENDENCY NAME="YAML" VERSION="0,0,0,0" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <OS NAME="$(OSNAME)" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <ARCHITECTURE NAME="i486-linux-gnu-thread-multi" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <CODEBASE HREF="" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '    </IMPLEMENTATION>' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '</SOFTPKG>' >> $(DISTNAME).ppd


# --- MakeMaker pm_to_blib section:

pm_to_blib : $(TO_INST_PM)
	$(NOECHO) $(ABSPERLRUN) -MExtUtils::Install -e 'pm_to_blib({@ARGV}, '\''$(INST_LIB)/auto'\'', '\''$(PM_FILTER)'\'')' \
	  lib/joshissexyDB/Roles.pm blib/lib/joshissexyDB/Roles.pm \
	  lib/joshissexy/Controller/News.pm blib/lib/joshissexy/Controller/News.pm \
	  lib/joshissexy/Model/joshissexyDB.pm blib/lib/joshissexy/Model/joshissexyDB.pm \
	  lib/joshissexy.pm blib/lib/joshissexy.pm \
	  lib/joshissexy/Controller/Admin.pm blib/lib/joshissexy/Controller/Admin.pm \
	  lib/joshissexyDB/UserRoles.pm blib/lib/joshissexyDB/UserRoles.pm \
	  lib/joshissexy/Controller/Root.pm blib/lib/joshissexy/Controller/Root.pm \
	  lib/joshissexyDB/News.pm blib/lib/joshissexyDB/News.pm \
	  lib/joshissexyDB.pm blib/lib/joshissexyDB.pm \
	  lib/joshissexyDB/Comments.pm blib/lib/joshissexyDB/Comments.pm \
	  lib/joshissexyDB/Users.pm blib/lib/joshissexyDB/Users.pm \
	  lib/joshissexy/View/TT.pm blib/lib/joshissexy/View/TT.pm 
	$(NOECHO) $(TOUCH) pm_to_blib


# --- MakeMaker selfdocument section:


# --- MakeMaker postamble section:


# End.
# Postamble by Module::Install 0.63
# --- Module::Install::Admin::Makefile section:

realclean purge ::
	$(RM_F) $(DISTVNAME).tar$(SUFFIX)
	$(RM_RF) inc MANIFEST.bak _build
	$(PERL) -I. -MModule::Install::Admin -e "remove_meta()"

reset :: purge

upload :: test dist
	cpan-upload -verbose $(DISTVNAME).tar$(SUFFIX)

grok ::
	perldoc Module::Install

distsign ::
	cpansign -s

catalyst_par :: all
	$(NOECHO) $(PERL) -Ilib -Minc::Module::Install -MModule::Install::Catalyst -e"Catalyst::Module::Install::_catalyst_par( '', 'joshissexy', { CLASSES => [], CORE => 0, ENGINE => 'CGI', MULTIARCH => 0, SCRIPT => '', USAGE => q## } )"
# --- Module::Install::AutoInstall section:

config :: installdeps
	$(NOECHO) $(NOOP)

checkdeps ::
	$(PERL) Makefile.PL --checkdeps

installdeps ::
	$(PERL) Makefile.PL --config= --installdeps=DBD::Pg,0

