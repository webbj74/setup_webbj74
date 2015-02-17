# Configures git
#  include setup_webbj74::gitconfig
class setup_webbj74::gitconfig {
  # General git usage
  git::config::global {
    'user.name': value => 'Jonathan Webb';
    'user.email': value => 'jonathan.webb@acquia.com';
    'github.user': value => 'webbj74';

    'core.pager': value => '/usr/bin/less -+$LESS -FRX';
    'core.editor': value => 'vim';

    'pager.log': value => '`brew --prefix git`/share/git-core/contrib/diff-highlight/diff-highlight | /usr/bin/less -+$LESS -FRX';
    'pager.show': value => '`brew --prefix git`/share/git-core/contrib/diff-highlight/diff-highlight | /usr/bin/less -+$LESS -FRX';
    'pager.diff': value => '`brew --prefix git`/share/git-core/contrib/diff-highlight/diff-highlight | /usr/bin/less -+$LESS -FRX';

    'color.ui': value => 'true'; # lint:ignore:quoted_booleans

    'pull.default': value => 'simple';
    'push.default': value => 'simple';
  }

  # Common Aliases
  git::config::global {
    'alias.la':       value => '"!git config -l | grep alias | cut -c 7-"';
    'alias.ls':       value => 'log --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%an]" --decorate';
    'alias.ll':       value => 'log --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%an]" --decorate --numstat';
    'alias.lnc':      value => 'log --pretty=format:"%h\\ %s\\ [%an]"';
    'alias.lds':      value => 'log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%an]" --decorate --date=short';
    'alias.ld':       value => 'log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%an]" --decorate --date=relative';
    'alias.le':       value => 'log --oneline --decorate';
    'alias.filelog':  value => 'log -u';
    'alias.fl':       value => 'log -u';
    'alias.f':        value => '"!git ls-files | grep -i"';
    'alias.graph':    value => 'log --all --graph --decorate --oneline -n30';
    'alias.grep':     value => 'grep -EIi';
    'alias.sync':     value => '"!f() { git checkout master && git fetch --all && git rebase upstream/master && git push -f origin master; }; f"';
    'alias.trim':     value => '"!f() { for GIT_TRIM_BRANCH in $(git branch --merged | egrep -v \"(\* | master$)\"); do git branch -d \"$GIT_TRIM_BRANCH\"; done; }; f"';
  }

  # Acquia-specifc helpers
  git::config::global {
    'alias.ahremote':        value => '"!f() { git remote -v | grep -m 1 \"acquia/support-cli\" | cut -f1 ; }; f"';
    'alias.ahtag':           value => '"!f() { git ls-remote --tags $(git ahremote) release-* | cut -f2  | sort | tail -n1 ; }; f"';
    'alias.changes':         value => '"!f() { git log --oneline --no-merges $(git ahtag)..master | grep -v \'Update CHANGELOG.md\'; }; f"';
    'alias.contribs':        value => '"!f() { git log --oneline --no-merges --pretty=format:\"%an\" $(git ahtag)..master | sort -u |  awk \'{print}\' ORS=\'++ \' | sed -e \'s/^/Contributions by: /\'; }; f"';
    'alias.merges':          value => '"!f() { git log --oneline --merges --simplify-merges --pretty=format:\"%B\" $(git ahtag)..master | egrep -v \'(^Merge|^$)\' | sed -e \'s/^/  * /\'; }; f"';
    'alias.prnotes':         value => '"!f() { echo \'This release:\' ; (egrep -B100 -m1 \'^release\' CHANGELOG.md | sed -e \'1d;$d\') && git contribs ; }; f"';
    # lint:ignore:single_quote_string_with_variables
    'alias.prod-release':    value => '"!f() { ACQUIA_REMOTE=$(git remote -v | grep -m 1 \"git@github.com:acquia/support-cli.git (push)\" | cut -f1) && RELEASE_TAG=$(date -u +release-%F-%H-%M) && git tag -a ${RELEASE_TAG} && git push ${ACQUIA_REMOTE} ${RELEASE_TAG} && git --no-pager log --pretty=format:\"%n%C(yellow)%h%Creset %s%Cblue [%an]%n       %Cred%d%Creset%n\" --decorate -1; }; f"';
    'alias.origin-release':  value => '"!f() { ACQUIA_REMOTE=$(git remote -v | grep -m 1 \"git@github.com:webbj74/support-cli.git (push)\" | cut -f1) && RELEASE_TAG=$(date -u +release-%F-%H-%M) && git tag -a ${RELEASE_TAG} && git push ${ACQUIA_REMOTE} ${RELEASE_TAG} && git --no-pager log --pretty=format:\"%n%C(yellow)%h%Creset %s%Cblue [%an]%n       %Cred%d%Creset%n\" --decorate -1; }; f"';
    'alias.prod-rollback':   value => '"!f() { ACQUIA_REMOTE=$(git remote -v | grep -m 1 \"git@github.com:acquia/support-cli.git (push)\" | cut -f1) && LATEST_TAG=$(git ls-remote --tags ${ACQUIA_REMOTE} release-* | cut -f2 | sort | tail -n1) && echo \"Rolling back ${LATEST_TAG}\" && git push ${ACQUIA_REMOTE} :${LATEST_TAG} && LATEST_TAG=$(git ls-remote --tags ${ACQUIA_REMOTE} release-* | cut -f2 | sort | tail -n1) && git --no-pager log --pretty=format:\"%nProd is now ${LATEST_TAG}%n%C(yellow)%h%Creset %s%Cblue [%an]%n       %Cred%d%Creset%n\" --decorate -1 ${LATEST_TAG}; }; f"';
    'alias.origin-rollback': value => '"!f() { ACQUIA_REMOTE=$(git remote -v | grep -m 1 \"git@github.com:webbj74/support-cli.git (push)\" | cut -f1) && LATEST_TAG=$(git ls-remote --tags ${ACQUIA_REMOTE} release-* | cut -f2 | sort | tail -n1) && echo \"Rolling back ${LATEST_TAG}\" && git push ${ACQUIA_REMOTE} :${LATEST_TAG} && LATEST_TAG=$(git ls-remote --tags ${ACQUIA_REMOTE} release-* | cut -f2 | sort | tail -n1) && git --no-pager log --pretty=format:\"%nProd is now ${LATEST_TAG}%n%C(yellow)%h%Creset %s%Cblue [%an]%n       %Cred%d%Creset%n\" --decorate -1 ${LATEST_TAG}; }; f"';
    # lint:endignore
  }

  $gitignore = "# Globally ignored files
#
# DO NOT EDIT - CONTENTS MANAGED BY BOXEN
#
.idea
.php-version
.ruby-version
.DS_Store
.DS_Store?
.Spotlight-V100
.Trashes
._*
Icon
Thumbs.db
ehthumbs.db
*.swp
*.swo
*.orig
*~
\\#*\\#
/tags
/.bundle/
"

  file { "/Users/${::boxen_user}/.gitignore-global":
    content => $gitignore,
  }

  Git::Config::Global <| title == 'core.excludesfile' |> {
    value   => "/Users/${::boxen_user}/.gitignore-global",
    require => File["/Users/${::boxen_user}/.gitignore-global"],
  }

  Git::Config::Global <| title == 'hub.protocol' |> {
    value => 'ssh',
  }

  # Command line includes
  boxen::env_script { 'git_prompt':
    source  => 'puppet:///modules/setup_webbj74/git_prompt.sh',
    priority => 'low',
  }
}
