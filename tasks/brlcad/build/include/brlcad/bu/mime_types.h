/**
 * Mime type definitions and mapping functions
 *
 * DO NOT EDIT THIS FILE DIRECTLY.
 *
 * Apply updates to mime.types, mime_cad.types, and mime.cmake
 *
 * The file misc/mime.types should be kept in sync with:
 * http://svn.apache.org/repos/asf/httpd/httpd/trunk/docs/conf/mime.types
 *
 * The file misc/mime_cad.types holds additions to the standard mime
 * types such as recognized geometry file formats. Any "local" mime
 * type definitions not part of the standard should be added there.
 *
 * The file src/libbu/mime.cmake is the code that generated this file.
 *
 * This file is generated from public domain data and is in the public domain.
 */

#ifndef BU_MIME_TYPES_H
#define BU_MIME_TYPES_H

#include "common.h"
#include "bu/defines.h"

__BEGIN_DECLS

typedef enum {
    BU_MIME_APPLICATION = 0,
    BU_MIME_AUDIO,
    BU_MIME_CHEMICAL,
    BU_MIME_IMAGE,
    BU_MIME_MESSAGE,
    BU_MIME_MODEL,
    BU_MIME_TEXT,
    BU_MIME_VIDEO,
    BU_MIME_X_DASH_CONFERENCE,
    BU_MIME_UNKNOWN
} bu_mime_context_t;


