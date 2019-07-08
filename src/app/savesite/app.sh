## -----------------------------------------------------------------------------
## Linux Scripts.
## SaveSite app functions
##
## @package ojullien\bash\app\savesite
## @license MIT <https://github.com/ojullien/bash-savesite/blob/master/LICENSE>
## -----------------------------------------------------------------------------

SaveSite::showHelp() {
    String::notice "Usage: $(basename "$0") [options] <directory 1> [directory 2 ...]"
    String::notice "\tSave a web site dir located in /var/www/"
    Option::showHelp
    String::notice "\t-d | --destination\tDestination folder. The default is /home/<user>"
    String::notice "\t<directory 1>\tConfiguration directory located in /var/www/"
    return 0
}

SaveSite::save() {

    # Parameters
    if (($# != 2)) || [[ -z "$1" ]] || [[ -z "$2" ]]; then
        String::error "Usage: SaveSite::save <source as folder path> <destination as folder path>"
        return 1
    fi

    # Init
    local sSource="$1" sDestination="$2"
    local m_Save=""
    local -i iReturn=1

    # Source does not exist
    if [[ ! -d "${m_APACHE2_DOCUMENTROOT}/${sSource}" ]]; then
        String::error "ERROR: Directory '${m_APACHE2_DOCUMENTROOT}/${sSource}' does not exist!"
        return 1
    fi

    # Destination does not exist
    if [[ ! -d "${sDestination}" ]]; then
        String::error "ERROR: Destination '${sDestination}' does not exist!"
        return 1
    fi

    # Change directory
    cd "${m_APACHE2_DOCUMENTROOT}" || return 18

    # Saving
    m_Save="${sDestination}/$(uname -n)-${sSource}-$(date +"%Y%m%d").tar.bz2"
    String::notice -n "Saving ${sSource} to ${m_Save}:"
    tar cjf "${m_Save}" "${sSource}"
    iReturn=$?
    String::checkReturnValueForTruthiness ${iReturn}

    # Go to previous directory
    cd - || return 18

    return ${iReturn}
}
