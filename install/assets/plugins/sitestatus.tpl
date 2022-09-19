/**
 * SiteStatus
 *
 * Site Status widget plugin for Evolution CMS
 * @author    Chris Hunton
 * @category    plugin
 * @version    1.0
 * @license	   http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)
 * @internal    @events OnManagerWelcomeRender,OnManagerMainFrameHeaderHTMLBlock
 * @internal    @installset base
 * @internal    @modx_category Dashboard
 * @author      Chris Hunton
 * @documentation Requirements: This plugin requires Evolution 1.4 or later
 * @link
 * @lastupdate  16/4/2022
 */

// get language
global $modx,$_lang;

/*Widget Box */
$output = '
<div class="container" style="top:3px;position: absolute;">
	<div class="row warning">
		Site is currently Offline
	</div>
</div>
';

$style = "
<style>
.warning
{
	-moz-border-radius: 6px;
	-webkit-border-radius: 6px;
	background-color: #ffe3e3;
	background-image: url(../assets/images/icons/note-exclamation.webp);
	background-position: 9px 0px;
	background-repeat: no-repeat;
	border: solid 1px #ff0000;
	border-radius: 6px;
	line-height: 18px;
	overflow: hidden;
	padding: 15px 60px;
	margin-left: 10px;
}
</style>
";

$e = &$modx->Event;

switch($e->name){
	case 'OnManagerMainFrameHeaderHTMLBlock':
		$cssOutput = '<link type="text/css" rel="stylesheet" href="../assets/templates/responsive/css/basic-style.css">';
		if ( !$modx->getConfig('site_status') ) $e->output($style);
	break;
case 'OnManagerWelcomeRender':
	if ( !$modx->getConfig('site_status') ) $e->output($output);
    break;
}