typedef enum {
    BU_MIME_APPLICATION_AUTO,
    BU_MIME_APPLICATION_ANDREW_DASH_INSET,
    BU_MIME_APPLICATION_APPLIXWARE,
    BU_MIME_APPLICATION_ATOMCAT_PLUS_XML,
    BU_MIME_APPLICATION_ATOMSVC_PLUS_XML,
    BU_MIME_APPLICATION_ATOM_PLUS_XML,
    BU_MIME_APPLICATION_CCXML_PLUS_XML,
    BU_MIME_APPLICATION_CDMI_DASH_CAPABILITY,
    BU_MIME_APPLICATION_CDMI_DASH_CONTAINER,
    BU_MIME_APPLICATION_CDMI_DASH_DOMAIN,
    BU_MIME_APPLICATION_CDMI_DASH_OBJECT,
    BU_MIME_APPLICATION_CDMI_DASH_QUEUE,
    BU_MIME_APPLICATION_CU_DASH_SEEME,
    BU_MIME_APPLICATION_DAVMOUNT_PLUS_XML,
    BU_MIME_APPLICATION_DOCBOOK_PLUS_XML,
    BU_MIME_APPLICATION_DSSC_PLUS_DER,
    BU_MIME_APPLICATION_DSSC_PLUS_XML,
    BU_MIME_APPLICATION_ECMASCRIPT,
    BU_MIME_APPLICATION_EMMA_PLUS_XML,
    BU_MIME_APPLICATION_EPUB_PLUS_ZIP,
    BU_MIME_APPLICATION_EXI,
    BU_MIME_APPLICATION_FONT_DASH_TDPFR,
    BU_MIME_APPLICATION_FONT_DASH_WOFF,
    BU_MIME_APPLICATION_GML_PLUS_XML,
    BU_MIME_APPLICATION_GPX_PLUS_XML,
    BU_MIME_APPLICATION_GXF,
    BU_MIME_APPLICATION_HYPERSTUDIO,
    BU_MIME_APPLICATION_INKML_PLUS_XML,
    BU_MIME_APPLICATION_IPFIX,
    BU_MIME_APPLICATION_JAVASCRIPT,
    BU_MIME_APPLICATION_JAVA_DASH_ARCHIVE,
    BU_MIME_APPLICATION_JAVA_DASH_SERIALIZED_DASH_OBJECT,
    BU_MIME_APPLICATION_JAVA_DASH_VM,
    BU_MIME_APPLICATION_JSON,
    BU_MIME_APPLICATION_JSONML_PLUS_JSON,
    BU_MIME_APPLICATION_LOST_PLUS_XML,
    BU_MIME_APPLICATION_MAC_DASH_BINHEX40,
    BU_MIME_APPLICATION_MAC_DASH_COMPACTPRO,
    BU_MIME_APPLICATION_MADS_PLUS_XML,
    BU_MIME_APPLICATION_MARC,
    BU_MIME_APPLICATION_MARCXML_PLUS_XML,
    BU_MIME_APPLICATION_MATHEMATICA,
    BU_MIME_APPLICATION_MATHML_PLUS_XML,
    BU_MIME_APPLICATION_MBOX,
    BU_MIME_APPLICATION_MEDIASERVERCONTROL_PLUS_XML,
    BU_MIME_APPLICATION_METALINK4_PLUS_XML,
    BU_MIME_APPLICATION_METALINK_PLUS_XML,
    BU_MIME_APPLICATION_METS_PLUS_XML,
    BU_MIME_APPLICATION_MODS_PLUS_XML,
    BU_MIME_APPLICATION_MP21,
    BU_MIME_APPLICATION_MP4,
    BU_MIME_APPLICATION_MSWORD,
    BU_MIME_APPLICATION_MXF,
    BU_MIME_APPLICATION_OCTET_DASH_STREAM,
    BU_MIME_APPLICATION_ODA,
    BU_MIME_APPLICATION_OEBPS_DASH_PACKAGE_PLUS_XML,
    BU_MIME_APPLICATION_OGG,
    BU_MIME_APPLICATION_OMDOC_PLUS_XML,
    BU_MIME_APPLICATION_ONENOTE,
    BU_MIME_APPLICATION_OXPS,
    BU_MIME_APPLICATION_PATCH_DASH_OPS_DASH_ERROR_PLUS_XML,
    BU_MIME_APPLICATION_PDF,
    BU_MIME_APPLICATION_PGP_DASH_ENCRYPTED,
    BU_MIME_APPLICATION_PGP_DASH_SIGNATURE,
    BU_MIME_APPLICATION_PICS_DASH_RULES,
    BU_MIME_APPLICATION_PKCS10,
    BU_MIME_APPLICATION_PKCS7_DASH_MIME,
    BU_MIME_APPLICATION_PKCS7_DASH_SIGNATURE,
    BU_MIME_APPLICATION_PKCS8,
    BU_MIME_APPLICATION_PKIXCMP,
    BU_MIME_APPLICATION_PKIX_DASH_ATTR_DASH_CERT,
    BU_MIME_APPLICATION_PKIX_DASH_CERT,
    BU_MIME_APPLICATION_PKIX_DASH_CRL,
    BU_MIME_APPLICATION_PKIX_DASH_PKIPATH,
    BU_MIME_APPLICATION_PLS_PLUS_XML,
    BU_MIME_APPLICATION_POSTSCRIPT,
    BU_MIME_APPLICATION_PRS_CWW,
    BU_MIME_APPLICATION_PSKC_PLUS_XML,
    BU_MIME_APPLICATION_RDF_PLUS_XML,
    BU_MIME_APPLICATION_REGINFO_PLUS_XML,
    BU_MIME_APPLICATION_RELAX_DASH_NG_DASH_COMPACT_DASH_SYNTAX,
    BU_MIME_APPLICATION_RESOURCE_DASH_LISTS_DASH_DIFF_PLUS_XML,
    BU_MIME_APPLICATION_RESOURCE_DASH_LISTS_PLUS_XML,
    BU_MIME_APPLICATION_RLS_DASH_SERVICES_PLUS_XML,
    BU_MIME_APPLICATION_RPKI_DASH_GHOSTBUSTERS,
    BU_MIME_APPLICATION_RPKI_DASH_MANIFEST,
    BU_MIME_APPLICATION_RPKI_DASH_ROA,
    BU_MIME_APPLICATION_RSD_PLUS_XML,
    BU_MIME_APPLICATION_RSS_PLUS_XML,
    BU_MIME_APPLICATION_RTF,
    BU_MIME_APPLICATION_SBML_PLUS_XML,
    BU_MIME_APPLICATION_SCVP_DASH_CV_DASH_REQUEST,
    BU_MIME_APPLICATION_SCVP_DASH_CV_DASH_RESPONSE,
    BU_MIME_APPLICATION_SCVP_DASH_VP_DASH_REQUEST,
    BU_MIME_APPLICATION_SCVP_DASH_VP_DASH_RESPONSE,
    BU_MIME_APPLICATION_SDP,
    BU_MIME_APPLICATION_SET_DASH_PAYMENT_DASH_INITIATION,
    BU_MIME_APPLICATION_SET_DASH_REGISTRATION_DASH_INITIATION,
    BU_MIME_APPLICATION_SHF_PLUS_XML,
    BU_MIME_APPLICATION_SMIL_PLUS_XML,
    BU_MIME_APPLICATION_SPARQL_DASH_QUERY,
    BU_MIME_APPLICATION_SPARQL_DASH_RESULTS_PLUS_XML,
    BU_MIME_APPLICATION_SRGS,
    BU_MIME_APPLICATION_SRGS_PLUS_XML,
    BU_MIME_APPLICATION_SRU_PLUS_XML,
    BU_MIME_APPLICATION_SSDL_PLUS_XML,
    BU_MIME_APPLICATION_SSML_PLUS_XML,
    BU_MIME_APPLICATION_TEI_PLUS_XML,
    BU_MIME_APPLICATION_THRAUD_PLUS_XML,
    BU_MIME_APPLICATION_TIMESTAMPED_DASH_DATA,
    BU_MIME_APPLICATION_VND_3GPP2_TCAP,
    BU_MIME_APPLICATION_VND_3GPP_PIC_DASH_BW_DASH_LARGE,
    BU_MIME_APPLICATION_VND_3GPP_PIC_DASH_BW_DASH_SMALL,
    BU_MIME_APPLICATION_VND_3GPP_PIC_DASH_BW_DASH_VAR,
    BU_MIME_APPLICATION_VND_3M_POST_DASH_IT_DASH_NOTES,
    BU_MIME_APPLICATION_VND_ACCPAC_SIMPLY_ASO,
    BU_MIME_APPLICATION_VND_ACCPAC_SIMPLY_IMP,
    BU_MIME_APPLICATION_VND_ACUCOBOL,
    BU_MIME_APPLICATION_VND_ACUCORP,
    BU_MIME_APPLICATION_VND_ADOBE_AIR_DASH_APPLICATION_DASH_INSTALLER_DASH_PACKAGE_PLUS_ZIP,
    BU_MIME_APPLICATION_VND_ADOBE_FORMSCENTRAL_FCDT,
    BU_MIME_APPLICATION_VND_ADOBE_FXP,
    BU_MIME_APPLICATION_VND_ADOBE_XDP_PLUS_XML,
    BU_MIME_APPLICATION_VND_ADOBE_XFDF,
    BU_MIME_APPLICATION_VND_AHEAD_SPACE,
    BU_MIME_APPLICATION_VND_AIRZIP_FILESECURE_AZF,
    BU_MIME_APPLICATION_VND_AIRZIP_FILESECURE_AZS,
    BU_MIME_APPLICATION_VND_AMAZON_EBOOK,
    BU_MIME_APPLICATION_VND_AMERICANDYNAMICS_ACC,
    BU_MIME_APPLICATION_VND_AMIGA_AMI,
    BU_MIME_APPLICATION_VND_ANDROID_PACKAGE_DASH_ARCHIVE,
    BU_MIME_APPLICATION_VND_ANSER_DASH_WEB_DASH_CERTIFICATE_DASH_ISSUE_DASH_INITIATION,
    BU_MIME_APPLICATION_VND_ANSER_DASH_WEB_DASH_FUNDS_DASH_TRANSFER_DASH_INITIATION,
    BU_MIME_APPLICATION_VND_ANTIX_GAME_DASH_COMPONENT,
    BU_MIME_APPLICATION_VND_APPLE_INSTALLER_PLUS_XML,
    BU_MIME_APPLICATION_VND_APPLE_MPEGURL,
    BU_MIME_APPLICATION_VND_ARISTANETWORKS_SWI,
    BU_MIME_APPLICATION_VND_ASTRAEA_DASH_SOFTWARE_IOTA,
    BU_MIME_APPLICATION_VND_AUDIOGRAPH,
    BU_MIME_APPLICATION_VND_BLUEICE_MULTIPASS,
    BU_MIME_APPLICATION_VND_BMI,
    BU_MIME_APPLICATION_VND_BUSINESSOBJECTS,
    BU_MIME_APPLICATION_VND_CHEMDRAW_PLUS_XML,
    BU_MIME_APPLICATION_VND_CHIPNUTS_KARAOKE_DASH_MMD,
    BU_MIME_APPLICATION_VND_CINDERELLA,
    BU_MIME_APPLICATION_VND_CLAYMORE,
    BU_MIME_APPLICATION_VND_CLOANTO_RP9,
    BU_MIME_APPLICATION_VND_CLONK_C4GROUP,
    BU_MIME_APPLICATION_VND_CLUETRUST_CARTOMOBILE_DASH_CONFIG,
    BU_MIME_APPLICATION_VND_CLUETRUST_CARTOMOBILE_DASH_CONFIG_DASH_PKG,
    BU_MIME_APPLICATION_VND_COMMONSPACE,
    BU_MIME_APPLICATION_VND_CONTACT_CMSG,
    BU_MIME_APPLICATION_VND_COSMOCALLER,
    BU_MIME_APPLICATION_VND_CRICK_CLICKER,
    BU_MIME_APPLICATION_VND_CRICK_CLICKER_KEYBOARD,
    BU_MIME_APPLICATION_VND_CRICK_CLICKER_PALETTE,
    BU_MIME_APPLICATION_VND_CRICK_CLICKER_TEMPLATE,
    BU_MIME_APPLICATION_VND_CRICK_CLICKER_WORDBANK,
    BU_MIME_APPLICATION_VND_CRITICALTOOLS_WBS_PLUS_XML,
    BU_MIME_APPLICATION_VND_CTC_DASH_POSML,
    BU_MIME_APPLICATION_VND_CUPS_DASH_PPD,
    BU_MIME_APPLICATION_VND_CURL_CAR,
    BU_MIME_APPLICATION_VND_CURL_PCURL,
    BU_MIME_APPLICATION_VND_DART,
    BU_MIME_APPLICATION_VND_DATA_DASH_VISION_RDZ,
    BU_MIME_APPLICATION_VND_DECE_DATA,
    BU_MIME_APPLICATION_VND_DECE_TTML_PLUS_XML,
    BU_MIME_APPLICATION_VND_DECE_UNSPECIFIED,
    BU_MIME_APPLICATION_VND_DECE_ZIP,
    BU_MIME_APPLICATION_VND_DENOVO_FCSELAYOUT_DASH_LINK,
    BU_MIME_APPLICATION_VND_DNA,
    BU_MIME_APPLICATION_VND_DOLBY_MLP,
    BU_MIME_APPLICATION_VND_DPGRAPH,
    BU_MIME_APPLICATION_VND_DREAMFACTORY,
    BU_MIME_APPLICATION_VND_DS_DASH_KEYPOINT,
    BU_MIME_APPLICATION_VND_DVB_AIT,
    BU_MIME_APPLICATION_VND_DVB_SERVICE,
    BU_MIME_APPLICATION_VND_DYNAGEO,
    BU_MIME_APPLICATION_VND_ECOWIN_CHART,
    BU_MIME_APPLICATION_VND_ENLIVEN,
    BU_MIME_APPLICATION_VND_EPSON_ESF,
    BU_MIME_APPLICATION_VND_EPSON_MSF,
    BU_MIME_APPLICATION_VND_EPSON_QUICKANIME,
    BU_MIME_APPLICATION_VND_EPSON_SALT,
    BU_MIME_APPLICATION_VND_EPSON_SSF,
    BU_MIME_APPLICATION_VND_ESZIGNO3_PLUS_XML,
    BU_MIME_APPLICATION_VND_EZPIX_DASH_ALBUM,
    BU_MIME_APPLICATION_VND_EZPIX_DASH_PACKAGE,
    BU_MIME_APPLICATION_VND_FDF,
    BU_MIME_APPLICATION_VND_FDSN_MSEED,
    BU_MIME_APPLICATION_VND_FDSN_SEED,
    BU_MIME_APPLICATION_VND_FLOGRAPHIT,
    BU_MIME_APPLICATION_VND_FLUXTIME_CLIP,
    BU_MIME_APPLICATION_VND_FRAMEMAKER,
    BU_MIME_APPLICATION_VND_FROGANS_FNC,
    BU_MIME_APPLICATION_VND_FROGANS_LTF,
    BU_MIME_APPLICATION_VND_FSC_WEBLAUNCH,
    BU_MIME_APPLICATION_VND_FUJITSU_OASYS,
    BU_MIME_APPLICATION_VND_FUJITSU_OASYS2,
    BU_MIME_APPLICATION_VND_FUJITSU_OASYS3,
    BU_MIME_APPLICATION_VND_FUJITSU_OASYSGP,
    BU_MIME_APPLICATION_VND_FUJITSU_OASYSPRS,
    BU_MIME_APPLICATION_VND_FUJIXEROX_DDD,
    BU_MIME_APPLICATION_VND_FUJIXEROX_DOCUWORKS,
    BU_MIME_APPLICATION_VND_FUJIXEROX_DOCUWORKS_BINDER,
    BU_MIME_APPLICATION_VND_FUZZYSHEET,
    BU_MIME_APPLICATION_VND_GENOMATIX_TUXEDO,
    BU_MIME_APPLICATION_VND_GEOGEBRA_FILE,
    BU_MIME_APPLICATION_VND_GEOGEBRA_TOOL,
    BU_MIME_APPLICATION_VND_GEOMETRY_DASH_EXPLORER,
    BU_MIME_APPLICATION_VND_GEONEXT,
    BU_MIME_APPLICATION_VND_GEOPLAN,
    BU_MIME_APPLICATION_VND_GEOSPACE,
    BU_MIME_APPLICATION_VND_GMX,
    BU_MIME_APPLICATION_VND_GOOGLE_DASH_EARTH_KML_PLUS_XML,
    BU_MIME_APPLICATION_VND_GOOGLE_DASH_EARTH_KMZ,
    BU_MIME_APPLICATION_VND_GRAFEQ,
    BU_MIME_APPLICATION_VND_GROOVE_DASH_ACCOUNT,
    BU_MIME_APPLICATION_VND_GROOVE_DASH_HELP,
    BU_MIME_APPLICATION_VND_GROOVE_DASH_IDENTITY_DASH_MESSAGE,
    BU_MIME_APPLICATION_VND_GROOVE_DASH_INJECTOR,
    BU_MIME_APPLICATION_VND_GROOVE_DASH_TOOL_DASH_MESSAGE,
    BU_MIME_APPLICATION_VND_GROOVE_DASH_TOOL_DASH_TEMPLATE,
    BU_MIME_APPLICATION_VND_GROOVE_DASH_VCARD,
    BU_MIME_APPLICATION_VND_HAL_PLUS_XML,
    BU_MIME_APPLICATION_VND_HANDHELD_DASH_ENTERTAINMENT_PLUS_XML,
    BU_MIME_APPLICATION_VND_HBCI,
    BU_MIME_APPLICATION_VND_HHE_LESSON_DASH_PLAYER,
    BU_MIME_APPLICATION_VND_HP_DASH_HPGL,
    BU_MIME_APPLICATION_VND_HP_DASH_HPID,
    BU_MIME_APPLICATION_VND_HP_DASH_HPS,
    BU_MIME_APPLICATION_VND_HP_DASH_JLYT,
    BU_MIME_APPLICATION_VND_HP_DASH_PCL,
    BU_MIME_APPLICATION_VND_HP_DASH_PCLXL,
    BU_MIME_APPLICATION_VND_HYDROSTATIX_SOF_DASH_DATA,
    BU_MIME_APPLICATION_VND_IBM_MINIPAY,
    BU_MIME_APPLICATION_VND_IBM_MODCAP,
    BU_MIME_APPLICATION_VND_IBM_RIGHTS_DASH_MANAGEMENT,
    BU_MIME_APPLICATION_VND_IBM_SECURE_DASH_CONTAINER,
    BU_MIME_APPLICATION_VND_ICCPROFILE,
    BU_MIME_APPLICATION_VND_IGLOADER,
    BU_MIME_APPLICATION_VND_IMMERVISION_DASH_IVP,
    BU_MIME_APPLICATION_VND_IMMERVISION_DASH_IVU,
    BU_MIME_APPLICATION_VND_INSORS_IGM,
    BU_MIME_APPLICATION_VND_INTERCON_FORMNET,
    BU_MIME_APPLICATION_VND_INTERGEO,
    BU_MIME_APPLICATION_VND_INTU_QBO,
    BU_MIME_APPLICATION_VND_INTU_QFX,
    BU_MIME_APPLICATION_VND_IPUNPLUGGED_RCPROFILE,
    BU_MIME_APPLICATION_VND_IREPOSITORY_PACKAGE_PLUS_XML,
    BU_MIME_APPLICATION_VND_ISAC_FCS,
    BU_MIME_APPLICATION_VND_IS_DASH_XPR,
    BU_MIME_APPLICATION_VND_JAM,
    BU_MIME_APPLICATION_VND_JCP_JAVAME_MIDLET_DASH_RMS,
    BU_MIME_APPLICATION_VND_JISP,
    BU_MIME_APPLICATION_VND_JOOST_JODA_DASH_ARCHIVE,
    BU_MIME_APPLICATION_VND_KAHOOTZ,
    BU_MIME_APPLICATION_VND_KDE_KARBON,
    BU_MIME_APPLICATION_VND_KDE_KCHART,
    BU_MIME_APPLICATION_VND_KDE_KFORMULA,
    BU_MIME_APPLICATION_VND_KDE_KIVIO,
    BU_MIME_APPLICATION_VND_KDE_KONTOUR,
    BU_MIME_APPLICATION_VND_KDE_KPRESENTER,
    BU_MIME_APPLICATION_VND_KDE_KSPREAD,
    BU_MIME_APPLICATION_VND_KDE_KWORD,
    BU_MIME_APPLICATION_VND_KENAMEAAPP,
    BU_MIME_APPLICATION_VND_KIDSPIRATION,
    BU_MIME_APPLICATION_VND_KINAR,
    BU_MIME_APPLICATION_VND_KOAN,
    BU_MIME_APPLICATION_VND_KODAK_DASH_DESCRIPTOR,
    BU_MIME_APPLICATION_VND_LAS_LAS_PLUS_XML,
    BU_MIME_APPLICATION_VND_LLAMAGRAPHICS_LIFE_DASH_BALANCE_DESKTOP,
    BU_MIME_APPLICATION_VND_LLAMAGRAPHICS_LIFE_DASH_BALANCE_EXCHANGE_PLUS_XML,
    BU_MIME_APPLICATION_VND_LOTUS_DASH_1_DASH_2_DASH_3,
    BU_MIME_APPLICATION_VND_LOTUS_DASH_APPROACH,
    BU_MIME_APPLICATION_VND_LOTUS_DASH_FREELANCE,
    BU_MIME_APPLICATION_VND_LOTUS_DASH_NOTES,
    BU_MIME_APPLICATION_VND_LOTUS_DASH_ORGANIZER,
    BU_MIME_APPLICATION_VND_LOTUS_DASH_SCREENCAM,
    BU_MIME_APPLICATION_VND_LOTUS_DASH_WORDPRO,
    BU_MIME_APPLICATION_VND_MACPORTS_PORTPKG,
    BU_MIME_APPLICATION_VND_MCD,
    BU_MIME_APPLICATION_VND_MEDCALCDATA,
    BU_MIME_APPLICATION_VND_MEDIASTATION_CDKEY,
    BU_MIME_APPLICATION_VND_MFER,
    BU_MIME_APPLICATION_VND_MFMP,
    BU_MIME_APPLICATION_VND_MICROGRAFX_FLO,
    BU_MIME_APPLICATION_VND_MICROGRAFX_IGX,
    BU_MIME_APPLICATION_VND_MIF,
    BU_MIME_APPLICATION_VND_MOBIUS_DAF,
    BU_MIME_APPLICATION_VND_MOBIUS_DIS,
    BU_MIME_APPLICATION_VND_MOBIUS_MBK,
    BU_MIME_APPLICATION_VND_MOBIUS_MQY,
    BU_MIME_APPLICATION_VND_MOBIUS_MSL,
    BU_MIME_APPLICATION_VND_MOBIUS_PLC,
    BU_MIME_APPLICATION_VND_MOBIUS_TXF,
    BU_MIME_APPLICATION_VND_MOPHUN_APPLICATION,
    BU_MIME_APPLICATION_VND_MOPHUN_CERTIFICATE,
    BU_MIME_APPLICATION_VND_MOZILLA_XUL_PLUS_XML,
    BU_MIME_APPLICATION_VND_MSEQ,
    BU_MIME_APPLICATION_VND_MS_DASH_ARTGALRY,
    BU_MIME_APPLICATION_VND_MS_DASH_CAB_DASH_COMPRESSED,
    BU_MIME_APPLICATION_VND_MS_DASH_EXCEL,
    BU_MIME_APPLICATION_VND_MS_DASH_EXCEL_ADDIN_MACROENABLED_12,
    BU_MIME_APPLICATION_VND_MS_DASH_EXCEL_SHEET_BINARY_MACROENABLED_12,
    BU_MIME_APPLICATION_VND_MS_DASH_EXCEL_SHEET_MACROENABLED_12,
    BU_MIME_APPLICATION_VND_MS_DASH_EXCEL_TEMPLATE_MACROENABLED_12,
    BU_MIME_APPLICATION_VND_MS_DASH_FONTOBJECT,
    BU_MIME_APPLICATION_VND_MS_DASH_HTMLHELP,
    BU_MIME_APPLICATION_VND_MS_DASH_IMS,
    BU_MIME_APPLICATION_VND_MS_DASH_LRM,
    BU_MIME_APPLICATION_VND_MS_DASH_OFFICETHEME,
    BU_MIME_APPLICATION_VND_MS_DASH_PKI_SECCAT,
    BU_MIME_APPLICATION_VND_MS_DASH_PKI_STL,
    BU_MIME_APPLICATION_VND_MS_DASH_POWERPOINT,
    BU_MIME_APPLICATION_VND_MS_DASH_POWERPOINT_ADDIN_MACROENABLED_12,
    BU_MIME_APPLICATION_VND_MS_DASH_POWERPOINT_PRESENTATION_MACROENABLED_12,
    BU_MIME_APPLICATION_VND_MS_DASH_POWERPOINT_SLIDESHOW_MACROENABLED_12,
    BU_MIME_APPLICATION_VND_MS_DASH_POWERPOINT_SLIDE_MACROENABLED_12,
    BU_MIME_APPLICATION_VND_MS_DASH_POWERPOINT_TEMPLATE_MACROENABLED_12,
    BU_MIME_APPLICATION_VND_MS_DASH_PROJECT,
    BU_MIME_APPLICATION_VND_MS_DASH_WORD_DOCUMENT_MACROENABLED_12,
    BU_MIME_APPLICATION_VND_MS_DASH_WORD_TEMPLATE_MACROENABLED_12,
    BU_MIME_APPLICATION_VND_MS_DASH_WORKS,
    BU_MIME_APPLICATION_VND_MS_DASH_WPL,
    BU_MIME_APPLICATION_VND_MS_DASH_XPSDOCUMENT,
    BU_MIME_APPLICATION_VND_MUSICIAN,
    BU_MIME_APPLICATION_VND_MUVEE_STYLE,
    BU_MIME_APPLICATION_VND_MYNFC,
    BU_MIME_APPLICATION_VND_NEUROLANGUAGE_NLU,
    BU_MIME_APPLICATION_VND_NITF,
    BU_MIME_APPLICATION_VND_NOBLENET_DASH_DIRECTORY,
    BU_MIME_APPLICATION_VND_NOBLENET_DASH_SEALER,
    BU_MIME_APPLICATION_VND_NOBLENET_DASH_WEB,
    BU_MIME_APPLICATION_VND_NOKIA_N_DASH_GAGE_DATA,
    BU_MIME_APPLICATION_VND_NOKIA_N_DASH_GAGE_SYMBIAN_INSTALL,
    BU_MIME_APPLICATION_VND_NOKIA_RADIO_DASH_PRESET,
    BU_MIME_APPLICATION_VND_NOKIA_RADIO_DASH_PRESETS,
    BU_MIME_APPLICATION_VND_NOVADIGM_EDM,
    BU_MIME_APPLICATION_VND_NOVADIGM_EDX,
    BU_MIME_APPLICATION_VND_NOVADIGM_EXT,
    BU_MIME_APPLICATION_VND_OASIS_OPENDOCUMENT_CHART,
    BU_MIME_APPLICATION_VND_OASIS_OPENDOCUMENT_CHART_DASH_TEMPLATE,
    BU_MIME_APPLICATION_VND_OASIS_OPENDOCUMENT_DATABASE,
    BU_MIME_APPLICATION_VND_OASIS_OPENDOCUMENT_FORMULA,
    BU_MIME_APPLICATION_VND_OASIS_OPENDOCUMENT_FORMULA_DASH_TEMPLATE,
    BU_MIME_APPLICATION_VND_OASIS_OPENDOCUMENT_GRAPHICS,
    BU_MIME_APPLICATION_VND_OASIS_OPENDOCUMENT_GRAPHICS_DASH_TEMPLATE,
    BU_MIME_APPLICATION_VND_OASIS_OPENDOCUMENT_IMAGE,
    BU_MIME_APPLICATION_VND_OASIS_OPENDOCUMENT_IMAGE_DASH_TEMPLATE,
    BU_MIME_APPLICATION_VND_OASIS_OPENDOCUMENT_PRESENTATION,
    BU_MIME_APPLICATION_VND_OASIS_OPENDOCUMENT_PRESENTATION_DASH_TEMPLATE,
    BU_MIME_APPLICATION_VND_OASIS_OPENDOCUMENT_SPREADSHEET,
    BU_MIME_APPLICATION_VND_OASIS_OPENDOCUMENT_SPREADSHEET_DASH_TEMPLATE,
    BU_MIME_APPLICATION_VND_OASIS_OPENDOCUMENT_TEXT,
    BU_MIME_APPLICATION_VND_OASIS_OPENDOCUMENT_TEXT_DASH_MASTER,
    BU_MIME_APPLICATION_VND_OASIS_OPENDOCUMENT_TEXT_DASH_TEMPLATE,
    BU_MIME_APPLICATION_VND_OASIS_OPENDOCUMENT_TEXT_DASH_WEB,
    BU_MIME_APPLICATION_VND_OLPC_DASH_SUGAR,
    BU_MIME_APPLICATION_VND_OMA_DD2_PLUS_XML,
    BU_MIME_APPLICATION_VND_OPENOFFICEORG_EXTENSION,
    BU_MIME_APPLICATION_VND_OPENXMLFORMATS_DASH_OFFICEDOCUMENT_PRESENTATIONML_PRESENTATION,
    BU_MIME_APPLICATION_VND_OPENXMLFORMATS_DASH_OFFICEDOCUMENT_PRESENTATIONML_SLIDE,
    BU_MIME_APPLICATION_VND_OPENXMLFORMATS_DASH_OFFICEDOCUMENT_PRESENTATIONML_SLIDESHOW,
    BU_MIME_APPLICATION_VND_OPENXMLFORMATS_DASH_OFFICEDOCUMENT_PRESENTATIONML_TEMPLATE,
    BU_MIME_APPLICATION_VND_OPENXMLFORMATS_DASH_OFFICEDOCUMENT_SPREADSHEETML_SHEET,
    BU_MIME_APPLICATION_VND_OPENXMLFORMATS_DASH_OFFICEDOCUMENT_SPREADSHEETML_TEMPLATE,
    BU_MIME_APPLICATION_VND_OPENXMLFORMATS_DASH_OFFICEDOCUMENT_WORDPROCESSINGML_DOCUMENT,
    BU_MIME_APPLICATION_VND_OPENXMLFORMATS_DASH_OFFICEDOCUMENT_WORDPROCESSINGML_TEMPLATE,
    BU_MIME_APPLICATION_VND_OSGEO_MAPGUIDE_PACKAGE,
    BU_MIME_APPLICATION_VND_OSGI_DP,
    BU_MIME_APPLICATION_VND_OSGI_SUBSYSTEM,
    BU_MIME_APPLICATION_VND_PALM,
    BU_MIME_APPLICATION_VND_PAWAAFILE,
    BU_MIME_APPLICATION_VND_PG_FORMAT,
    BU_MIME_APPLICATION_VND_PG_OSASLI,
    BU_MIME_APPLICATION_VND_PICSEL,
    BU_MIME_APPLICATION_VND_PMI_WIDGET,
    BU_MIME_APPLICATION_VND_POCKETLEARN,
    BU_MIME_APPLICATION_VND_POWERBUILDER6,
    BU_MIME_APPLICATION_VND_PREVIEWSYSTEMS_BOX,
    BU_MIME_APPLICATION_VND_PROTEUS_MAGAZINE,
    BU_MIME_APPLICATION_VND_PUBLISHARE_DASH_DELTA_DASH_TREE,
    BU_MIME_APPLICATION_VND_PVI_PTID1,
    BU_MIME_APPLICATION_VND_QUARK_QUARKXPRESS,
    BU_MIME_APPLICATION_VND_REALVNC_BED,
    BU_MIME_APPLICATION_VND_RECORDARE_MUSICXML,
    BU_MIME_APPLICATION_VND_RECORDARE_MUSICXML_PLUS_XML,
    BU_MIME_APPLICATION_VND_RIG_CRYPTONOTE,
    BU_MIME_APPLICATION_VND_RIM_COD,
    BU_MIME_APPLICATION_VND_RN_DASH_REALMEDIA,
    BU_MIME_APPLICATION_VND_RN_DASH_REALMEDIA_DASH_VBR,
    BU_MIME_APPLICATION_VND_ROUTE66_LINK66_PLUS_XML,
    BU_MIME_APPLICATION_VND_SAILINGTRACKER_TRACK,
    BU_MIME_APPLICATION_VND_SEEMAIL,
    BU_MIME_APPLICATION_VND_SEMA,
    BU_MIME_APPLICATION_VND_SEMD,
    BU_MIME_APPLICATION_VND_SEMF,
    BU_MIME_APPLICATION_VND_SHANA_INFORMED_FORMDATA,
    BU_MIME_APPLICATION_VND_SHANA_INFORMED_FORMTEMPLATE,
    BU_MIME_APPLICATION_VND_SHANA_INFORMED_INTERCHANGE,
    BU_MIME_APPLICATION_VND_SHANA_INFORMED_PACKAGE,
    BU_MIME_APPLICATION_VND_SIMTECH_DASH_MINDMAPPER,
    BU_MIME_APPLICATION_VND_SMAF,
    BU_MIME_APPLICATION_VND_SMART_TEACHER,
    BU_MIME_APPLICATION_VND_SOLENT_SDKM_PLUS_XML,
    BU_MIME_APPLICATION_VND_SPOTFIRE_DXP,
    BU_MIME_APPLICATION_VND_SPOTFIRE_SFS,
    BU_MIME_APPLICATION_VND_STARDIVISION_CALC,
    BU_MIME_APPLICATION_VND_STARDIVISION_DRAW,
    BU_MIME_APPLICATION_VND_STARDIVISION_IMPRESS,
    BU_MIME_APPLICATION_VND_STARDIVISION_MATH,
    BU_MIME_APPLICATION_VND_STARDIVISION_WRITER,
    BU_MIME_APPLICATION_VND_STARDIVISION_WRITER_DASH_GLOBAL,
    BU_MIME_APPLICATION_VND_STEPMANIA_PACKAGE,
    BU_MIME_APPLICATION_VND_STEPMANIA_STEPCHART,
    BU_MIME_APPLICATION_VND_SUN_XML_CALC,
    BU_MIME_APPLICATION_VND_SUN_XML_CALC_TEMPLATE,
    BU_MIME_APPLICATION_VND_SUN_XML_DRAW,
    BU_MIME_APPLICATION_VND_SUN_XML_DRAW_TEMPLATE,
    BU_MIME_APPLICATION_VND_SUN_XML_IMPRESS,
    BU_MIME_APPLICATION_VND_SUN_XML_IMPRESS_TEMPLATE,
    BU_MIME_APPLICATION_VND_SUN_XML_MATH,
    BU_MIME_APPLICATION_VND_SUN_XML_WRITER,
    BU_MIME_APPLICATION_VND_SUN_XML_WRITER_GLOBAL,
    BU_MIME_APPLICATION_VND_SUN_XML_WRITER_TEMPLATE,
    BU_MIME_APPLICATION_VND_SUS_DASH_CALENDAR,
    BU_MIME_APPLICATION_VND_SVD,
    BU_MIME_APPLICATION_VND_SYMBIAN_INSTALL,
    BU_MIME_APPLICATION_VND_SYNCML_DM_PLUS_WBXML,
    BU_MIME_APPLICATION_VND_SYNCML_DM_PLUS_XML,
    BU_MIME_APPLICATION_VND_SYNCML_PLUS_XML,
    BU_MIME_APPLICATION_VND_TAO_INTENT_DASH_MODULE_DASH_ARCHIVE,
    BU_MIME_APPLICATION_VND_TCPDUMP_PCAP,
    BU_MIME_APPLICATION_VND_TMOBILE_DASH_LIVETV,
    BU_MIME_APPLICATION_VND_TRID_TPT,
    BU_MIME_APPLICATION_VND_TRISCAPE_MXS,
    BU_MIME_APPLICATION_VND_TRUEAPP,
    BU_MIME_APPLICATION_VND_UFDL,
    BU_MIME_APPLICATION_VND_UIQ_THEME,
    BU_MIME_APPLICATION_VND_UMAJIN,
    BU_MIME_APPLICATION_VND_UNITY,
    BU_MIME_APPLICATION_VND_UOML_PLUS_XML,
    BU_MIME_APPLICATION_VND_VCX,
    BU_MIME_APPLICATION_VND_VISIO,
    BU_MIME_APPLICATION_VND_VISIONARY,
    BU_MIME_APPLICATION_VND_VSF,
    BU_MIME_APPLICATION_VND_WAP_WBXML,
    BU_MIME_APPLICATION_VND_WAP_WMLC,
    BU_MIME_APPLICATION_VND_WAP_WMLSCRIPTC,
    BU_MIME_APPLICATION_VND_WEBTURBO,
    BU_MIME_APPLICATION_VND_WOLFRAM_PLAYER,
    BU_MIME_APPLICATION_VND_WORDPERFECT,
    BU_MIME_APPLICATION_VND_WQD,
    BU_MIME_APPLICATION_VND_WT_STF,
    BU_MIME_APPLICATION_VND_XARA,
    BU_MIME_APPLICATION_VND_XFDL,
    BU_MIME_APPLICATION_VND_YAMAHA_HV_DASH_DIC,
    BU_MIME_APPLICATION_VND_YAMAHA_HV_DASH_SCRIPT,
    BU_MIME_APPLICATION_VND_YAMAHA_HV_DASH_VOICE,
    BU_MIME_APPLICATION_VND_YAMAHA_OPENSCOREFORMAT,
    BU_MIME_APPLICATION_VND_YAMAHA_OPENSCOREFORMAT_OSFPVG_PLUS_XML,
    BU_MIME_APPLICATION_VND_YAMAHA_SMAF_DASH_AUDIO,
    BU_MIME_APPLICATION_VND_YAMAHA_SMAF_DASH_PHRASE,
    BU_MIME_APPLICATION_VND_YELLOWRIVER_DASH_CUSTOM_DASH_MENU,
    BU_MIME_APPLICATION_VND_ZUL,
    BU_MIME_APPLICATION_VND_ZZAZZ_DECK_PLUS_XML,
    BU_MIME_APPLICATION_VOICEXML_PLUS_XML,
    BU_MIME_APPLICATION_WIDGET,
    BU_MIME_APPLICATION_WINHLP,
    BU_MIME_APPLICATION_WSDL_PLUS_XML,
    BU_MIME_APPLICATION_WSPOLICY_PLUS_XML,
    BU_MIME_APPLICATION_XAML_PLUS_XML,
    BU_MIME_APPLICATION_XCAP_DASH_DIFF_PLUS_XML,
    BU_MIME_APPLICATION_XENC_PLUS_XML,
    BU_MIME_APPLICATION_XHTML_PLUS_XML,
    BU_MIME_APPLICATION_XML,
    BU_MIME_APPLICATION_XML_DASH_DTD,
    BU_MIME_APPLICATION_XOP_PLUS_XML,
    BU_MIME_APPLICATION_XPROC_PLUS_XML,
    BU_MIME_APPLICATION_XSLT_PLUS_XML,
    BU_MIME_APPLICATION_XSPF_PLUS_XML,
    BU_MIME_APPLICATION_XV_PLUS_XML,
    BU_MIME_APPLICATION_X_DASH_7Z_DASH_COMPRESSED,
    BU_MIME_APPLICATION_X_DASH_ABIWORD,
    BU_MIME_APPLICATION_X_DASH_ACE_DASH_COMPRESSED,
    BU_MIME_APPLICATION_X_DASH_APPLE_DASH_DISKIMAGE,
    BU_MIME_APPLICATION_X_DASH_AUTHORWARE_DASH_BIN,
    BU_MIME_APPLICATION_X_DASH_AUTHORWARE_DASH_MAP,
    BU_MIME_APPLICATION_X_DASH_AUTHORWARE_DASH_SEG,
    BU_MIME_APPLICATION_X_DASH_BCPIO,
    BU_MIME_APPLICATION_X_DASH_BITTORRENT,
    BU_MIME_APPLICATION_X_DASH_BLORB,
    BU_MIME_APPLICATION_X_DASH_BZIP,
    BU_MIME_APPLICATION_X_DASH_BZIP2,
    BU_MIME_APPLICATION_X_DASH_CBR,
    BU_MIME_APPLICATION_X_DASH_CDLINK,
    BU_MIME_APPLICATION_X_DASH_CFS_DASH_COMPRESSED,
    BU_MIME_APPLICATION_X_DASH_CHAT,
    BU_MIME_APPLICATION_X_DASH_CHESS_DASH_PGN,
    BU_MIME_APPLICATION_X_DASH_CONFERENCE,
    BU_MIME_APPLICATION_X_DASH_CPIO,
    BU_MIME_APPLICATION_X_DASH_CSH,
    BU_MIME_APPLICATION_X_DASH_DEBIAN_DASH_PACKAGE,
    BU_MIME_APPLICATION_X_DASH_DGC_DASH_COMPRESSED,
    BU_MIME_APPLICATION_X_DASH_DIRECTOR,
    BU_MIME_APPLICATION_X_DASH_DOOM,
    BU_MIME_APPLICATION_X_DASH_DTBNCX_PLUS_XML,
    BU_MIME_APPLICATION_X_DASH_DTBOOK_PLUS_XML,
    BU_MIME_APPLICATION_X_DASH_DTBRESOURCE_PLUS_XML,
    BU_MIME_APPLICATION_X_DASH_DVI,
    BU_MIME_APPLICATION_X_DASH_ENVOY,
    BU_MIME_APPLICATION_X_DASH_EVA,
    BU_MIME_APPLICATION_X_DASH_FONT_DASH_BDF,
    BU_MIME_APPLICATION_X_DASH_FONT_DASH_GHOSTSCRIPT,
    BU_MIME_APPLICATION_X_DASH_FONT_DASH_LINUX_DASH_PSF,
    BU_MIME_APPLICATION_X_DASH_FONT_DASH_OTF,
    BU_MIME_APPLICATION_X_DASH_FONT_DASH_PCF,
    BU_MIME_APPLICATION_X_DASH_FONT_DASH_SNF,
    BU_MIME_APPLICATION_X_DASH_FONT_DASH_TTF,
    BU_MIME_APPLICATION_X_DASH_FONT_DASH_TYPE1,
    BU_MIME_APPLICATION_X_DASH_FREEARC,
    BU_MIME_APPLICATION_X_DASH_FUTURESPLASH,
    BU_MIME_APPLICATION_X_DASH_GCA_DASH_COMPRESSED,
    BU_MIME_APPLICATION_X_DASH_GLULX,
    BU_MIME_APPLICATION_X_DASH_GNUMERIC,
    BU_MIME_APPLICATION_X_DASH_GRAMPS_DASH_XML,
    BU_MIME_APPLICATION_X_DASH_GTAR,
    BU_MIME_APPLICATION_X_DASH_HDF,
    BU_MIME_APPLICATION_X_DASH_INSTALL_DASH_INSTRUCTIONS,
    BU_MIME_APPLICATION_X_DASH_ISO9660_DASH_IMAGE,
    BU_MIME_APPLICATION_X_DASH_JAVA_DASH_JNLP_DASH_FILE,
    BU_MIME_APPLICATION_X_DASH_LATEX,
    BU_MIME_APPLICATION_X_DASH_LZH_DASH_COMPRESSED,
    BU_MIME_APPLICATION_X_DASH_MIE,
    BU_MIME_APPLICATION_X_DASH_MOBIPOCKET_DASH_EBOOK,
    BU_MIME_APPLICATION_X_DASH_MSACCESS,
    BU_MIME_APPLICATION_X_DASH_MSBINDER,
    BU_MIME_APPLICATION_X_DASH_MSCARDFILE,
    BU_MIME_APPLICATION_X_DASH_MSCLIP,
    BU_MIME_APPLICATION_X_DASH_MSDOWNLOAD,
    BU_MIME_APPLICATION_X_DASH_MSMEDIAVIEW,
    BU_MIME_APPLICATION_X_DASH_MSMETAFILE,
    BU_MIME_APPLICATION_X_DASH_MSMONEY,
    BU_MIME_APPLICATION_X_DASH_MSPUBLISHER,
    BU_MIME_APPLICATION_X_DASH_MSSCHEDULE,
    BU_MIME_APPLICATION_X_DASH_MSTERMINAL,
    BU_MIME_APPLICATION_X_DASH_MSWRITE,
    BU_MIME_APPLICATION_X_DASH_MS_DASH_APPLICATION,
    BU_MIME_APPLICATION_X_DASH_MS_DASH_SHORTCUT,
    BU_MIME_APPLICATION_X_DASH_MS_DASH_WMD,
    BU_MIME_APPLICATION_X_DASH_MS_DASH_WMZ,
    BU_MIME_APPLICATION_X_DASH_MS_DASH_XBAP,
    BU_MIME_APPLICATION_X_DASH_NETCDF,
    BU_MIME_APPLICATION_X_DASH_NZB,
    BU_MIME_APPLICATION_X_DASH_PKCS12,
    BU_MIME_APPLICATION_X_DASH_PKCS7_DASH_CERTIFICATES,
    BU_MIME_APPLICATION_X_DASH_PKCS7_DASH_CERTREQRESP,
    BU_MIME_APPLICATION_X_DASH_RAR_DASH_COMPRESSED,
    BU_MIME_APPLICATION_X_DASH_RESEARCH_DASH_INFO_DASH_SYSTEMS,
    BU_MIME_APPLICATION_X_DASH_SH,
    BU_MIME_APPLICATION_X_DASH_SHAR,
    BU_MIME_APPLICATION_X_DASH_SHOCKWAVE_DASH_FLASH,
    BU_MIME_APPLICATION_X_DASH_SILVERLIGHT_DASH_APP,
    BU_MIME_APPLICATION_X_DASH_SQL,
    BU_MIME_APPLICATION_X_DASH_STUFFIT,
    BU_MIME_APPLICATION_X_DASH_STUFFITX,
    BU_MIME_APPLICATION_X_DASH_SUBRIP,
    BU_MIME_APPLICATION_X_DASH_SV4CPIO,
    BU_MIME_APPLICATION_X_DASH_SV4CRC,
    BU_MIME_APPLICATION_X_DASH_T3VM_DASH_IMAGE,
    BU_MIME_APPLICATION_X_DASH_TADS,
    BU_MIME_APPLICATION_X_DASH_TAR,
    BU_MIME_APPLICATION_X_DASH_TCL,
    BU_MIME_APPLICATION_X_DASH_TEX,
    BU_MIME_APPLICATION_X_DASH_TEXINFO,
    BU_MIME_APPLICATION_X_DASH_TEX_DASH_TFM,
    BU_MIME_APPLICATION_X_DASH_TGIF,
    BU_MIME_APPLICATION_X_DASH_USTAR,
    BU_MIME_APPLICATION_X_DASH_WAIS_DASH_SOURCE,
    BU_MIME_APPLICATION_X_DASH_X509_DASH_CA_DASH_CERT,
    BU_MIME_APPLICATION_X_DASH_XFIG,
    BU_MIME_APPLICATION_X_DASH_XLIFF_PLUS_XML,
    BU_MIME_APPLICATION_X_DASH_XPINSTALL,
    BU_MIME_APPLICATION_X_DASH_XZ,
    BU_MIME_APPLICATION_X_DASH_ZMACHINE,
    BU_MIME_APPLICATION_YANG,
    BU_MIME_APPLICATION_YIN_PLUS_XML,
    BU_MIME_APPLICATION_ZIP,
    BU_MIME_APPLICATION_UNKNOWN
} bu_mime_application_t;


