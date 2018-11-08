# set verbose level to info
__VERBOSE=4
__VERBOSE_LOG=$1

declare -a LOG_LEVELS
LOG_LEVELS=([0]="CRIT" [1]="ERROR" [2]="WARNING" [3]="INFO" [4]="DEBUG")

function .log () {
  local LEVEL=${1}
  shift
  if [ ${__VERBOSE} -ge ${LEVEL} ]; then
    echo "[ $(date "+%Y-%m-%d %H:%M:%S") ] [ ${LOG_LEVELS[$LEVEL]} ]" "$@" 2>&1 | tee -a ${__VERBOSE_LOG} # 1>&2
  fi
}

function .timer () {
    ## Set a timer to display duration ##
    # Usage:  Timer [start|stop]
    Tcmd=$1
    case $Tcmd in
        start|Start|START) _StartSecs=$(date +%s)
            ;;
        stop|Stop|STOP) _StopSecs=$(date +%s)
                [[ ! $_StartSecs ]] && echo "[Internal Error] $FUNCNAME did not record a start." && return
                _DiffSecs=$(($_StopSecs-$_StartSecs))
                #TimeLapse=$(date -u -d@"$_DiffSecs" +'%-Hh %-Mm %-Ss')
                TimeLapse=$(printf '%02d:%02d:%02d' $(($_DiffSecs / 3600)) $(($_DiffSecs % 3600 / 60)) $(($_DiffSecs % 60)))
                echo "[ $(date "+%Y-%m-%d %H:%M:%S") ] [ TIME ] $TimeLapse = $_DiffSecs seconds." 2>&1 | tee -a ${__VERBOSE_LOG}
            ;;
        *) echo "[Internal Error] $FUNCNAME: Unknown arg '$Tcmd'"
            ;;
    esac
}



