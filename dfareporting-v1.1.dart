// Copyright 2012 Google Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//   http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#library('dfareporting-v1.1');
#import('dart:core', prefix: 'core');
#import('dart:json');

#import('utils.dart');
#import('http.dart', prefix:'http');

// API DfareportingApi
/**
 * Lets you create, run and download reports.
 */
class DfareportingApi extends core.Object {
  /** The API root, such as [:https://www.googleapis.com:] */
  final core.String baseUrl;
  /** How we should identify ourselves to the service. */
  http.Authenticator authenticator;
  /** The client library version */
  final core.String clientVersion = "0.1";
  /** The application name, used in the user-agent header */
  final core.String applicationName;
  DfareportingApi get _$service => this;
  FilesResource _files;
  FilesResource get files => _files;
  DimensionValuesResource _dimensionValues;
  DimensionValuesResource get dimensionValues => _dimensionValues;
  UserProfilesResource _userProfiles;
  UserProfilesResource get userProfiles => _userProfiles;
  ReportsResource _reports;
  ReportsResource get reports => _reports;
  
  /** Returns response with indentations and line breaks. */
  core.bool prettyPrint;

  /** Selector specifying which fields to include in a partial response. */
  core.String fields;

  /**
   * Available to use for quota purposes for server-side applications. Can be any arbitrary string
   * assigned to a user, but should not exceed 40 characters. Overrides userIp if both are provided.
   */
  core.String quotaUser;

  /** OAuth 2.0 token for the current user. */
  core.String oauthToken;

  /**
   * API key. Your API key identifies your project and provides you with API access, quota, and
   * reports. Required unless you provide an OAuth 2.0 token.
   */
  core.String key;

  /**
   * IP address of the site where the request originates. Use this if you want to enforce per-user
   * limits.
   */
  core.String userIp;

  /** Data format for the response. */
  DfareportingApiAlt alt;


  DfareportingApi({this.baseUrl:"https://www.googleapis.com/dfareporting/v1.1/", applicationName, this.authenticator}) :
      this.applicationName = (applicationName == null) ? null : applicationName
          .replaceAll(const core.RegExp(r'\s+'), '_')
          .replaceAll(const core.RegExp(r'[^-_.,0-9a-zA-Z]'), '')
  { 
    _files = new FilesResource._internal(this);
    _dimensionValues = new DimensionValuesResource._internal(this);
    _userProfiles = new UserProfilesResource._internal(this);
    _reports = new ReportsResource._internal(this);
  }
  core.String get userAgent {
    var uaPrefix = (applicationName == null) ? "" : "$applicationName ";
    return "${uaPrefix}dfareporting/v1.1/20120831 google-api-dart-client/${clientVersion}";
  }


  /** OAuth2 scope: View and manage DoubleClick for Advertisers reports */
  static final core.String DFAREPORTING_SCOPE = "https://www.googleapis.com/auth/dfareporting";
}

// Resource .FilesResource
class FilesResource extends core.Object {
  final DfareportingApi _$service;
  
  FilesResource._internal(DfareportingApi $service) : _$service = $service;

  // Method FilesResource.List
  /**
   * Lists files for a user profile.
   *
   *    * [profileId] The DFA profile ID.
   *    * [pageToken] The value of the nextToken from the previous result page.
   *    * [sortField] The field by which to sort the list.
  Default: LAST_MODIFIED_TIME.
   *    * [sortOrder] Order of sorted results, default is 'DESCENDING'.
  Default: DESCENDING.
   *    * [maxResults] Maximum number of results to return.

  Minimum: 0.
  Maximum: 10.
   */
  core.Future<FileList> list(core.String profileId, {core.String pageToken, FilesResourceListSortField sortField, FilesResourceListSortOrder sortOrder, core.int maxResults}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["profileId"] = profileId;
    if (?pageToken) $queryParams["pageToken"] = pageToken;
    if (?sortField) $queryParams["sortField"] = sortField;
    if (?sortOrder) $queryParams["sortOrder"] = sortOrder;
    if (?maxResults) $queryParams["maxResults"] = maxResults;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "userprofiles/{profileId}/files";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => FileList.parse(JSON.parse($text)));
  }
}

// Enum FilesResource.List.SortField
class FilesResourceListSortField extends core.Object implements core.Hashable {
  /** Sort by file ID. */
  const FilesResourceListSortField ID = const FilesResourceListSortField._internal("ID", 0);
  /** Sort by 'lastmodifiedAt' field. */
  const FilesResourceListSortField LAST_MODIFIED_TIME = const FilesResourceListSortField._internal("LAST_MODIFIED_TIME", 1);

  /** All values of this enumeration */
  const core.List<FilesResourceListSortField> values = const <FilesResourceListSortField>[
    ID,
    LAST_MODIFIED_TIME,
  ];

  /** Map from string representation to enumeration value */
  const _valuesMap = const <FilesResourceListSortField>{ 
    "ID": ID,
    "LAST_MODIFIED_TIME": LAST_MODIFIED_TIME,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static FilesResourceListSortField valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const FilesResourceListSortField._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "SortField".hashCode();
}

// Enum FilesResource.List.SortOrder
class FilesResourceListSortOrder extends core.Object implements core.Hashable {
  /** Ascending order. */
  const FilesResourceListSortOrder ASCENDING = const FilesResourceListSortOrder._internal("ASCENDING", 0);
  /** Descending order. */
  const FilesResourceListSortOrder DESCENDING = const FilesResourceListSortOrder._internal("DESCENDING", 1);

  /** All values of this enumeration */
  const core.List<FilesResourceListSortOrder> values = const <FilesResourceListSortOrder>[
    ASCENDING,
    DESCENDING,
  ];

  /** Map from string representation to enumeration value */
  const _valuesMap = const <FilesResourceListSortOrder>{ 
    "ASCENDING": ASCENDING,
    "DESCENDING": DESCENDING,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static FilesResourceListSortOrder valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const FilesResourceListSortOrder._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "SortOrder".hashCode();
}

// Resource .DimensionValuesResource
class DimensionValuesResource extends core.Object {
  final DfareportingApi _$service;
  
  DimensionValuesResource._internal(DfareportingApi $service) : _$service = $service;

  // Method DimensionValuesResource.Query
  /**
   * Retrieves list of report dimension values for a list of filters.
   *
   *    * [content] the DimensionValueRequest
   *    * [profileId] The DFA user profile ID.
   *    * [pageToken] The value of the nextToken from the previous result page.
   *    * [maxResults] Maximum number of results to return.

  Minimum: 0.
  Maximum: 100.
   */
  core.Future<DimensionValueList> query(core.String profileId, DimensionValueRequest content, {core.String pageToken, core.int maxResults}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["profileId"] = profileId;
    if (?pageToken) $queryParams["pageToken"] = pageToken;
    if (?maxResults) $queryParams["maxResults"] = maxResults;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(DimensionValueRequest.serialize(content));
    final $path = "userprofiles/{profileId}/dimensionvalues/query";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => DimensionValueList.parse(JSON.parse($text)));
  }
}

// Resource .UserProfilesResource
class UserProfilesResource extends core.Object {
  final DfareportingApi _$service;
  
  UserProfilesResource._internal(DfareportingApi $service) : _$service = $service;

  // Method UserProfilesResource.List
  /**
   * Retrieves list of user profiles for a user.
   *
   */
  core.Future<UserProfileList> list() {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "userprofiles";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => UserProfileList.parse(JSON.parse($text)));
  }

  // Method UserProfilesResource.Get
  /**
   * Gets one user profile by ID.
   *
   *    * [profileId] The user profile ID.
   */
  core.Future<UserProfile> get(core.String profileId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["profileId"] = profileId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "userprofiles/{profileId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => UserProfile.parse(JSON.parse($text)));
  }
}

// Resource .ReportsResource
class ReportsResource extends core.Object {
  final DfareportingApi _$service;
  final ReportsFilesResourceResource files;
  