typedef enum {
    BU_MIME_AUDIO_AUTO,
    BU_MIME_AUDIO_ADPCM,
    BU_MIME_AUDIO_BASIC,
    BU_MIME_AUDIO_MIDI,
    BU_MIME_AUDIO_MP4,
    BU_MIME_AUDIO_MPEG,
    BU_MIME_AUDIO_OGG,
    BU_MIME_AUDIO_S3M,
    BU_MIME_AUDIO_SILK,
    BU_MIME_AUDIO_VND_DECE_AUDIO,
    BU_MIME_AUDIO_VND_DIGITAL_DASH_WINDS,
    BU_MIME_AUDIO_VND_DRA,
    BU_MIME_AUDIO_VND_DTS,
    BU_MIME_AUDIO_VND_DTS_HD,
    BU_MIME_AUDIO_VND_LUCENT_VOICE,
    BU_MIME_AUDIO_VND_MS_DASH_PLAYREADY_MEDIA_PYA,
    BU_MIME_AUDIO_VND_NUERA_ECELP4800,
    BU_MIME_AUDIO_VND_NUERA_ECELP7470,
    BU_MIME_AUDIO_VND_NUERA_ECELP9600,
    BU_MIME_AUDIO_VND_RIP,
    BU_MIME_AUDIO_WEBM,
    BU_MIME_AUDIO_XM,
    BU_MIME_AUDIO_X_DASH_AAC,
    BU_MIME_AUDIO_X_DASH_AIFF,
    BU_MIME_AUDIO_X_DASH_CAF,
    BU_MIME_AUDIO_X_DASH_FLAC,
    BU_MIME_AUDIO_X_DASH_MATROSKA,
    BU_MIME_AUDIO_X_DASH_MPEGURL,
    BU_MIME_AUDIO_X_DASH_MS_DASH_WAX,
    BU_MIME_AUDIO_X_DASH_MS_DASH_WMA,
    BU_MIME_AUDIO_X_DASH_PN_DASH_REALAUDIO,
    BU_MIME_AUDIO_X_DASH_PN_DASH_REALAUDIO_DASH_PLUGIN,
    BU_MIME_AUDIO_X_DASH_WAV,
    BU_MIME_AUDIO_UNKNOWN
} bu_mime_audio_t;


