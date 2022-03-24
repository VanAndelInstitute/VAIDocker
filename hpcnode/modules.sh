. /etc/sysconfig/modules/init.sh

if [ "$ENABLE_LMOD" == "0" ];then
  if [ `id -u` -ne 0 ]; then 
    MODULEPATH_TMP=/cm/local/modulefiles:/cm/shared/modulefiles
    PATH_TMP=/sbin:/usr/sbin:/cm/local/apps/environment-modules/3.2.10/bin
  else 
    MODULEPATH_TMP=/cm/local/modulefiles
    PATH_TMP=/cm/local/apps/environment-modules/3.2.10/bin
  fi
  if [ -z "${MODULEPATH}" ]; then
    MODULEPATH=${MODULEPATH_TMP}
    export MODULEPATH
  else
    if ! echo "X${MODULEPATH}Y" | grep -q "[X:]${MODULEPATH_TMP}[Y:]"; then 
      MODULEPATH=${MODULEPATH}:${MODULEPATH_TMP}
      export MODULEPATH
    fi 
  fi
  if [ -z "${PATH}" ]; then
    PATH=${PATH_TMP}
    export PATH
  else
    if ! echo "X${PATH}Y" | grep -q "[X:]${PATH_TMP}[Y:]"; then 
      PATH=${PATH}:${PATH_TMP}
      export PATH
    fi 
  fi
  unset MODULEPATH_TMP
  unset PATH_TMP
  #----------------------------------------------------------------------#
  # system-wide profile.modules                                          #
  # Initialize modules for all sh-derivative shells                      #
  #----------------------------------------------------------------------#
  trap "" 1 2 3

  case "$0" in
      -bash|bash|*/bash) . /cm/local/apps/environment-modules/3.2.10/Modules/default/init/bash ;; 
	 -ksh|ksh|*/ksh) . /cm/local/apps/environment-modules/3.2.10/Modules/default/init/ksh ;; 
	 -zsh|zsh|*/zsh) . /cm/local/apps/environment-modules/3.2.10/Modules/default/init/zsh ;;
		      *) . /cm/local/apps/environment-modules/3.2.10/Modules/default/init/sh ;; # sh and default for scripts
  esac

  trap 1 2 3
else
  # This section mainly exists for maintaining compatibility of 
  # healtchecks, metric collections and other scripts that source
  # modules.sh in both Lmod and Tmod environments.
  . /etc/sysconfig/modules/lmod/00-modulepath.sh
  . /etc/sysconfig/modules/lmod/z00-lmod.sh
  . /etc/sysconfig/modules/lmod/z01-default_modules.sh
fi