  ReportsResource._internal(DfareportingApi $service) : _$service = $service,
    files = new ReportsFilesResourceResource._internal($service);

  // Method ReportsResource.Insert
  /**
   * Creates a report.
   *
   *    * [content] the Report
   *    * [profileId] The DFA user profile ID.
   */
  core.Future<Report> insert(core.String profileId, Report content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["profileId"] = profileId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Report.serialize(content));
    final $path = "userprofiles/{profileId}/reports";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Report.parse(JSON.parse($text)));
  }

  // Method ReportsResource.Run
  /**
   * Runs a report.
   *
   *    * [profileId] The DFA profile ID.
   *    * [reportId] The ID of the report.
   *    * [synchronous] If set and true, tries to run the report synchronously.
   */
  core.Future<File> run(core.String profileId, core.String reportId, {core.bool synchronous}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["profileId"] = profileId;
    $pathParams["reportId"] = reportId;
    if (?synchronous) $queryParams["synchronous"] = synchronous;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "userprofiles/{profileId}/reports/{reportId}/run";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "POST", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => File.parse(JSON.parse($text)));
  }

  // Method ReportsResource.Get
  /**
   * Retrieves a report by its ID.
   *
   *    * [profileId] The DFA user profile ID.
   *    * [reportId] The ID of the report.
   */
  core.Future<Report> get(core.String profileId, core.String reportId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["profileId"] = profileId;
    $pathParams["reportId"] = reportId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "userprofiles/{profileId}/reports/{reportId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => Report.parse(JSON.parse($text)));
  }

  // Method ReportsResource.List
  /**
   * Retrieves list of reports.
   *
   *    * [profileId] The DFA user profile ID.
   *    * [pageToken] The value of the nextToken from the previous result page.
   *    * [sortField] The field by which to sort the list.
  Default: LAST_MODIFIED_TIME.
   *    * [sortOrder] Order of sorted results, default is 'DESCENDING'.
  Default: DESCENDING.
   *    * [maxResults] Maximum number of results to return.

  Minimum: 0.
  Maximum: 10.
   */
  core.Future<ReportList> list(core.String profileId, {core.String pageToken, ReportsResourceListSortField sortField, ReportsResourceListSortOrder sortOrder, core.int maxResults}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["profileId"] = profileId;
    if (?pageToken) $queryParams["pageToken"] = pageToken;
    if (?sortField) $queryParams["sortField"] = sortField;
    if (?sortOrder) $queryParams["sortOrder"] = sortOrder;
    if (?maxResults) $queryParams["maxResults"] = maxResults;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "userprofiles/{profileId}/reports";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => ReportList.parse(JSON.parse($text)));
  }

  // Method ReportsResource.Update
  /**
   * Updates a report.
   *
   *    * [content] the Report
   *    * [profileId] The DFA user profile ID.
   *    * [reportId] The ID of the report.
   */
  core.Future<Report> update(core.String profileId, core.String reportId, Report content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["profileId"] = profileId;
    $pathParams["reportId"] = reportId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Report.serialize(content));
    final $path = "userprofiles/{profileId}/reports/{reportId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "PUT", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Report.parse(JSON.parse($text)));
  }

  // Method ReportsResource.Patch
  /**
   * Updates a report. This method supports patch semantics.
   *
   *    * [content] the Report
   *    * [profileId] The DFA user profile ID.
   *    * [reportId] The ID of the report.
   */
  core.Future<Report> patch(core.String profileId, core.String reportId, Report content) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["profileId"] = profileId;
    $pathParams["reportId"] = reportId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    $headers["Content-Type"] = "application/json";
    final $body = JSON.stringify(Report.serialize(content));
    final $path = "userprofiles/{profileId}/reports/{reportId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "PATCH", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request($body))
        .transform((final $text) => Report.parse(JSON.parse($text)));
  }

  // Method ReportsResource.Delete
  /**
   * Deletes a report by its ID.
   *
   *    * [profileId] The DFA user profile ID.
   *    * [reportId] The ID of the report.
   */
  core.Future delete(core.String profileId, core.String reportId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["profileId"] = profileId;
    $pathParams["reportId"] = reportId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "userprofiles/{profileId}/reports/{reportId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "DELETE", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => identity(JSON.parse($text)));
  }
}

// Enum ReportsResource.List.SortField
class ReportsResourceListSortField extends core.Object implements core.Hashable {
  /** Sort by report ID. */
  const ReportsResourceListSortField ID = const ReportsResourceListSortField._internal("ID", 0);
  /** Sort by 'lastModifiedTime' field. */
  const ReportsResourceListSortField LAST_MODIFIED_TIME = const ReportsResourceListSortField._internal("LAST_MODIFIED_TIME", 1);
  /** Sort by name of reports. */
  const ReportsResourceListSortField NAME = const ReportsResourceListSortField._internal("NAME", 2);

  /** All values of this enumeration */
  const core.List<ReportsResourceListSortField> values = const <ReportsResourceListSortField>[
    ID,
    LAST_MODIFIED_TIME,
    NAME,
  ];

  /** Map from string representation to enumeration value */
  const _valuesMap = const <ReportsResourceListSortField>{ 
    "ID": ID,
    "LAST_MODIFIED_TIME": LAST_MODIFIED_TIME,
    "NAME": NAME,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static ReportsResourceListSortField valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const ReportsResourceListSortField._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "SortField".hashCode();
}

// Enum ReportsResource.List.SortOrder
class ReportsResourceListSortOrder extends core.Object implements core.Hashable {
  /** Ascending order. */
  const ReportsResourceListSortOrder ASCENDING = const ReportsResourceListSortOrder._internal("ASCENDING", 0);
  /** Descending order. */
  const ReportsResourceListSortOrder DESCENDING = const ReportsResourceListSortOrder._internal("DESCENDING", 1);

  /** All values of this enumeration */
  const core.List<ReportsResourceListSortOrder> values = const <ReportsResourceListSortOrder>[
    ASCENDING,
    DESCENDING,
  ];

  /** Map from string representation to enumeration value */
  const _valuesMap = const <ReportsResourceListSortOrder>{ 
    "ASCENDING": ASCENDING,
    "DESCENDING": DESCENDING,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static ReportsResourceListSortOrder valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const ReportsResourceListSortOrder._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "SortOrder".hashCode();
}


// Resource ReportsResource.ReportsFilesResourceResource
class ReportsFilesResourceResource extends core.Object {
  final DfareportingApi _$service;
  
  ReportsFilesResourceResource._internal(DfareportingApi $service) : _$service = $service;

  // Method ReportsResource.ReportsFilesResourceResource.List
  /**
   * Lists files for a report.
   *
   *    * [profileId] The DFA profile ID.
   *    * [reportId] The ID of the parent report.
   *    * [sortField] The field by which to sort the list.
  Default: LAST_MODIFIED_TIME.
   *    * [maxResults] Maximum number of results to return.

  Minimum: 0.
  Maximum: 10.
   *    * [pageToken] The value of the nextToken from the previous result page.
   *    * [sortOrder] Order of sorted results, default is 'DESCENDING'.
  Default: DESCENDING.
   */
  core.Future<FileList> list(core.String profileId, core.String reportId, {ReportsResourceReportsFilesResourceResourceListSortField sortField, core.int maxResults, core.String pageToken, ReportsResourceReportsFilesResourceResourceListSortOrder sortOrder}) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["profileId"] = profileId;
    $pathParams["reportId"] = reportId;
    if (?sortField) $queryParams["sortField"] = sortField;
    if (?maxResults) $queryParams["maxResults"] = maxResults;
    if (?pageToken) $queryParams["pageToken"] = pageToken;
    if (?sortOrder) $queryParams["sortOrder"] = sortOrder;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "userprofiles/{profileId}/reports/{reportId}/files";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => FileList.parse(JSON.parse($text)));
  }