typedef enum {
    BU_MIME_CHEMICAL_AUTO,
    BU_MIME_CHEMICAL_X_DASH_CDX,
    BU_MIME_CHEMICAL_X_DASH_CIF,
    BU_MIME_CHEMICAL_X_DASH_CMDF,
    BU_MIME_CHEMICAL_X_DASH_CML,
    BU_MIME_CHEMICAL_X_DASH_CSML,
    BU_MIME_CHEMICAL_X_DASH_XYZ,
    BU_MIME_CHEMICAL_UNKNOWN
} bu_mime_chemical_t;


typedef enum {
    BU_MIME_IMAGE_AUTO,
    BU_MIME_IMAGE_ALIAS,
    BU_MIME_IMAGE_BMP,
    BU_MIME_IMAGE_BW,
    BU_MIME_IMAGE_CGM,
    BU_MIME_IMAGE_CI,
    BU_MIME_IMAGE_DPIX,
    BU_MIME_IMAGE_G3FAX,
    BU_MIME_IMAGE_GIF,
    BU_MIME_IMAGE_IEF,
    BU_MIME_IMAGE_JPEG,
    BU_MIME_IMAGE_KTX,
    BU_MIME_IMAGE_PIX,
    BU_MIME_IMAGE_PNG,
    BU_MIME_IMAGE_PPM,
    BU_MIME_IMAGE_PRS_BTIF,
    BU_MIME_IMAGE_PS,
    BU_MIME_IMAGE_RLE,
    BU_MIME_IMAGE_SGI,
    BU_MIME_IMAGE_SPM,
    BU_MIME_IMAGE_SUN,
    BU_MIME_IMAGE_SVG_PLUS_XML,
    BU_MIME_IMAGE_TIFF,
    BU_MIME_IMAGE_VND_ADOBE_PHOTOSHOP,
    BU_MIME_IMAGE_VND_DECE_GRAPHIC,
    BU_MIME_IMAGE_VND_DJVU,
    BU_MIME_IMAGE_VND_DVB_SUBTITLE,
    BU_MIME_IMAGE_VND_DWG,
    BU_MIME_IMAGE_VND_DXF,
    BU_MIME_IMAGE_VND_FASTBIDSHEET,
    BU_MIME_IMAGE_VND_FPX,
    BU_MIME_IMAGE_VND_FST,
    BU_MIME_IMAGE_VND_FUJIXEROX_EDMICS_DASH_MMR,
    BU_MIME_IMAGE_VND_FUJIXEROX_EDMICS_DASH_RLC,
    BU_MIME_IMAGE_VND_MS_DASH_MODI,
    BU_MIME_IMAGE_VND_MS_DASH_PHOTO,
    BU_MIME_IMAGE_VND_NET_DASH_FPX,
    BU_MIME_IMAGE_VND_WAP_WBMP,
    BU_MIME_IMAGE_VND_XIFF,
    BU_MIME_IMAGE_WEBP,
    BU_MIME_IMAGE_X_DASH_3DS,
    BU_MIME_IMAGE_X_DASH_CMU_DASH_RASTER,
    BU_MIME_IMAGE_X_DASH_CMX,
    BU_MIME_IMAGE_X_DASH_FREEHAND,
    BU_MIME_IMAGE_X_DASH_ICON,
    BU_MIME_IMAGE_X_DASH_MRSID_DASH_IMAGE,
    BU_MIME_IMAGE_X_DASH_PCX,
    BU_MIME_IMAGE_X_DASH_PICT,
    BU_MIME_IMAGE_X_DASH_PORTABLE_DASH_ANYMAP,
    BU_MIME_IMAGE_X_DASH_PORTABLE_DASH_BITMAP,
    BU_MIME_IMAGE_X_DASH_PORTABLE_DASH_GRAYMAP,
    BU_MIME_IMAGE_X_DASH_PORTABLE_DASH_PIXMAP,
    BU_MIME_IMAGE_X_DASH_RGB,
    BU_MIME_IMAGE_X_DASH_TGA,
    BU_MIME_IMAGE_X_DASH_XBITMAP,
    BU_MIME_IMAGE_X_DASH_XPIXMAP,
    BU_MIME_IMAGE_X_DASH_XWINDOWDUMP,
    BU_MIME_IMAGE_YUV,
    BU_MIME_IMAGE_UNKNOWN
} bu_mime_image_t;


