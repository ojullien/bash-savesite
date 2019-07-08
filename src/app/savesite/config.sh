## -----------------------------------------------------------------------------
## Linux Scripts.
## SaveSite app configuration file.
##
## @package ojullien\bash\app\savesite
## @license MIT <https://github.com/ojullien/bash-savesite/blob/master/LICENSE>
## -----------------------------------------------------------------------------

# Remove these 3 lines once you have configured this file
echo "The 'app/savesite/config.sh' file is not configured !!!"
String::error "The 'app/savesite/config.sh' file is not configured !!!"
exit 3

## -----------------------------------------------------------------------------
## Destination folder
## -----------------------------------------------------------------------------
readonly m_SAVESITE_DESTINATION_DEFAULT="/home/<user>" # You may update this constant !!!!
readonly m_APACHE2_DOCUMENTROOT="/var/www"

## -----------------------------------------------------------------------------
## Trace
## -----------------------------------------------------------------------------
SaveSite::trace() {
    String::separateLine
    String::notice "App configuration: saveSite"
    FileSystem::checkDir "\tDefault destination directory:\t${m_SAVESITE_DESTINATION_DEFAULT}" "${m_SAVESITE_DESTINATION_DEFAULT}"
    return 0
}
