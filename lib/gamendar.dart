library gamendar;

import 'dart:async';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'dart:ui' as dartui;

import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';
import 'package:googleapis/calendar/v3.dart' hide Colors;
import 'package:google_sign_in/google_sign_in.dart';

import 'package:igdb_client/igdb_client.dart';

part 'package:gamendar/src/app/app.dart';
part 'package:gamendar/src/app/themes.dart';

part 'package:gamendar/src/components/paginated_infinite_scroll_view.dart';
part 'package:gamendar/src/components/release_date_card.dart';
part 'package:gamendar/src/components/game_image.dart';
part 'package:gamendar/src/components/custom_appbar_scaffold.dart';

part 'package:gamendar/src/pages/settings_page.dart';
part 'package:gamendar/src/pages/recent_releases_page.dart';
part 'package:gamendar/src/pages/main_container.dart';
part 'package:gamendar/src/pages/details_page.dart';

part 'package:gamendar/src/state/app_model.dart';

part 'package:gamendar/src/services/api_keys.dart';
part 'package:gamendar/src/services/game_service_client.dart';
part 'package:gamendar/src/services/google_http_client.dart';
part 'package:gamendar/src/services/google_calendar_client.dart';

part 'package:gamendar/src/utils/datetime_helper.dart';
part 'package:gamendar/src/utils/asset_helper.dart';