typedef enum {
    BU_MIME_MESSAGE_AUTO,
    BU_MIME_MESSAGE_RFC822,
    BU_MIME_MESSAGE_UNKNOWN
} bu_mime_message_t;


typedef enum {
    BU_MIME_MODEL_AUTO,
    BU_MIME_MODEL_DXF,
    BU_MIME_MODEL_IGES,
    BU_MIME_MODEL_MESH,
    BU_MIME_MODEL_OBJ,
    BU_MIME_MODEL_PLY,
    BU_MIME_MODEL_SHP,
    BU_MIME_MODEL_STEP,
    BU_MIME_MODEL_STL,
    BU_MIME_MODEL_VND_BRLCAD_PLUS_BINARY,
    BU_MIME_MODEL_VND_BRLCAD_PLUS_TCL,
    BU_MIME_MODEL_VND_COLLADA_PLUS_XML,
    BU_MIME_MODEL_VND_DWF,
    BU_MIME_MODEL_VND_FASTGEN,
    BU_MIME_MODEL_VND_GDL,
    BU_MIME_MODEL_VND_GIFT,
    BU_MIME_MODEL_VND_GTW,
    BU_MIME_MODEL_VND_INTAVAL,
    BU_MIME_MODEL_VND_MTS,
    BU_MIME_MODEL_VND_RHINO,
    BU_MIME_MODEL_VND_VTU,
    BU_MIME_MODEL_VRML,
    BU_MIME_MODEL_X3D_PLUS_BINARY,
    BU_MIME_MODEL_X3D_PLUS_VRML,
    BU_MIME_MODEL_X3D_PLUS_XML,
    BU_MIME_MODEL_UNKNOWN
} bu_mime_model_t;


