library(httr2)
# Et eller andet sted finder vi "pnxs" - det er her nedenstående grundlæggende
# stammer fra.

# Åbn siden i browseren og find kalapøjseren. Det gør du ved at højreklikke og
# vælg "undersøg", og derefter "network". Der finder man kalapøjseren, der kan
# genkendes ved at den er markeret med "pnxs"
# det kan være en fordel at begrænse til primaws

# Dokumentation: https://developers.exlibrisgroup.com/primo/apis/docs/primoSearch/R0VUIC9wcmltby92MS9zZWFyY2g=/#queryParameters

# Vi har en fornemmelse af at dette er søgbart:
# search-advanced.mediaType.option.bachelorproject
# Den har vi fundet i denne oversigt:
# https://soeg.kb.dk/primaws/rest/pub/translations/45KBDK_KGL:SPECIALER?lang=da&lang=da

# det var måske værd at overveje om de øvrige medietyper kunne være interessante
# at kunne søge efter.
# I øvrigt mener vi at det burde hedde noget andet end medietyper.

# URL til requesten
url <- "https://soeg.kb.dk/primaws/rest/pub/pnxs"

# Query parametre
params <- list(
  acTriggered = "false",
  blendFacetsSeparately = "false", 
  citationTrailFilterByAvailability = "true",
  disableCache = "false",
  getMore = "0",
  inst = "45KBDK_KGL",
  isCDSearch = "false", 
  lang = "da",
  limit = "10",
  newspapersActive = "true",
  newspapersSearch = "false",
  offset = "0",
  otbRanking = "false",
  pcAvailability = "false", 
  q = "any,contains,VANADIUM",
  qExclude = "",
  qInclude = "",
  rapido = "false", 
  refEntryActive = "true",
  rtaLinks = "true", 
  scope = "MyInst_and_CI",
  searchInFulltextUserSelection = "true", 
  skipDelivery = "Y",
  sort = "rank", 
  tab = "Everything", 
  vid = "45KBDK_KGL:KGL"
)

# Bearer token
#bearer_token <- "eyJraWQiOiJwcmltYVByaXZhdGVLZXktNDVLQkRLX0tHTCIsImFsZyI6IkVTMjU2In0.eyJpc3MiOiJQcmltYSIsImp0aSI6IiIsImV4cCI6MTczNDU5Nzk4MywiaWF0IjoxNzM0NTExNTgzLCJ1c2VyTmFtZSI6ImFub255bW91cy0xMjE4XzA4NDYyMyIsImRpc3BsYXlOYW1lIjpudWxsLCJ1c2VyIjoiYW5vbnltb3VzLTEyMThfMDg0NjIzIiwidXNlckdyb3VwIjoiR1VFU1QiLCJpbnN0aXR1dGlvbiI6IjQ1S0JES19LR0wiLCJ1c2VySXAiOiIxMzAuMjI1LjE3OC4yIiwiYXV0aGVudGljYXRpb25Qcm9maWxlIjoiIiwiYXV0aGVudGljYXRpb25TeXN0ZW0iOiIiLCJsYW5ndWFnZSI6ImVuIiwic2FtbFNlc3Npb25JbmRleCI6IiIsInNhbWxOYW1lSWQiOiIiLCJvbkNhbXB1cyI6InRydWUiLCJzaWduZWRJbiI6bnVsbCwidmlld0lkIjoiNDVLQkRLX0tHTDpLR0wifQ.8pshwsoKb_ZaNyXAwvRuR9y_MyMhGUIFZ87OD9sI4NwelBZQrEtBaFQTUgIjUctZ-MEeYuWgnpDQJ1LZRCTnCg"

# Forbered requesten
request <- request(url) %>%
  req_url_query(!!!params) %>%
  req_method("GET") %>%
  req_headers(
    "Accept" = "application/json, text/plain, */*",
    "Accept-Encoding" = "gzip, deflate, br, zstd"#,
    #    "Authorization" = paste("Bearer", bearer_token)
  )

# Send requesten
response <- req_perform(request)

# Hent indholdet 
content <- resp_body_json(response)

# Vis resultater
print(content)