  // Method ReportsResource.ReportsFilesResourceResource.Get
  /**
   * Retrieves a report file.
   *
   *    * [profileId] The DFA profile ID.
   *    * [reportId] The ID of the report.
   *    * [fileId] The ID of the report file.
   */
  core.Future<File> get(core.String profileId, core.String reportId, core.String fileId) {
    final $queryParams = {};
    final $headers = {};
    final $pathParams = {};
    $pathParams["profileId"] = profileId;
    $pathParams["reportId"] = reportId;
    $pathParams["fileId"] = fileId;
    if (_$service.prettyPrint != null) $queryParams["prettyPrint"] = _$service.prettyPrint;
    if (_$service.fields != null) $queryParams["fields"] = _$service.fields;
    if (_$service.quotaUser != null) $queryParams["quotaUser"] = _$service.quotaUser;
    if (_$service.oauthToken != null) $headers["Authorization"] = "Bearer ${_$service.oauthToken}";
    if (_$service.key != null) $queryParams["key"] = _$service.key;
    if (_$service.userIp != null) $queryParams["userIp"] = _$service.userIp;
    if (_$service.alt != null) $queryParams["alt"] = _$service.alt;
    $headers["X-JavaScript-User-Agent"] = _$service.userAgent;
    final $path = "userprofiles/{profileId}/reports/{reportId}/files/{fileId}";
    final $url = new UrlPattern("${_$service.baseUrl}${$path}").generate($pathParams, $queryParams);
    final $http = new http.Request($url, "GET", $headers);
    final $authenticatedHttp = (_$service.authenticator == null)
        ? new core.Future.immediate($http)
        : _$service.authenticator.authenticate($http);
    return $authenticatedHttp
        .chain((final $req) => $req.request())
        .transform((final $text) => File.parse(JSON.parse($text)));
  }
}

// Enum ReportsResource.ReportsFilesResourceResource.List.SortField
class ReportsResourceReportsFilesResourceResourceListSortField extends core.Object implements core.Hashable {
  /** Sort by file ID. */
  const ReportsResourceReportsFilesResourceResourceListSortField ID = const ReportsResourceReportsFilesResourceResourceListSortField._internal("ID", 0);
  /** Sort by 'lastmodifiedAt' field. */
  const ReportsResourceReportsFilesResourceResourceListSortField LAST_MODIFIED_TIME = const ReportsResourceReportsFilesResourceResourceListSortField._internal("LAST_MODIFIED_TIME", 1);

  /** All values of this enumeration */
  const core.List<ReportsResourceReportsFilesResourceResourceListSortField> values = const <ReportsResourceReportsFilesResourceResourceListSortField>[
    ID,
    LAST_MODIFIED_TIME,
  ];

  /** Map from string representation to enumeration value */
  const _valuesMap = const <ReportsResourceReportsFilesResourceResourceListSortField>{ 
    "ID": ID,
    "LAST_MODIFIED_TIME": LAST_MODIFIED_TIME,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static ReportsResourceReportsFilesResourceResourceListSortField valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const ReportsResourceReportsFilesResourceResourceListSortField._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "SortField".hashCode();
}

// Enum ReportsResource.ReportsFilesResourceResource.List.SortOrder
class ReportsResourceReportsFilesResourceResourceListSortOrder extends core.Object implements core.Hashable {
  /** Ascending order. */
  const ReportsResourceReportsFilesResourceResourceListSortOrder ASCENDING = const ReportsResourceReportsFilesResourceResourceListSortOrder._internal("ASCENDING", 0);
  /** Descending order. */
  const ReportsResourceReportsFilesResourceResourceListSortOrder DESCENDING = const ReportsResourceReportsFilesResourceResourceListSortOrder._internal("DESCENDING", 1);

  /** All values of this enumeration */
  const core.List<ReportsResourceReportsFilesResourceResourceListSortOrder> values = const <ReportsResourceReportsFilesResourceResourceListSortOrder>[
    ASCENDING,
    DESCENDING,
  ];

  /** Map from string representation to enumeration value */
  const _valuesMap = const <ReportsResourceReportsFilesResourceResourceListSortOrder>{ 
    "ASCENDING": ASCENDING,
    "DESCENDING": DESCENDING,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static ReportsResourceReportsFilesResourceResourceListSortOrder valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const ReportsResourceReportsFilesResourceResourceListSortOrder._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "SortOrder".hashCode();
}

// Schema .Activities
class Activities extends IdentityHash {
  /** The kind of resource this is, in this case dfareporting#activities. */
  core.String kind;

  /**
 * List of activity filters. The dimension values need to be all either of type "dfa:activity" or
 * "dfa:activityGroup".
 */
  core.List<DimensionValue> filters;

  /** List of names of floodlight activity metrics. */
  core.List<core.String> metricNames;