typedef enum {
    BU_MIME_TEXT_AUTO,
    BU_MIME_TEXT_CACHE_DASH_MANIFEST,
    BU_MIME_TEXT_CALENDAR,
    BU_MIME_TEXT_CSS,
    BU_MIME_TEXT_CSV,
    BU_MIME_TEXT_HTML,
    BU_MIME_TEXT_N3,
    BU_MIME_TEXT_PLAIN,
    BU_MIME_TEXT_PRS_LINES_TAG,
    BU_MIME_TEXT_RICHTEXT,
    BU_MIME_TEXT_SGML,
    BU_MIME_TEXT_TAB_DASH_SEPARATED_DASH_VALUES,
    BU_MIME_TEXT_TROFF,
    BU_MIME_TEXT_TURTLE,
    BU_MIME_TEXT_URI_DASH_LIST,
    BU_MIME_TEXT_VCARD,
    BU_MIME_TEXT_VND_CURL,
    BU_MIME_TEXT_VND_CURL_DCURL,
    BU_MIME_TEXT_VND_CURL_MCURL,
    BU_MIME_TEXT_VND_CURL_SCURL,
    BU_MIME_TEXT_VND_DVB_SUBTITLE,
    BU_MIME_TEXT_VND_FLY,
    BU_MIME_TEXT_VND_FMI_FLEXSTOR,
    BU_MIME_TEXT_VND_GRAPHVIZ,
    BU_MIME_TEXT_VND_IN3D_3DML,
    BU_MIME_TEXT_VND_IN3D_SPOT,
    BU_MIME_TEXT_VND_SUN_J2ME_APP_DASH_DESCRIPTOR,
    BU_MIME_TEXT_VND_WAP_WML,
    BU_MIME_TEXT_VND_WAP_WMLSCRIPT,
    BU_MIME_TEXT_X_DASH_ASM,
    BU_MIME_TEXT_X_DASH_C,
    BU_MIME_TEXT_X_DASH_FORTRAN,
    BU_MIME_TEXT_X_DASH_JAVA_DASH_SOURCE,
    BU_MIME_TEXT_X_DASH_NFO,
    BU_MIME_TEXT_X_DASH_OPML,
    BU_MIME_TEXT_X_DASH_PASCAL,
    BU_MIME_TEXT_X_DASH_SETEXT,
    BU_MIME_TEXT_X_DASH_SFV,
    BU_MIME_TEXT_X_DASH_UUENCODE,
    BU_MIME_TEXT_X_DASH_VCALENDAR,
    BU_MIME_TEXT_X_DASH_VCARD,
    BU_MIME_TEXT_UNKNOWN
} bu_mime_text_t;


typedef enum {
    BU_MIME_VIDEO_AUTO,
    BU_MIME_VIDEO_3GPP,
    BU_MIME_VIDEO_3GPP2,
    BU_MIME_VIDEO_H261,
    BU_MIME_VIDEO_H263,
    BU_MIME_VIDEO_H264,
    BU_MIME_VIDEO_JPEG,
    BU_MIME_VIDEO_JPM,
    BU_MIME_VIDEO_MJ2,
    BU_MIME_VIDEO_MP4,
    BU_MIME_VIDEO_MPEG,
    BU_MIME_VIDEO_OGG,
    BU_MIME_VIDEO_QUICKTIME,
    BU_MIME_VIDEO_VND_DECE_HD,
    BU_MIME_VIDEO_VND_DECE_MOBILE,
    BU_MIME_VIDEO_VND_DECE_PD,
    BU_MIME_VIDEO_VND_DECE_SD,
    BU_MIME_VIDEO_VND_DECE_VIDEO,
    BU_MIME_VIDEO_VND_DVB_FILE,
    BU_MIME_VIDEO_VND_FVT,
    BU_MIME_VIDEO_VND_MPEGURL,
    BU_MIME_VIDEO_VND_MS_DASH_PLAYREADY_MEDIA_PYV,
    BU_MIME_VIDEO_VND_UVVU_MP4,
    BU_MIME_VIDEO_VND_VIVO,
    BU_MIME_VIDEO_WEBM,
    BU_MIME_VIDEO_X_DASH_F4V,
    BU_MIME_VIDEO_X_DASH_FLI,
    BU_MIME_VIDEO_X_DASH_FLV,
    BU_MIME_VIDEO_X_DASH_M4V,
    BU_MIME_VIDEO_X_DASH_MATROSKA,
    BU_MIME_VIDEO_X_DASH_MNG,
    BU_MIME_VIDEO_X_DASH_MSVIDEO,
    BU_MIME_VIDEO_X_DASH_MS_DASH_ASF,
    BU_MIME_VIDEO_X_DASH_MS_DASH_VOB,
    BU_MIME_VIDEO_X_DASH_MS_DASH_WM,
    BU_MIME_VIDEO_X_DASH_MS_DASH_WMV,
    BU_MIME_VIDEO_X_DASH_MS_DASH_WMX,
    BU_MIME_VIDEO_X_DASH_MS_DASH_WVX,
    BU_MIME_VIDEO_X_DASH_SGI_DASH_MOVIE,
    BU_MIME_VIDEO_X_DASH_SMV,
    BU_MIME_VIDEO_UNKNOWN
} bu_mime_video_t;


typedef enum {
    BU_MIME_X_DASH_CONFERENCE_AUTO,
    BU_MIME_X_DASH_CONFERENCE_X_DASH_COOLTALK,
    BU_MIME_X_DASH_CONFERENCE_UNKNOWN
} bu_mime_x_DASH_conference_t;


__END_DECLS

#endif /*BU_MIME_TYPES_H*/