  /** Parses an instance from its JSON representation. */
  static Activities parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Activities();
    result.kind = identity(json["kind"]);
    result.filters = map(DimensionValue.parse)(json["filters"]);
    result.metricNames = map(identity)(json["metricNames"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Activities value) {
    if (value == null) return null;
    final result = {};
    result["kind"] = identity(value.kind);
    result["filters"] = map(DimensionValue.serialize)(value.filters);
    result["metricNames"] = map(identity)(value.metricNames);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .CustomRichMediaEvents
class CustomRichMediaEvents extends IdentityHash {
  /** The kind of resource this is, in this case dfareporting#customRichMediaEvents. */
  core.String kind;

  /**
 * List of custom rich media event IDs. Dimension values must be all of type
 * dfa:richMediaEventTypeIdAndName.
 */
  core.List<DimensionValue> filteredEventIds;

  /** Parses an instance from its JSON representation. */
  static CustomRichMediaEvents parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new CustomRichMediaEvents();
    result.kind = identity(json["kind"]);
    result.filteredEventIds = map(DimensionValue.parse)(json["filteredEventIds"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(CustomRichMediaEvents value) {
    if (value == null) return null;
    final result = {};
    result["kind"] = identity(value.kind);
    result["filteredEventIds"] = map(DimensionValue.serialize)(value.filteredEventIds);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .DateRange
class DateRange extends IdentityHash {
  /** The start date of the date range, inclusive. A string of the format: "yyyy-MM-dd". */
  core.String startDate;

  /** The kind of resource this is, in this case dfareporting#dateRange. */
  core.String kind;

  /** The end date of the date range, inclusive. A string of the format: "yyyy-MM-dd". */
  core.String endDate;

  /**
 * The date range relative to the date of when the report is run, one of: - "TODAY" - "YESTERDAY" -
 * "WEEK_TO_DATE" - "MONTH_TO_DATE" - "QUARTER_TO_DATE" - "YEAR_TO_DATE" - "PREVIOUS_WEEK" -
 * "PREVIOUS_MONTH" - "PREVIOUS_QUARTER" - "PREVIOUS_YEAR" - "LAST_7_DAYS" - "LAST_30_DAYS" -
 * "LAST_90_DAYS" - "LAST_365_DAYS" - "LAST_24_MONTHS"
 */
  core.String relativeDateRange;

  /** Parses an instance from its JSON representation. */
  static DateRange parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new DateRange();
    result.startDate = identity(json["startDate"]);
    result.kind = identity(json["kind"]);
    result.endDate = identity(json["endDate"]);
    result.relativeDateRange = identity(json["relativeDateRange"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(DateRange value) {
    if (value == null) return null;
    final result = {};
    result["startDate"] = identity(value.startDate);
    result["kind"] = identity(value.kind);
    result["endDate"] = identity(value.endDate);
    result["relativeDateRange"] = identity(value.relativeDateRange);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .DimensionFilter
class DimensionFilter extends IdentityHash {
  /** The name of the dimension to filter. */
  core.String dimensionName;

  /** The kind of resource this is, in this case dfareporting#dimensionFilter. */
  core.String kind;

  /** The value of the dimension to filter. */
  core.String value;

  /** Parses an instance from its JSON representation. */
  static DimensionFilter parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new DimensionFilter();
    result.dimensionName = identity(json["dimensionName"]);
    result.kind = identity(json["kind"]);
    result.value = identity(json["value"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(DimensionFilter value) {
    if (value == null) return null;
    final result = {};
    result["dimensionName"] = identity(value.dimensionName);
    result["kind"] = identity(value.kind);
    result["value"] = identity(value.value);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .DimensionValue
class DimensionValue extends IdentityHash {
  /** The name of the dimension. */
  core.String dimensionName;

  /** The kind of resource this is, in this case dfareporting#dimensionValue. */
  core.String kind;

  /** The eTag of this response for caching purposes. */
  core.String etag;

  /** The ID associated with the value if available. */
  core.String id;

  /** The value of the dimension. */
  core.String value;

  /** Parses an instance from its JSON representation. */
  static DimensionValue parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new DimensionValue();
    result.dimensionName = identity(json["dimensionName"]);
    result.kind = identity(json["kind"]);
    result.etag = identity(json["etag"]);
    result.id = identity(json["id"]);
    result.value = identity(json["value"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(DimensionValue value) {
    if (value == null) return null;
    final result = {};
    result["dimensionName"] = identity(value.dimensionName);
    result["kind"] = identity(value.kind);
    result["etag"] = identity(value.etag);
    result["id"] = identity(value.id);
    result["value"] = identity(value.value);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .DimensionValueList
class DimensionValueList extends IdentityHash {
  /**
 * Continuation token used to page through dimension values. To retrieve the next page of results,
 * set the next request's "pageToken" to the value of this field. The page token is only valid for a
 * limited amount of time and should not be persisted.
 */
  core.String nextPageToken;

  /** The dimension values returned in this response. */
  core.List<DimensionValue> items;

  /** The kind of list this is, in this case dfareporting#dimensionValueList. */
  core.String kind;

  /** The eTag of this response for caching purposes. */
  core.String etag;

  /** Parses an instance from its JSON representation. */
  static DimensionValueList parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new DimensionValueList();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.items = map(DimensionValue.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    result.etag = identity(json["etag"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(DimensionValueList value) {
    if (value == null) return null;
    final result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["items"] = map(DimensionValue.serialize)(value.items);
    result["kind"] = identity(value.kind);
    result["etag"] = identity(value.etag);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .DimensionValueRequest
class DimensionValueRequest extends IdentityHash {
  /** The name of the dimension for which values should be requested. */
  core.String dimensionName;

  /**
 * The start date of the date range for which to retrieve dimension values. A string of the format:
 * "yyyy-MM-dd".
 */
  core.String startDate;

  /** The kind of request this is, in this case dfareporting#dimensionValueRequest. */
  core.String kind;

  /**
 * The end date of the date range for which to retrieve dimension values. A string of the format:
 * "yyyy-MM-dd".
 */
  core.String endDate;

  /** The list of filters by which to filter values. The filters are ANDed. */
  core.List<DimensionFilter> filters;

  /** Parses an instance from its JSON representation. */
  static DimensionValueRequest parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new DimensionValueRequest();
    result.dimensionName = identity(json["dimensionName"]);
    result.startDate = identity(json["startDate"]);
    result.kind = identity(json["kind"]);
    result.endDate = identity(json["endDate"]);
    result.filters = map(DimensionFilter.parse)(json["filters"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(DimensionValueRequest value) {
    if (value == null) return null;
    final result = {};
    result["dimensionName"] = identity(value.dimensionName);
    result["startDate"] = identity(value.startDate);
    result["kind"] = identity(value.kind);
    result["endDate"] = identity(value.endDate);
    result["filters"] = map(DimensionFilter.serialize)(value.filters);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .File
class File extends IdentityHash {
  /**
 * The status of the report file, one of: - "PROCESSING" - "REPORT_AVAILABLE" - "FAILED" -
 * "CANCELLED"
 */
  core.String status;

  /** The kind of resource this is, in this case dfareporting#file. */
  core.String kind;

  /** The output format of the report. Only available once the file is available. */
  core.String format;

  /**
 * The date range for which the file has report data. The date range will always be the absolute
 * date range for which the report is run.
 */
  DateRange dateRange;

  /** The file name of the file. */
  core.String fileName;

  /** The eTag of this response for caching purposes. */
  core.String etag;

  /** The ID of the report this file was generated from. */
  core.String reportId;

  /** The urls where the completed report file can be downloaded. */
  FileUrls urls;

  /** The timestamp in milliseconds since epoch when this file was last modified. */
  core.String lastModifiedTime;

  /** The unique ID of this report file. */
  core.String id;

  /** Parses an instance from its JSON representation. */
  static File parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new File();
    result.status = identity(json["status"]);
    result.kind = identity(json["kind"]);
    result.format = identity(json["format"]);
    result.dateRange = DateRange.parse(json["dateRange"]);
    result.fileName = identity(json["fileName"]);
    result.etag = identity(json["etag"]);
    result.reportId = identity(json["reportId"]);
    result.urls = FileUrls.parse(json["urls"]);
    result.lastModifiedTime = identity(json["lastModifiedTime"]);
    result.id = identity(json["id"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(File value) {
    if (value == null) return null;
    final result = {};
    result["status"] = identity(value.status);
    result["kind"] = identity(value.kind);
    result["format"] = identity(value.format);
    result["dateRange"] = DateRange.serialize(value.dateRange);
    result["fileName"] = identity(value.fileName);
    result["etag"] = identity(value.etag);
    result["reportId"] = identity(value.reportId);
    result["urls"] = FileUrls.serialize(value.urls);
    result["lastModifiedTime"] = identity(value.lastModifiedTime);
    result["id"] = identity(value.id);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .FileList
class FileList extends IdentityHash {
  /**
 * Continuation token used to page through files. To retrieve the next page of results, set the next
 * request's "pageToken" to the value of this field. The page token is only valid for a limited
 * amount of time and should not be persisted.
 */
  core.String nextPageToken;

  /** The files returned in this response. */
  core.List<File> items;

  /** The kind of list this is, in this case dfareporting#fileList. */
  core.String kind;

  /** The eTag of this response for caching purposes. */
  core.String etag;

  /** Parses an instance from its JSON representation. */
  static FileList parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new FileList();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.items = map(File.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    result.etag = identity(json["etag"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(FileList value) {
    if (value == null) return null;
    final result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["items"] = map(File.serialize)(value.items);
    result["kind"] = identity(value.kind);
    result["etag"] = identity(value.etag);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema File.FileUrls
class FileUrls extends IdentityHash {
  /** The url for downloading the report data through a browser. */
  core.String browserUrl;

  /** The url for downloading the report data through the API. */
  core.String apiUrl;

  /** Parses an instance from its JSON representation. */
  static FileUrls parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new FileUrls();
    result.browserUrl = identity(json["browserUrl"]);
    result.apiUrl = identity(json["apiUrl"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(FileUrls value) {
    if (value == null) return null;
    final result = {};
    result["browserUrl"] = identity(value.browserUrl);
    result["apiUrl"] = identity(value.apiUrl);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Recipient
class Recipient extends IdentityHash {
  /** The kind of resource this is, in this case dfareporting#recipient. */
  core.String kind;

  /**
 * The delivery type for the recipient, one of: - "ATTACHMENT"  (support for additional options will
 * be added later)
 */
  core.String deliveryType;

  /** The email address of the recipient. */
  core.String email;

  /** Parses an instance from its JSON representation. */
  static Recipient parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Recipient();
    result.kind = identity(json["kind"]);
    result.deliveryType = identity(json["deliveryType"]);
    result.email = identity(json["email"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Recipient value) {
    if (value == null) return null;
    final result = {};
    result["kind"] = identity(value.kind);
    result["deliveryType"] = identity(value.deliveryType);
    result["email"] = identity(value.email);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .Report
class Report extends IdentityHash {
  /** The report criteria for a report of type "PATH_TO_CONVERSION". */
  ReportPathToConversionCriteria pathToConversionCriteria;

  /** The kind of resource this is, in this case dfareporting#report. */
  core.String kind;

  /** The subbaccount ID to which this report belongs if applicable. */
  core.String subAccountId;

  /** The name of the report. */
  core.String name;

  /**
 * The report's schedule. Can only be set if the report's 'dateRange' is a relative date range and
 * the relative date range is not "TODAY".
 */
  ReportSchedule schedule;

  /**
 * The output format of the report, currently only "CSV" is supported. If not specified, default
 * format is "CSV". Note that the actual format in the completed report file might differ if for
 * instance the report's size exceeds the format's capabilities. "CSV" will then be the fallback
 * format.
 */
  core.String format;

  /** The user profile id of the owner of this report. */
  core.String ownerProfileId;

  /** The report criteria for a report of type "REACH". */
  ReportReachCriteria reachCriteria;

  /** The report criteria for a report of type "FLOODLIGHT". */
  ReportFloodlightCriteria floodlightCriteria;

  /** The report criteria for a report of type "ACTIVE_GRP". */
  ReportActiveGrpCriteria activeGrpCriteria;

  /** The report's email delivery settings. */
  ReportDelivery delivery;

  /** The eTag of this response for caching purposes. */
  core.String etag;

  /** The report criteria for a report of type "STANDARD". */
  ReportCriteria criteria;

  /** The unique ID identifying this report resource. */
  core.String id;

  /** The timestamp (in milliseconds since epoch) of when this report was last modified. */
  core.String lastModifiedTime;

  /** The file name used when generating report files for this report. */
  core.String fileName;

  /**
 * The type of the report, one of: - STANDARD - REACH - ACTIVE_GRP - PATH_TO_CONVERSION - FLOODLIGHT
 * - CROSS_DIMENSION_REACH
 */
  core.String type;

  /** The report criteria for a report of type "CROSS_DIMENSION_REACH". */
  ReportCrossDimensionReachCriteria crossDimensionReachCriteria;

  /** The account ID to which this report belongs. */
  core.String accountId;

  /** Parses an instance from its JSON representation. */
  static Report parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new Report();
    result.pathToConversionCriteria = ReportPathToConversionCriteria.parse(json["pathToConversionCriteria"]);
    result.kind = identity(json["kind"]);
    result.subAccountId = identity(json["subAccountId"]);
    result.name = identity(json["name"]);
    result.schedule = ReportSchedule.parse(json["schedule"]);
    result.format = identity(json["format"]);
    result.ownerProfileId = identity(json["ownerProfileId"]);
    result.reachCriteria = ReportReachCriteria.parse(json["reachCriteria"]);
    result.floodlightCriteria = ReportFloodlightCriteria.parse(json["floodlightCriteria"]);
    result.activeGrpCriteria = ReportActiveGrpCriteria.parse(json["activeGrpCriteria"]);
    result.delivery = ReportDelivery.parse(json["delivery"]);
    result.etag = identity(json["etag"]);
    result.criteria = ReportCriteria.parse(json["criteria"]);
    result.id = identity(json["id"]);
    result.lastModifiedTime = identity(json["lastModifiedTime"]);
    result.fileName = identity(json["fileName"]);
    result.type = identity(json["type"]);
    result.crossDimensionReachCriteria = ReportCrossDimensionReachCriteria.parse(json["crossDimensionReachCriteria"]);
    result.accountId = identity(json["accountId"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(Report value) {
    if (value == null) return null;
    final result = {};
    result["pathToConversionCriteria"] = ReportPathToConversionCriteria.serialize(value.pathToConversionCriteria);
    result["kind"] = identity(value.kind);
    result["subAccountId"] = identity(value.subAccountId);
    result["name"] = identity(value.name);
    result["schedule"] = ReportSchedule.serialize(value.schedule);
    result["format"] = identity(value.format);
    result["ownerProfileId"] = identity(value.ownerProfileId);
    result["reachCriteria"] = ReportReachCriteria.serialize(value.reachCriteria);
    result["floodlightCriteria"] = ReportFloodlightCriteria.serialize(value.floodlightCriteria);
    result["activeGrpCriteria"] = ReportActiveGrpCriteria.serialize(value.activeGrpCriteria);
    result["delivery"] = ReportDelivery.serialize(value.delivery);
    result["etag"] = identity(value.etag);
    result["criteria"] = ReportCriteria.serialize(value.criteria);
    result["id"] = identity(value.id);
    result["lastModifiedTime"] = identity(value.lastModifiedTime);
    result["fileName"] = identity(value.fileName);
    result["type"] = identity(value.type);
    result["crossDimensionReachCriteria"] = ReportCrossDimensionReachCriteria.serialize(value.crossDimensionReachCriteria);
    result["accountId"] = identity(value.accountId);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Report.ReportActiveGrpCriteria
class ReportActiveGrpCriteria extends IdentityHash {
  /** The date range this report should be run for. */
  DateRange dateRange;

  /** The list of names of metrics the report should include. */
  core.List<core.String> metricNames;

  /**
 * The list of filters on which dimensions are filtered. Filters for different dimensions are ANDed,
 * filters for the same dimension are grouped together and ORed. A valid active GRP report needs to
 * have exactly one DimensionValue for the United States in addition to any advertiser or campaign
 * dimension values.
 */
  core.List<DimensionValue> dimensionFilters;

  /** The list of dimensions the report should include. */
  core.List<SortedDimension> dimensions;

  /** Parses an instance from its JSON representation. */
  static ReportActiveGrpCriteria parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ReportActiveGrpCriteria();
    result.dateRange = DateRange.parse(json["dateRange"]);
    result.metricNames = map(identity)(json["metricNames"]);
    result.dimensionFilters = map(DimensionValue.parse)(json["dimensionFilters"]);
    result.dimensions = map(SortedDimension.parse)(json["dimensions"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ReportActiveGrpCriteria value) {
    if (value == null) return null;
    final result = {};
    result["dateRange"] = DateRange.serialize(value.dateRange);
    result["metricNames"] = map(identity)(value.metricNames);
    result["dimensionFilters"] = map(DimensionValue.serialize)(value.dimensionFilters);
    result["dimensions"] = map(SortedDimension.serialize)(value.dimensions);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Report.ReportCriteria
class ReportCriteria extends IdentityHash {
  /** Activity group. */
  Activities activities;

  /** The list of standard dimensions the report should include. */
  core.List<SortedDimension> dimensions;

  /** The list of names of metrics the report should include. */
  core.List<core.String> metricNames;

  /** The date range for which this report should be run. */
  DateRange dateRange;

  /**
 * The list of filters on which dimensions are filtered. Filters for different dimensions are ANDed,
 * filters for the same dimension are grouped together and ORed.
 */
  core.List<DimensionValue> dimensionFilters;

  /** Custom Rich Media Events group. */
  CustomRichMediaEvents customRichMediaEvents;

  /** Parses an instance from its JSON representation. */
  static ReportCriteria parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ReportCriteria();
    result.activities = Activities.parse(json["activities"]);
    result.dimensions = map(SortedDimension.parse)(json["dimensions"]);
    result.metricNames = map(identity)(json["metricNames"]);
    result.dateRange = DateRange.parse(json["dateRange"]);
    result.dimensionFilters = map(DimensionValue.parse)(json["dimensionFilters"]);
    result.customRichMediaEvents = CustomRichMediaEvents.parse(json["customRichMediaEvents"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ReportCriteria value) {
    if (value == null) return null;
    final result = {};
    result["activities"] = Activities.serialize(value.activities);
    result["dimensions"] = map(SortedDimension.serialize)(value.dimensions);
    result["metricNames"] = map(identity)(value.metricNames);
    result["dateRange"] = DateRange.serialize(value.dateRange);
    result["dimensionFilters"] = map(DimensionValue.serialize)(value.dimensionFilters);
    result["customRichMediaEvents"] = CustomRichMediaEvents.serialize(value.customRichMediaEvents);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Report.ReportCrossDimensionReachCriteria
class ReportCrossDimensionReachCriteria extends IdentityHash {
  /** The list of dimensions the report should include. */
  core.List<SortedDimension> breakdown;

  /** The list of names of overlap metrics the report should include. */
  core.List<core.String> overlapMetricNames;

  /** The list of names of metrics the report should include. */
  core.List<core.String> metricNames;

  /** The date range this report should be run for. */
  DateRange dateRange;

  /** The list of filters on which dimensions are filtered. */
  core.List<DimensionValue> dimensionFilters;

  /** Whether the report is pivoted or not. Defaults to true. */
  core.bool pivoted;

  /**
 * The dimension option, one of: - "ADVERTISER" - "CAMPAIGN" - "SITE_BY_ADVERTISER" -
 * "SITE_BY_CAMPAIGN"
 */
  core.String dimension;

  /** Parses an instance from its JSON representation. */
  static ReportCrossDimensionReachCriteria parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ReportCrossDimensionReachCriteria();
    result.breakdown = map(SortedDimension.parse)(json["breakdown"]);
    result.overlapMetricNames = map(identity)(json["overlapMetricNames"]);
    result.metricNames = map(identity)(json["metricNames"]);
    result.dateRange = DateRange.parse(json["dateRange"]);
    result.dimensionFilters = map(DimensionValue.parse)(json["dimensionFilters"]);
    result.pivoted = identity(json["pivoted"]);
    result.dimension = identity(json["dimension"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ReportCrossDimensionReachCriteria value) {
    if (value == null) return null;
    final result = {};
    result["breakdown"] = map(SortedDimension.serialize)(value.breakdown);
    result["overlapMetricNames"] = map(identity)(value.overlapMetricNames);
    result["metricNames"] = map(identity)(value.metricNames);
    result["dateRange"] = DateRange.serialize(value.dateRange);
    result["dimensionFilters"] = map(DimensionValue.serialize)(value.dimensionFilters);
    result["pivoted"] = identity(value.pivoted);
    result["dimension"] = identity(value.dimension);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Report.ReportDelivery
class ReportDelivery extends IdentityHash {
  /** The message to be sent with each email. */
  core.String message;

  /**
 * The type of delivery for the owner to receive, if enabled. One of: - "ATTACHMENT"  (support for
 * additional options will be added later)
 */
  core.String emailOwnerDeliveryType;

  /** The list of recipients to which to email the report. */
  core.List<Recipient> recipients;

  /** Whether the report should be emailed to the report owner. */
  core.bool emailOwner;

  /** Parses an instance from its JSON representation. */
  static ReportDelivery parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ReportDelivery();
    result.message = identity(json["message"]);
    result.emailOwnerDeliveryType = identity(json["emailOwnerDeliveryType"]);
    result.recipients = map(Recipient.parse)(json["recipients"]);
    result.emailOwner = identity(json["emailOwner"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ReportDelivery value) {
    if (value == null) return null;
    final result = {};
    result["message"] = identity(value.message);
    result["emailOwnerDeliveryType"] = identity(value.emailOwnerDeliveryType);
    result["recipients"] = map(Recipient.serialize)(value.recipients);
    result["emailOwner"] = identity(value.emailOwner);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Report.ReportFloodlightCriteria
class ReportFloodlightCriteria extends IdentityHash {
  /** The list of dimensions the report should include. */
  core.List<SortedDimension> dimensions;

  /** The list of names of metrics the report should include. */
  core.List<core.String> metricNames;

  /** The date range this report should be run for. */
  DateRange dateRange;

  /**
 * The list of filters on which dimensions are filtered. Filters for different dimensions are ANDed,
 * filters for the same dimension are grouped together and ORed.
 */
  core.List<DimensionValue> dimensionFilters;

  /**
 * The floodlight ID for which to show data in this report. All advertisers associated with that ID
 * will automatically be added. The dimension of the value needs to be 'dfa:floodlightConfigId'.
 */
  DimensionValue floodlightConfigId;

  /** The properties of the report. */
  ReportFloodlightCriteriaReportProperties reportProperties;

  /** Parses an instance from its JSON representation. */
  static ReportFloodlightCriteria parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ReportFloodlightCriteria();
    result.dimensions = map(SortedDimension.parse)(json["dimensions"]);
    result.metricNames = map(identity)(json["metricNames"]);
    result.dateRange = DateRange.parse(json["dateRange"]);
    result.dimensionFilters = map(DimensionValue.parse)(json["dimensionFilters"]);
    result.floodlightConfigId = DimensionValue.parse(json["floodlightConfigId"]);
    result.reportProperties = ReportFloodlightCriteriaReportProperties.parse(json["reportProperties"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ReportFloodlightCriteria value) {
    if (value == null) return null;
    final result = {};
    result["dimensions"] = map(SortedDimension.serialize)(value.dimensions);
    result["metricNames"] = map(identity)(value.metricNames);
    result["dateRange"] = DateRange.serialize(value.dateRange);
    result["dimensionFilters"] = map(DimensionValue.serialize)(value.dimensionFilters);
    result["floodlightConfigId"] = DimensionValue.serialize(value.floodlightConfigId);
    result["reportProperties"] = ReportFloodlightCriteriaReportProperties.serialize(value.reportProperties);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Report.ReportFloodlightCriteria.ReportFloodlightCriteriaReportProperties
class ReportFloodlightCriteriaReportProperties extends IdentityHash {
  /**
 * Include conversions that have no associated cookies and no exposures. Its therefore impossible to
 * know how the user was exposed to your ads during the lookback window prior to a conversion.
 */
  core.bool includeUnattributedIPConversions;

  /**
 * Include conversions of users with a DoubleClick cookie but without an exposure. That means the
 * user did not click or see an ad from the advertiser within the Floodlight group, or that the
 * interaction happened outside the lookback window.
 */
  core.bool includeUnattributedCookieConversions;

  /** Include conversions that have no cookie, but do have an exposure path. */
  core.bool includeAttributedIPConversions;

  /** Parses an instance from its JSON representation. */
  static ReportFloodlightCriteriaReportProperties parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ReportFloodlightCriteriaReportProperties();
    result.includeUnattributedIPConversions = identity(json["includeUnattributedIPConversions"]);
    result.includeUnattributedCookieConversions = identity(json["includeUnattributedCookieConversions"]);
    result.includeAttributedIPConversions = identity(json["includeAttributedIPConversions"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ReportFloodlightCriteriaReportProperties value) {
    if (value == null) return null;
    final result = {};
    result["includeUnattributedIPConversions"] = identity(value.includeUnattributedIPConversions);
    result["includeUnattributedCookieConversions"] = identity(value.includeUnattributedCookieConversions);
    result["includeAttributedIPConversions"] = identity(value.includeAttributedIPConversions);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .ReportList
class ReportList extends IdentityHash {
  /**
 * Continuation token used to page through reports. To retrieve the next page of results, set the
 * next request's "pageToken" to the value of this field. The page token is only valid for a limited
 * amount of time and should not be persisted.
 */
  core.String nextPageToken;

  /** The reports returned in this response. */
  core.List<Report> items;

  /** The kind of list this is, in this case dfareporting#reportList. */
  core.String kind;

  /** The eTag of this response for caching purposes. */
  core.String etag;

  /** Parses an instance from its JSON representation. */
  static ReportList parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ReportList();
    result.nextPageToken = identity(json["nextPageToken"]);
    result.items = map(Report.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    result.etag = identity(json["etag"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ReportList value) {
    if (value == null) return null;
    final result = {};
    result["nextPageToken"] = identity(value.nextPageToken);
    result["items"] = map(Report.serialize)(value.items);
    result["kind"] = identity(value.kind);
    result["etag"] = identity(value.etag);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Report.ReportPathToConversionCriteria
class ReportPathToConversionCriteria extends IdentityHash {
  /** The list of conversion dimensions the report should include. */
  core.List<SortedDimension> conversionDimensions;

  /** The list of names of metrics the report should include. */
  core.List<core.String> metricNames;

  /** The date range this report should be run for. */
  DateRange dateRange;

  /** The properties of the report. */
  ReportPathToConversionCriteriaReportProperties reportProperties;

  /** The list of per interaction dimensions the report should include. */
  core.List<SortedDimension> perInteractionDimensions;

  /** The list of 'dfa:activity' values to filter on. */
  core.List<DimensionValue> activityFilters;

  /**
 * The floodlight ID for which to show data in this report. All advertisers associated with that ID
 * will automatically be added. The dimension of the value needs to be 'dfa:floodlightConfigId'.
 */
  DimensionValue floodlightConfigId;

  /** The list of custom floodlight variables the report should include. */
  core.List<SortedDimension> customFloodlightVariables;

  /** Parses an instance from its JSON representation. */
  static ReportPathToConversionCriteria parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ReportPathToConversionCriteria();
    result.conversionDimensions = map(SortedDimension.parse)(json["conversionDimensions"]);
    result.metricNames = map(identity)(json["metricNames"]);
    result.dateRange = DateRange.parse(json["dateRange"]);
    result.reportProperties = ReportPathToConversionCriteriaReportProperties.parse(json["reportProperties"]);
    result.perInteractionDimensions = map(SortedDimension.parse)(json["perInteractionDimensions"]);
    result.activityFilters = map(DimensionValue.parse)(json["activityFilters"]);
    result.floodlightConfigId = DimensionValue.parse(json["floodlightConfigId"]);
    result.customFloodlightVariables = map(SortedDimension.parse)(json["customFloodlightVariables"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ReportPathToConversionCriteria value) {
    if (value == null) return null;
    final result = {};
    result["conversionDimensions"] = map(SortedDimension.serialize)(value.conversionDimensions);
    result["metricNames"] = map(identity)(value.metricNames);
    result["dateRange"] = DateRange.serialize(value.dateRange);
    result["reportProperties"] = ReportPathToConversionCriteriaReportProperties.serialize(value.reportProperties);
    result["perInteractionDimensions"] = map(SortedDimension.serialize)(value.perInteractionDimensions);
    result["activityFilters"] = map(DimensionValue.serialize)(value.activityFilters);
    result["floodlightConfigId"] = DimensionValue.serialize(value.floodlightConfigId);
    result["customFloodlightVariables"] = map(SortedDimension.serialize)(value.customFloodlightVariables);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Report.ReportPathToConversionCriteria.ReportPathToConversionCriteriaReportProperties
class ReportPathToConversionCriteriaReportProperties extends IdentityHash {
  /**
 * DFA checks to see if a click interaction occurred within the specified period of time before a
 * conversion. By default the value is pulled from Floodlight or you can manually enter a custom
 * value. Valid values: 1-90.
 */
  core.int clicksLookbackWindow;

  /** Enable pivoting on interaction path. */
  core.bool pivotOnInteractionPath;

  /**
 * DFA checks to see if an impression interaction occurred within the specified period of time
 * before a conversion. By default the value is pulled from Floodlight or you can manually enter a
 * custom value. Valid values: 1-90.
 */
  core.int impressionsLookbackWindow;

  /**
 * Include conversions that have no associated cookies and no exposures. Its therefore impossible to
 * know how the user was exposed to your ads during the lookback window prior to a conversion.
 */
  core.bool includeUnattributedIPConversions;

  /**
 * Include conversions of users with a DoubleClick cookie but without an exposure. That means the
 * user did not click or see an ad from the advertiser within the Floodlight group, or that the
 * interaction happened outside the lookback window.
 */
  core.bool includeUnattributedCookieConversions;

  /**
 * The maximum amount of time that can take place between interactions (clicks or impressions) by
 * the same user. Valid values: 1-90.
 */
  core.int maximumInteractionGap;

  /** Include conversions that have no cookie, but do have an exposure path. */
  core.bool includeAttributedIPConversions;

  /**
 * The maximum number of click interactions to include in the report. Advertisers currently paying
 * for E2C reports get up to 200 (100 clicks, 100 impressions). If another advertiser in your
 * network is paying for E2C, you can have up to 5 total exposures per report.
 */
  core.int maximumClickInteractions;

  /**
 * The maximum number of click interactions to include in the report. Advertisers currently paying
 * for E2C reports get up to 200 (100 clicks, 100 impressions). If another advertiser in your
 * network is paying for E2C, you can have up to 5 total exposures per report.
 */
  core.int maximumImpressionInteractions;

  /** Parses an instance from its JSON representation. */
  static ReportPathToConversionCriteriaReportProperties parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ReportPathToConversionCriteriaReportProperties();
    result.clicksLookbackWindow = identity(json["clicksLookbackWindow"]);
    result.pivotOnInteractionPath = identity(json["pivotOnInteractionPath"]);
    result.impressionsLookbackWindow = identity(json["impressionsLookbackWindow"]);
    result.includeUnattributedIPConversions = identity(json["includeUnattributedIPConversions"]);
    result.includeUnattributedCookieConversions = identity(json["includeUnattributedCookieConversions"]);
    result.maximumInteractionGap = identity(json["maximumInteractionGap"]);
    result.includeAttributedIPConversions = identity(json["includeAttributedIPConversions"]);
    result.maximumClickInteractions = identity(json["maximumClickInteractions"]);
    result.maximumImpressionInteractions = identity(json["maximumImpressionInteractions"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ReportPathToConversionCriteriaReportProperties value) {
    if (value == null) return null;
    final result = {};
    result["clicksLookbackWindow"] = identity(value.clicksLookbackWindow);
    result["pivotOnInteractionPath"] = identity(value.pivotOnInteractionPath);
    result["impressionsLookbackWindow"] = identity(value.impressionsLookbackWindow);
    result["includeUnattributedIPConversions"] = identity(value.includeUnattributedIPConversions);
    result["includeUnattributedCookieConversions"] = identity(value.includeUnattributedCookieConversions);
    result["maximumInteractionGap"] = identity(value.maximumInteractionGap);
    result["includeAttributedIPConversions"] = identity(value.includeAttributedIPConversions);
    result["maximumClickInteractions"] = identity(value.maximumClickInteractions);
    result["maximumImpressionInteractions"] = identity(value.maximumImpressionInteractions);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Report.ReportReachCriteria
class ReportReachCriteria extends IdentityHash {
  /** Activity group. */
  Activities activities;

  /** The list of dimensions the report should include. */
  core.List<SortedDimension> dimensions;

  /** The list of names of metrics the report should include. */
  core.List<core.String> metricNames;

  /** The date range this report should be run for. */
  DateRange dateRange;

  /**
 * The list of filters on which dimensions are filtered. Filters for different dimensions are ANDed,
 * filters for the same dimension are grouped together and ORed.
 */
  core.List<DimensionValue> dimensionFilters;

  /** The list of names of  Reach By Frequency metrics the report should include. */
  core.List<core.String> reachByFrequencyMetricNames;

  /** Custom Rich Media Events group. */
  CustomRichMediaEvents customRichMediaEvents;

  /** Parses an instance from its JSON representation. */
  static ReportReachCriteria parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ReportReachCriteria();
    result.activities = Activities.parse(json["activities"]);
    result.dimensions = map(SortedDimension.parse)(json["dimensions"]);
    result.metricNames = map(identity)(json["metricNames"]);
    result.dateRange = DateRange.parse(json["dateRange"]);
    result.dimensionFilters = map(DimensionValue.parse)(json["dimensionFilters"]);
    result.reachByFrequencyMetricNames = map(identity)(json["reachByFrequencyMetricNames"]);
    result.customRichMediaEvents = CustomRichMediaEvents.parse(json["customRichMediaEvents"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ReportReachCriteria value) {
    if (value == null) return null;
    final result = {};
    result["activities"] = Activities.serialize(value.activities);
    result["dimensions"] = map(SortedDimension.serialize)(value.dimensions);
    result["metricNames"] = map(identity)(value.metricNames);
    result["dateRange"] = DateRange.serialize(value.dateRange);
    result["dimensionFilters"] = map(DimensionValue.serialize)(value.dimensionFilters);
    result["reachByFrequencyMetricNames"] = map(identity)(value.reachByFrequencyMetricNames);
    result["customRichMediaEvents"] = CustomRichMediaEvents.serialize(value.customRichMediaEvents);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema Report.ReportSchedule
class ReportSchedule extends IdentityHash {
  /** Start date of date range for which scheduled reports should be run. */
  core.String startDate;

  /**
 * Enum to define for "MONTHLY" scheduled reports whether reports should be repeated on the same day
 * of the month as "startDate" or the same day of the week of the month. Possible values are: -
 * DAY_OF_MONTH - WEEK_OF_MONTH Example: If 'startDate' is Monday, April 2nd 2012 (2012-04-02),
 * "DAY_OF_MONTH" would run subsequent reports on the 2nd of every Month, and "WEEK_OF_MONTH" would
 * run subsequent reports on the first Monday of the month.
 */
  core.String runsOnDayOfMonth;

  /**
 * Defines every how many days, weeks or months the report should be run. Needs to be set when
 * "repeats" is either "DAILY", "WEEKLY" or "MONTHLY".
 */
  core.int every;

  /** The expiration date when the scheduled report stops running. */
  core.String expirationDate;

  /** Whether the schedule is active or not. Must be set to either true or false. */
  core.bool active;

  /**
 * The interval for which the report is repeated, one of: - "DAILY", also requires field "every" to
 * be set. - "WEEKLY", also requires fields "every" and "repeatsOnWeekDays" to be set. -
 * "TWICE_A_MONTH" - "MONTHLY", also requires fields "every" and "runsOnDayOfMonth" to be set. -
 * "QUARTERLY" - "YEARLY"
 */
  core.String repeats;

  /** List of week days "WEEKLY" on which scheduled reports should run. */
  core.List<core.String> repeatsOnWeekDays;

  /** Parses an instance from its JSON representation. */
  static ReportSchedule parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new ReportSchedule();
    result.startDate = identity(json["startDate"]);
    result.runsOnDayOfMonth = identity(json["runsOnDayOfMonth"]);
    result.every = identity(json["every"]);
    result.expirationDate = identity(json["expirationDate"]);
    result.active = identity(json["active"]);
    result.repeats = identity(json["repeats"]);
    result.repeatsOnWeekDays = map(identity)(json["repeatsOnWeekDays"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(ReportSchedule value) {
    if (value == null) return null;
    final result = {};
    result["startDate"] = identity(value.startDate);
    result["runsOnDayOfMonth"] = identity(value.runsOnDayOfMonth);
    result["every"] = identity(value.every);
    result["expirationDate"] = identity(value.expirationDate);
    result["active"] = identity(value.active);
    result["repeats"] = identity(value.repeats);
    result["repeatsOnWeekDays"] = map(identity)(value.repeatsOnWeekDays);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .SortedDimension
class SortedDimension extends IdentityHash {
  /** The kind of resource this is, in this case dfareporting#sortedDimension. */
  core.String kind;

  /** The name of the dimension. */
  core.String name;

  /** An optional sort order for the dimension column, one of:  
- "ASCENDING" 
- "DESCENDING" */
  core.String sortOrder;

  /** Parses an instance from its JSON representation. */
  static SortedDimension parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new SortedDimension();
    result.kind = identity(json["kind"]);
    result.name = identity(json["name"]);
    result.sortOrder = identity(json["sortOrder"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(SortedDimension value) {
    if (value == null) return null;
    final result = {};
    result["kind"] = identity(value.kind);
    result["name"] = identity(value.name);
    result["sortOrder"] = identity(value.sortOrder);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .UserProfile
class UserProfile extends IdentityHash {
  /** The user name. */
  core.String userName;

  /** The kind of resource this is, in this case dfareporting#userProfile. */
  core.String kind;

  /** The sub account ID this profile belongs to if applicable. */
  core.String subAccountId;

  /** The account name this profile belongs to. */
  core.String accountName;

  /** The eTag of this response for caching purposes. */
  core.String etag;

  /** The sub account name this profile belongs to if applicable. */
  core.String subAccountName;

  /** The unique ID of the user profile. */
  core.String profileId;

  /** The account ID to which this profile belongs. */
  core.String accountId;

  /** Parses an instance from its JSON representation. */
  static UserProfile parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new UserProfile();
    result.userName = identity(json["userName"]);
    result.kind = identity(json["kind"]);
    result.subAccountId = identity(json["subAccountId"]);
    result.accountName = identity(json["accountName"]);
    result.etag = identity(json["etag"]);
    result.subAccountName = identity(json["subAccountName"]);
    result.profileId = identity(json["profileId"]);
    result.accountId = identity(json["accountId"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(UserProfile value) {
    if (value == null) return null;
    final result = {};
    result["userName"] = identity(value.userName);
    result["kind"] = identity(value.kind);
    result["subAccountId"] = identity(value.subAccountId);
    result["accountName"] = identity(value.accountName);
    result["etag"] = identity(value.etag);
    result["subAccountName"] = identity(value.subAccountName);
    result["profileId"] = identity(value.profileId);
    result["accountId"] = identity(value.accountId);
    return result;
  }
  toString() => serialize(this).toString();
}

// Schema .UserProfileList
class UserProfileList extends IdentityHash {
  /** The user profiles returned in this response. */
  core.List<UserProfile> items;

  /** The kind of list this is, in this case dfareporting#userProfileList. */
  core.String kind;

  /** The eTag of this response for caching purposes. */
  core.String etag;

  /** Parses an instance from its JSON representation. */
  static UserProfileList parse(core.Map<core.String, core.Object> json) {
    if (json == null) return null;
    final result = new UserProfileList();
    result.items = map(UserProfile.parse)(json["items"]);
    result.kind = identity(json["kind"]);
    result.etag = identity(json["etag"]);
    return result;
  }
  /** Converts an instance to its JSON representation. */
  static core.Object serialize(UserProfileList value) {
    if (value == null) return null;
    final result = {};
    result["items"] = map(UserProfile.serialize)(value.items);
    result["kind"] = identity(value.kind);
    result["etag"] = identity(value.etag);
    return result;
  }
  toString() => serialize(this).toString();
}

// Enum DfareportingApi.Alt
class DfareportingApiAlt extends core.Object implements core.Hashable {
  /** Responses with Content-Type of application/json */
  const DfareportingApiAlt JSON = const DfareportingApiAlt._internal("json", 0);

  /** All values of this enumeration */
  const core.List<DfareportingApiAlt> values = const <DfareportingApiAlt>[
    JSON,
  ];

  /** Map from string representation to enumeration value */
  const _valuesMap = const <DfareportingApiAlt>{ 
    "json": JSON,
  };

  /** Get the enumeration value with a specified string representation, or null if none matches. */
  static DfareportingApiAlt valueOf(core.String item) => _valuesMap[item];

  final core.int _ordinal;
  final core.String _value;
  const DfareportingApiAlt._internal(core.String this._value, core.int this._ordinal);

  /** Get the string representation of an enumeration value */
  toString() => _value;
  hashCode() => _ordinal ^ "Alt".hashCode();
}

