; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [351 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [696 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 68
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 67
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 108
	i32 26230656, ; 3: Microsoft.Extensions.DependencyModel => 0x1903f80 => 194
	i32 32687329, ; 4: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 271
	i32 34715100, ; 5: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 305
	i32 34839235, ; 6: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 48
	i32 39485524, ; 7: System.Net.WebSockets.dll => 0x25a8054 => 80
	i32 42639949, ; 8: System.Threading.Thread => 0x28aa24d => 145
	i32 66541672, ; 9: System.Diagnostics.StackTrace => 0x3f75868 => 30
	i32 67008169, ; 10: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 346
	i32 68219467, ; 11: System.Security.Cryptography.Primitives => 0x410f24b => 124
	i32 72070932, ; 12: Microsoft.Maui.Graphics.dll => 0x44bb714 => 223
	i32 82292897, ; 13: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 102
	i32 84937519, ; 14: Microsoft.FluentUI.AspNetCore.Components.Emojis.Flags => 0x5100b2f => 210
	i32 98325684, ; 15: Microsoft.Extensions.Diagnostics.Abstractions => 0x5dc54b4 => 196
	i32 101534019, ; 16: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 289
	i32 117431740, ; 17: System.Runtime.InteropServices => 0x6ffddbc => 107
	i32 120558881, ; 18: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 289
	i32 122350210, ; 19: System.Threading.Channels.dll => 0x74aea82 => 139
	i32 134690465, ; 20: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 309
	i32 142721839, ; 21: System.Net.WebHeaderCollection => 0x881c32f => 77
	i32 149972175, ; 22: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 124
	i32 159306688, ; 23: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 24: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 245
	i32 176265551, ; 25: System.ServiceProcess => 0xa81994f => 132
	i32 182336117, ; 26: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 291
	i32 184328833, ; 27: System.ValueTuple.dll => 0xafca281 => 151
	i32 195452805, ; 28: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 343
	i32 199333315, ; 29: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 344
	i32 205061960, ; 30: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 31: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 243
	i32 220171995, ; 32: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 221958352, ; 33: Microsoft.Extensions.Diagnostics.dll => 0xd3ad0d0 => 195
	i32 230216969, ; 34: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 265
	i32 230752869, ; 35: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 36: System.Linq.Parallel => 0xdcb05c4 => 59
	i32 231814094, ; 37: System.Globalization => 0xdd133ce => 42
	i32 246610117, ; 38: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 91
	i32 254259026, ; 39: Microsoft.AspNetCore.Components.dll => 0xf27af52 => 178
	i32 261689757, ; 40: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 248
	i32 276479776, ; 41: System.Threading.Timer.dll => 0x107abf20 => 147
	i32 278686392, ; 42: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 267
	i32 280482487, ; 43: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 264
	i32 280992041, ; 44: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 315
	i32 291076382, ; 45: System.IO.Pipes.AccessControl.dll => 0x1159791e => 54
	i32 291275502, ; 46: Microsoft.Extensions.Http.dll => 0x115c82ee => 199
	i32 298918909, ; 47: System.Net.Ping.dll => 0x11d123fd => 69
	i32 317674968, ; 48: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 343
	i32 318968648, ; 49: Xamarin.AndroidX.Activity.dll => 0x13031348 => 234
	i32 321597661, ; 50: System.Numerics => 0x132b30dd => 83
	i32 336156722, ; 51: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 328
	i32 342366114, ; 52: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 266
	i32 347068432, ; 53: SQLitePCLRaw.lib.e_sqlite3.android.dll => 0x14afd810 => 227
	i32 356389973, ; 54: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 327
	i32 360082299, ; 55: System.ServiceModel.Web => 0x15766b7b => 131
	i32 367780167, ; 56: System.IO.Pipes => 0x15ebe147 => 55
	i32 374914964, ; 57: System.Transactions.Local => 0x1658bf94 => 149
	i32 375677976, ; 58: System.Net.ServicePoint.dll => 0x16646418 => 74
	i32 379916513, ; 59: System.Threading.Thread.dll => 0x16a510e1 => 145
	i32 385762202, ; 60: System.Memory.dll => 0x16fe439a => 62
	i32 392610295, ; 61: System.Threading.ThreadPool.dll => 0x1766c1f7 => 146
	i32 395744057, ; 62: _Microsoft.Android.Resource.Designer => 0x17969339 => 347
	i32 403441872, ; 63: WindowsBase => 0x180c08d0 => 165
	i32 435591531, ; 64: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 339
	i32 441335492, ; 65: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 249
	i32 442565967, ; 66: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 67: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 262
	i32 451504562, ; 68: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 125
	i32 456227837, ; 69: System.Web.HttpUtility.dll => 0x1b317bfd => 152
	i32 459347974, ; 70: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 113
	i32 465846621, ; 71: mscorlib => 0x1bc4415d => 166
	i32 469710990, ; 72: System.dll => 0x1bff388e => 164
	i32 476646585, ; 73: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 264
	i32 486930444, ; 74: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 277
	i32 498788369, ; 75: System.ObjectModel => 0x1dbae811 => 84
	i32 500358224, ; 76: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 326
	i32 503918385, ; 77: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 320
	i32 513247710, ; 78: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 205
	i32 526420162, ; 79: System.Transactions.dll => 0x1f6088c2 => 150
	i32 527452488, ; 80: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 309
	i32 530272170, ; 81: System.Linq.Queryable => 0x1f9b4faa => 60
	i32 536502127, ; 82: Microsoft.FluentUI.AspNetCore.Components.Emoji => 0x1ffa5f6f => 207
	i32 539058512, ; 83: Microsoft.Extensions.Logging => 0x20216150 => 200
	i32 540030774, ; 84: System.IO.FileSystem.dll => 0x20303736 => 51
	i32 545304856, ; 85: System.Runtime.Extensions => 0x2080b118 => 103
	i32 546455878, ; 86: System.Runtime.Serialization.Xml => 0x20924146 => 114
	i32 549171840, ; 87: System.Globalization.Calendars => 0x20bbb280 => 40
	i32 557405415, ; 88: Jsr305Binding => 0x213954e7 => 302
	i32 569601784, ; 89: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 300
	i32 571352814, ; 90: AWSSDK.S3.dll => 0x220e26ee => 174
	i32 577335427, ; 91: System.Security.Cryptography.Cng => 0x22697083 => 120
	i32 592146354, ; 92: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 334
	i32 601371474, ; 93: System.IO.IsolatedStorage.dll => 0x23d83352 => 52
	i32 605376203, ; 94: System.IO.Compression.FileSystem => 0x24154ecb => 44
	i32 613668793, ; 95: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 119
	i32 627609679, ; 96: Xamarin.AndroidX.CustomView => 0x2568904f => 254
	i32 627931235, ; 97: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 332
	i32 639843206, ; 98: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 260
	i32 643868501, ; 99: System.Net => 0x2660a755 => 81
	i32 662205335, ; 100: System.Text.Encodings.Web.dll => 0x27787397 => 136
	i32 663517072, ; 101: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 296
	i32 666292255, ; 102: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 241
	i32 672442732, ; 103: System.Collections.Concurrent => 0x2814a96c => 8
	i32 683518922, ; 104: System.Net.Security => 0x28bdabca => 73
	i32 688181140, ; 105: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 314
	i32 690569205, ; 106: System.Xml.Linq.dll => 0x29293ff5 => 155
	i32 691348768, ; 107: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 311
	i32 693804605, ; 108: System.Windows => 0x295a9e3d => 154
	i32 699345723, ; 109: System.Reflection.Emit => 0x29af2b3b => 92
	i32 700284507, ; 110: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 306
	i32 700358131, ; 111: System.IO.Compression.ZipFile => 0x29be9df3 => 45
	i32 706645707, ; 112: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 329
	i32 709557578, ; 113: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 317
	i32 720511267, ; 114: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 310
	i32 722857257, ; 115: System.Runtime.Loader.dll => 0x2b15ed29 => 109
	i32 731701662, ; 116: Microsoft.Extensions.Options.ConfigurationExtensions => 0x2b9ce19e => 204
	i32 735137430, ; 117: System.Security.SecureString.dll => 0x2bd14e96 => 129
	i32 748832960, ; 118: SQLitePCLRaw.batteries_v2 => 0x2ca248c0 => 225
	i32 752232764, ; 119: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 120: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 231
	i32 759454413, ; 121: System.Net.Requests => 0x2d445acd => 72
	i32 762598435, ; 122: System.IO.Pipes.dll => 0x2d745423 => 55
	i32 775507847, ; 123: System.IO.Compression => 0x2e394f87 => 46
	i32 777317022, ; 124: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 338
	i32 789151979, ; 125: Microsoft.Extensions.Options => 0x2f0980eb => 203
	i32 790371945, ; 126: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 255
	i32 804715423, ; 127: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 128: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 269
	i32 823281589, ; 129: System.Private.Uri.dll => 0x311247b5 => 86
	i32 830298997, ; 130: System.IO.Compression.Brotli => 0x317d5b75 => 43
	i32 832635846, ; 131: System.Xml.XPath.dll => 0x31a103c6 => 160
	i32 834051424, ; 132: System.Net.Quic => 0x31b69d60 => 71
	i32 843511501, ; 133: Xamarin.AndroidX.Print => 0x3246f6cd => 282
	i32 873119928, ; 134: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 135: System.Globalization.dll => 0x34505120 => 42
	i32 878954865, ; 136: System.Net.Http.Json => 0x3463c971 => 63
	i32 904024072, ; 137: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 911108515, ; 138: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 53
	i32 926902833, ; 139: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 341
	i32 928116545, ; 140: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 305
	i32 952186615, ; 141: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 105
	i32 956575887, ; 142: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 310
	i32 966729478, ; 143: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 303
	i32 967690846, ; 144: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 266
	i32 975236339, ; 145: System.Diagnostics.Tracing => 0x3a20ecf3 => 34
	i32 975874589, ; 146: System.Xml.XDocument => 0x3a2aaa1d => 158
	i32 986514023, ; 147: System.Private.DataContractSerialization.dll => 0x3acd0267 => 85
	i32 987214855, ; 148: System.Diagnostics.Tools => 0x3ad7b407 => 32
	i32 992768348, ; 149: System.Collections.dll => 0x3b2c715c => 12
	i32 994442037, ; 150: System.IO.FileSystem => 0x3b45fb35 => 51
	i32 1001831731, ; 151: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 56
	i32 1012816738, ; 152: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 286
	i32 1019214401, ; 153: System.Drawing => 0x3cbffa41 => 36
	i32 1022446885, ; 154: Microsoft.FluentUI.AspNetCore.Components.Emojis.Activities => 0x3cf14d25 => 208
	i32 1028951442, ; 155: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 193
	i32 1029334545, ; 156: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 316
	i32 1031528504, ; 157: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 304
	i32 1035644815, ; 158: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 239
	i32 1036536393, ; 159: System.Drawing.Primitives.dll => 0x3dc84a49 => 35
	i32 1044663988, ; 160: System.Linq.Expressions.dll => 0x3e444eb4 => 58
	i32 1048992957, ; 161: Microsoft.Extensions.Diagnostics.Abstractions.dll => 0x3e865cbd => 196
	i32 1052210849, ; 162: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 273
	i32 1067306892, ; 163: GoogleGson => 0x3f9dcf8c => 176
	i32 1082857460, ; 164: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 165: Xamarin.Kotlin.StdLib => 0x409e66d8 => 307
	i32 1098259244, ; 166: System => 0x41761b2c => 164
	i32 1110309514, ; 167: Microsoft.Extensions.Hosting.Abstractions => 0x422dfa8a => 198
	i32 1118262833, ; 168: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 329
	i32 1121599056, ; 169: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 272
	i32 1127624469, ; 170: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 202
	i32 1149092582, ; 171: Xamarin.AndroidX.Window => 0x447dc2e6 => 299
	i32 1157931901, ; 172: Microsoft.EntityFrameworkCore.Abstractions => 0x4504a37d => 184
	i32 1168523401, ; 173: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 335
	i32 1170634674, ; 174: System.Web.dll => 0x45c677b2 => 153
	i32 1173126369, ; 175: Microsoft.Extensions.FileProviders.Abstractions.dll => 0x45ec7ce1 => 197
	i32 1175144683, ; 176: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 295
	i32 1178241025, ; 177: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 280
	i32 1183535466, ; 178: Microsoft.FluentUI.AspNetCore.Components.Emojis.Flags.dll => 0x468b516a => 210
	i32 1202000627, ; 179: Microsoft.EntityFrameworkCore.Abstractions.dll => 0x47a512f3 => 184
	i32 1203215381, ; 180: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 333
	i32 1204270330, ; 181: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 241
	i32 1204575371, ; 182: Microsoft.Extensions.Caching.Memory.dll => 0x47cc5c8b => 188
	i32 1208641965, ; 183: System.Diagnostics.Process => 0x480a69ad => 29
	i32 1214827643, ; 184: CommunityToolkit.Mvvm => 0x4868cc7b => 175
	i32 1219128291, ; 185: System.IO.IsolatedStorage => 0x48aa6be3 => 52
	i32 1234928153, ; 186: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 331
	i32 1243150071, ; 187: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 300
	i32 1253011324, ; 188: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1260983243, ; 189: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 315
	i32 1264511973, ; 190: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 290
	i32 1267360935, ; 191: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 294
	i32 1273260888, ; 192: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 246
	i32 1275534314, ; 193: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 311
	i32 1278448581, ; 194: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 238
	i32 1292207520, ; 195: SQLitePCLRaw.core.dll => 0x4d0585a0 => 226
	i32 1293217323, ; 196: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 257
	i32 1309188875, ; 197: System.Private.DataContractSerialization => 0x4e08a30b => 85
	i32 1322716291, ; 198: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 299
	i32 1324164729, ; 199: System.Linq => 0x4eed2679 => 61
	i32 1335329327, ; 200: System.Runtime.Serialization.Json.dll => 0x4f97822f => 112
	i32 1364015309, ; 201: System.IO => 0x514d38cd => 57
	i32 1373134921, ; 202: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 345
	i32 1376866003, ; 203: Xamarin.AndroidX.SavedState => 0x52114ed3 => 286
	i32 1379779777, ; 204: System.Resources.ResourceManager => 0x523dc4c1 => 99
	i32 1402170036, ; 205: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 206: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 250
	i32 1408764838, ; 207: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 111
	i32 1411638395, ; 208: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 101
	i32 1422545099, ; 209: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 102
	i32 1430672901, ; 210: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 313
	i32 1434145427, ; 211: System.Runtime.Handles => 0x557b5293 => 104
	i32 1435222561, ; 212: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 303
	i32 1439761251, ; 213: System.Net.Quic.dll => 0x55d10363 => 71
	i32 1452070440, ; 214: System.Formats.Asn1.dll => 0x568cd628 => 38
	i32 1453312822, ; 215: System.Diagnostics.Tools.dll => 0x569fcb36 => 32
	i32 1457743152, ; 216: System.Runtime.Extensions.dll => 0x56e36530 => 103
	i32 1458022317, ; 217: System.Net.Security.dll => 0x56e7a7ad => 73
	i32 1461004990, ; 218: es\Microsoft.Maui.Controls.resources => 0x57152abe => 319
	i32 1461234159, ; 219: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 220: System.Security.Cryptography.OpenSsl => 0x57201017 => 123
	i32 1462112819, ; 221: System.IO.Compression.dll => 0x57261233 => 46
	i32 1469204771, ; 222: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 240
	i32 1470490898, ; 223: Microsoft.Extensions.Primitives => 0x57a5e912 => 205
	i32 1479771757, ; 224: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 225: System.IO.Compression.Brotli.dll => 0x583e844f => 43
	i32 1487239319, ; 226: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 227: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 287
	i32 1490351284, ; 228: Microsoft.Data.Sqlite.dll => 0x58d4f4b4 => 182
	i32 1493001747, ; 229: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 323
	i32 1505131794, ; 230: Microsoft.Extensions.Http => 0x59b67d12 => 199
	i32 1506417548, ; 231: Microsoft.FluentUI.AspNetCore.Components.dll => 0x59ca1b8c => 206
	i32 1511525525, ; 232: MySqlConnector => 0x5a180c95 => 224
	i32 1514721132, ; 233: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 318
	i32 1536373174, ; 234: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 31
	i32 1543031311, ; 235: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 138
	i32 1543355203, ; 236: System.Reflection.Emit.dll => 0x5bfdbb43 => 92
	i32 1550322496, ; 237: System.Reflection.Extensions.dll => 0x5c680b40 => 93
	i32 1551623176, ; 238: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 338
	i32 1565862583, ; 239: System.IO.FileSystem.Primitives => 0x5d552ab7 => 49
	i32 1566207040, ; 240: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 141
	i32 1573704789, ; 241: System.Runtime.Serialization.Json => 0x5dccd455 => 112
	i32 1580037396, ; 242: System.Threading.Overlapped => 0x5e2d7514 => 140
	i32 1582372066, ; 243: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 256
	i32 1592978981, ; 244: System.Runtime.Serialization.dll => 0x5ef2ee25 => 115
	i32 1597949149, ; 245: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 304
	i32 1601112923, ; 246: System.Xml.Serialization => 0x5f6f0b5b => 157
	i32 1604827217, ; 247: System.Net.WebClient => 0x5fa7b851 => 76
	i32 1618516317, ; 248: System.Net.WebSockets.Client.dll => 0x6078995d => 79
	i32 1622152042, ; 249: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 276
	i32 1622358360, ; 250: System.Dynamic.Runtime => 0x60b33958 => 37
	i32 1624863272, ; 251: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 298
	i32 1635184631, ; 252: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 260
	i32 1636350590, ; 253: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 253
	i32 1639515021, ; 254: System.Net.Http.dll => 0x61b9038d => 64
	i32 1639986890, ; 255: System.Text.RegularExpressions => 0x61c036ca => 138
	i32 1641389582, ; 256: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1642351949, ; 257: Microsoft.FluentUI.AspNetCore.Components.Emojis.AnimalsNature.dll => 0x61e44d4d => 209
	i32 1653222621, ; 258: Microsoft.FluentUI.AspNetCore.Components.Emojis.Symbols => 0x628a2cdd => 215
	i32 1657153582, ; 259: System.Runtime => 0x62c6282e => 116
	i32 1658241508, ; 260: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 292
	i32 1658251792, ; 261: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 301
	i32 1670060433, ; 262: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 248
	i32 1670326403, ; 263: AWSSDK.Core.dll => 0x638f2883 => 173
	i32 1675553242, ; 264: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 48
	i32 1677501392, ; 265: System.Net.Primitives.dll => 0x63fca3d0 => 70
	i32 1678508291, ; 266: System.Net.WebSockets => 0x640c0103 => 80
	i32 1679769178, ; 267: System.Security.Cryptography => 0x641f3e5a => 126
	i32 1688112883, ; 268: Microsoft.Data.Sqlite => 0x649e8ef3 => 182
	i32 1689493916, ; 269: Microsoft.EntityFrameworkCore.dll => 0x64b3a19c => 183
	i32 1691477237, ; 270: System.Reflection.Metadata => 0x64d1e4f5 => 94
	i32 1696967625, ; 271: System.Security.Cryptography.Csp => 0x6525abc9 => 121
	i32 1698840827, ; 272: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 308
	i32 1701541528, ; 273: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1711441057, ; 274: SQLitePCLRaw.lib.e_sqlite3.android => 0x660284a1 => 227
	i32 1720223769, ; 275: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 269
	i32 1726116996, ; 276: System.Reflection.dll => 0x66e27484 => 97
	i32 1728033016, ; 277: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 28
	i32 1729485958, ; 278: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 244
	i32 1736233607, ; 279: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 336
	i32 1743415430, ; 280: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 314
	i32 1744735666, ; 281: System.Transactions.Local.dll => 0x67fe8db2 => 149
	i32 1746115085, ; 282: System.IO.Pipelines.dll => 0x68139a0d => 229
	i32 1746316138, ; 283: Mono.Android.Export => 0x6816ab6a => 169
	i32 1750313021, ; 284: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1750688822, ; 285: Microsoft.FluentUI.AspNetCore.Components.Emojis.AnimalsNature => 0x68596436 => 209
	i32 1758240030, ; 286: System.Resources.Reader.dll => 0x68cc9d1e => 98
	i32 1760259689, ; 287: Microsoft.AspNetCore.Components.Web.dll => 0x68eb6e69 => 180
	i32 1763938596, ; 288: System.Diagnostics.TraceSource.dll => 0x69239124 => 33
	i32 1765942094, ; 289: System.Reflection.Extensions => 0x6942234e => 93
	i32 1766324549, ; 290: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 291
	i32 1770582343, ; 291: Microsoft.Extensions.Logging.dll => 0x6988f147 => 200
	i32 1776026572, ; 292: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 293: System.Globalization.Extensions.dll => 0x69ec0683 => 41
	i32 1780572499, ; 294: Mono.Android.Runtime.dll => 0x6a216153 => 170
	i32 1782862114, ; 295: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 330
	i32 1788241197, ; 296: Xamarin.AndroidX.Fragment => 0x6a96652d => 262
	i32 1793755602, ; 297: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 322
	i32 1808609942, ; 298: Xamarin.AndroidX.Loader => 0x6bcd3296 => 276
	i32 1813058853, ; 299: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 307
	i32 1813201214, ; 300: Xamarin.Google.Android.Material => 0x6c13413e => 301
	i32 1818569960, ; 301: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 281
	i32 1818787751, ; 302: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1824175904, ; 303: System.Text.Encoding.Extensions => 0x6cbab720 => 134
	i32 1824722060, ; 304: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 111
	i32 1828688058, ; 305: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 201
	i32 1831691230, ; 306: Microsoft.FluentUI.AspNetCore.Components.Emojis.FoodDrink => 0x6d2d63de => 211
	i32 1842015223, ; 307: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 342
	i32 1847515442, ; 308: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 231
	i32 1853025655, ; 309: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 339
	i32 1858542181, ; 310: System.Linq.Expressions => 0x6ec71a65 => 58
	i32 1870277092, ; 311: System.Reflection.Primitives => 0x6f7a29e4 => 95
	i32 1875935024, ; 312: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 321
	i32 1879696579, ; 313: System.Formats.Tar.dll => 0x7009e4c3 => 39
	i32 1885316902, ; 314: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 242
	i32 1886040351, ; 315: Microsoft.EntityFrameworkCore.Sqlite.dll => 0x706ab11f => 186
	i32 1888955245, ; 316: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 317: System.Reflection.Metadata.dll => 0x70a66bdd => 94
	i32 1898237753, ; 318: System.Reflection.DispatchProxy => 0x7124cf39 => 89
	i32 1900610850, ; 319: System.Resources.ResourceManager.dll => 0x71490522 => 99
	i32 1910275211, ; 320: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1939592360, ; 321: System.Private.Xml.Linq => 0x739bd4a8 => 87
	i32 1956758971, ; 322: System.Resources.Writer => 0x74a1c5bb => 100
	i32 1961813231, ; 323: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 288
	i32 1962452802, ; 324: Microsoft.FluentUI.AspNetCore.Components.Emojis.SmileysEmotion.dll => 0x74f8a742 => 214
	i32 1968388702, ; 325: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 189
	i32 1983156543, ; 326: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 308
	i32 1985761444, ; 327: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 233
	i32 2003115576, ; 328: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 318
	i32 2011961780, ; 329: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2014489277, ; 330: Microsoft.EntityFrameworkCore.Sqlite => 0x7812aabd => 186
	i32 2019465201, ; 331: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 273
	i32 2025202353, ; 332: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 313
	i32 2031763787, ; 333: Xamarin.Android.Glide => 0x791a414b => 230
	i32 2045470958, ; 334: System.Private.Xml => 0x79eb68ee => 88
	i32 2048278909, ; 335: Microsoft.Extensions.Configuration.Binder.dll => 0x7a16417d => 191
	i32 2055257422, ; 336: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 268
	i32 2060060697, ; 337: System.Windows.dll => 0x7aca0819 => 154
	i32 2066184531, ; 338: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 317
	i32 2070888862, ; 339: System.Diagnostics.TraceSource => 0x7b6f419e => 33
	i32 2076137363, ; 340: AWSSDK.S3 => 0x7bbf5793 => 174
	i32 2079903147, ; 341: System.Runtime.dll => 0x7bf8cdab => 116
	i32 2090596640, ; 342: System.Numerics.Vectors => 0x7c9bf920 => 82
	i32 2103459038, ; 343: SQLitePCLRaw.provider.e_sqlite3.dll => 0x7d603cde => 228
	i32 2127167465, ; 344: System.Console => 0x7ec9ffe9 => 20
	i32 2129659773, ; 345: Microsoft.FluentUI.AspNetCore.Components => 0x7ef0077d => 206
	i32 2142473426, ; 346: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 347: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 162
	i32 2146852085, ; 348: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2159891885, ; 349: Microsoft.Maui => 0x80bd55ad => 221
	i32 2169148018, ; 350: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 325
	i32 2181898931, ; 351: Microsoft.Extensions.Options.dll => 0x820d22b3 => 203
	i32 2192057212, ; 352: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 201
	i32 2193016926, ; 353: System.ObjectModel.dll => 0x82b6c85e => 84
	i32 2193849673, ; 354: Microsoft.FluentUI.AspNetCore.Components.Emojis.Objects.dll => 0x82c37d49 => 212
	i32 2197979891, ; 355: Microsoft.Extensions.DependencyModel.dll => 0x830282f3 => 194
	i32 2201107256, ; 356: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 312
	i32 2201231467, ; 357: System.Net.Http => 0x8334206b => 64
	i32 2207618523, ; 358: it\Microsoft.Maui.Controls.resources => 0x839595db => 327
	i32 2217644978, ; 359: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 295
	i32 2222056684, ; 360: System.Threading.Tasks.Parallel => 0x8471e4ec => 143
	i32 2244775296, ; 361: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 277
	i32 2252106437, ; 362: System.Xml.Serialization.dll => 0x863c6ac5 => 157
	i32 2252897993, ; 363: Microsoft.EntityFrameworkCore => 0x86487ec9 => 183
	i32 2256313426, ; 364: System.Globalization.Extensions => 0x867c9c52 => 41
	i32 2265110946, ; 365: System.Security.AccessControl.dll => 0x8702d9a2 => 117
	i32 2266799131, ; 366: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 190
	i32 2267999099, ; 367: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 232
	i32 2270573516, ; 368: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 321
	i32 2279755925, ; 369: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 284
	i32 2293034957, ; 370: System.ServiceModel.Web.dll => 0x88acefcd => 131
	i32 2295906218, ; 371: System.Net.Sockets => 0x88d8bfaa => 75
	i32 2298471582, ; 372: System.Net.Mail => 0x88ffe49e => 66
	i32 2303942373, ; 373: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 331
	i32 2305521784, ; 374: System.Private.CoreLib.dll => 0x896b7878 => 172
	i32 2315684594, ; 375: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 236
	i32 2320631194, ; 376: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 143
	i32 2340441535, ; 377: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 106
	i32 2344264397, ; 378: System.ValueTuple => 0x8bbaa2cd => 151
	i32 2353062107, ; 379: System.Net.Primitives => 0x8c40e0db => 70
	i32 2368005991, ; 380: System.Xml.ReaderWriter.dll => 0x8d24e767 => 156
	i32 2371007202, ; 381: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 189
	i32 2378619854, ; 382: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 121
	i32 2383496789, ; 383: System.Security.Principal.Windows.dll => 0x8e114655 => 127
	i32 2395872292, ; 384: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 326
	i32 2401565422, ; 385: System.Web.HttpUtility => 0x8f24faee => 152
	i32 2403452196, ; 386: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 259
	i32 2411328690, ; 387: Microsoft.AspNetCore.Components => 0x8fb9f4b2 => 178
	i32 2421380589, ; 388: System.Threading.Tasks.Dataflow => 0x905355ed => 141
	i32 2423080555, ; 389: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 246
	i32 2427813419, ; 390: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 323
	i32 2435356389, ; 391: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 392: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2442556106, ; 393: Microsoft.JSInterop.dll => 0x919672ca => 217
	i32 2454642406, ; 394: System.Text.Encoding.dll => 0x924edee6 => 135
	i32 2458678730, ; 395: System.Net.Sockets.dll => 0x928c75ca => 75
	i32 2459001652, ; 396: System.Linq.Parallel.dll => 0x92916334 => 59
	i32 2465273461, ; 397: SQLitePCLRaw.batteries_v2.dll => 0x92f11675 => 225
	i32 2465532216, ; 398: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 249
	i32 2471841756, ; 399: netstandard.dll => 0x93554fdc => 167
	i32 2475788418, ; 400: Java.Interop.dll => 0x93918882 => 168
	i32 2480646305, ; 401: Microsoft.Maui.Controls => 0x93dba8a1 => 219
	i32 2483903535, ; 402: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 403: System.Net.ServicePoint => 0x94147f61 => 74
	i32 2490993605, ; 404: System.AppContext.dll => 0x94798bc5 => 6
	i32 2501346920, ; 405: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2505896520, ; 406: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 271
	i32 2522472828, ; 407: Xamarin.Android.Glide.dll => 0x9659e17c => 230
	i32 2537015816, ; 408: Microsoft.AspNetCore.Authorization => 0x9737ca08 => 177
	i32 2538310050, ; 409: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 91
	i32 2550873716, ; 410: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 324
	i32 2562349572, ; 411: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 412: System.Text.Encodings.Web => 0x9930ee42 => 136
	i32 2581783588, ; 413: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 272
	i32 2581819634, ; 414: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 294
	i32 2585220780, ; 415: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 134
	i32 2585805581, ; 416: System.Net.Ping => 0x9a20430d => 69
	i32 2585813321, ; 417: Microsoft.AspNetCore.Components.Forms => 0x9a206149 => 179
	i32 2586846288, ; 418: Microsoft.FluentUI.AspNetCore.Components.Emojis.Activities.dll => 0x9a302450 => 208
	i32 2589602615, ; 419: System.Threading.ThreadPool => 0x9a5a3337 => 146
	i32 2592341985, ; 420: Microsoft.Extensions.FileProviders.Abstractions => 0x9a83ffe1 => 197
	i32 2593496499, ; 421: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 333
	i32 2605712449, ; 422: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 312
	i32 2615233544, ; 423: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 263
	i32 2616218305, ; 424: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 202
	i32 2617129537, ; 425: System.Private.Xml.dll => 0x9bfe3a41 => 88
	i32 2618712057, ; 426: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 96
	i32 2620871830, ; 427: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 253
	i32 2624644809, ; 428: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 258
	i32 2626831493, ; 429: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 328
	i32 2627185994, ; 430: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 31
	i32 2629843544, ; 431: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 45
	i32 2633051222, ; 432: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 267
	i32 2634653062, ; 433: Microsoft.EntityFrameworkCore.Relational.dll => 0x9d099d86 => 185
	i32 2663391936, ; 434: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 232
	i32 2663698177, ; 435: System.Runtime.Loader => 0x9ec4cf01 => 109
	i32 2664396074, ; 436: System.Xml.XDocument.dll => 0x9ecf752a => 158
	i32 2665462719, ; 437: Microsoft.FluentUI.AspNetCore.Components.Emoji.dll => 0x9edfbbbf => 207
	i32 2665622720, ; 438: System.Drawing.Primitives => 0x9ee22cc0 => 35
	i32 2676780864, ; 439: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2686887180, ; 440: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 114
	i32 2693849962, ; 441: System.IO.dll => 0xa090e36a => 57
	i32 2701096212, ; 442: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 292
	i32 2715334215, ; 443: System.Threading.Tasks.dll => 0xa1d8b647 => 144
	i32 2717744543, ; 444: System.Security.Claims => 0xa1fd7d9f => 118
	i32 2719963679, ; 445: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 120
	i32 2724373263, ; 446: System.Runtime.Numerics.dll => 0xa262a30f => 110
	i32 2732626843, ; 447: Xamarin.AndroidX.Activity => 0xa2e0939b => 234
	i32 2735172069, ; 448: System.Threading.Channels => 0xa30769e5 => 139
	i32 2735631878, ; 449: Microsoft.AspNetCore.Authorization.dll => 0xa30e6e06 => 177
	i32 2737747696, ; 450: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 240
	i32 2740948882, ; 451: System.IO.Pipes.AccessControl => 0xa35f8f92 => 54
	i32 2748088231, ; 452: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 105
	i32 2752995522, ; 453: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 334
	i32 2758225723, ; 454: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 220
	i32 2764765095, ; 455: Microsoft.Maui.dll => 0xa4caf7a7 => 221
	i32 2765824710, ; 456: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 133
	i32 2770495804, ; 457: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 306
	i32 2778768386, ; 458: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 297
	i32 2779977773, ; 459: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 285
	i32 2785988530, ; 460: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 340
	i32 2788224221, ; 461: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 263
	i32 2801831435, ; 462: Microsoft.Maui.Graphics => 0xa7008e0b => 223
	i32 2803228030, ; 463: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 159
	i32 2806116107, ; 464: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 319
	i32 2810250172, ; 465: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 250
	i32 2819470561, ; 466: System.Xml.dll => 0xa80db4e1 => 163
	i32 2821205001, ; 467: System.ServiceProcess.dll => 0xa8282c09 => 132
	i32 2821294376, ; 468: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 285
	i32 2824502124, ; 469: System.Xml.XmlDocument => 0xa85a7b6c => 161
	i32 2831556043, ; 470: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 332
	i32 2833784645, ; 471: Microsoft.AspNetCore.Metadata => 0xa8e81f45 => 181
	i32 2838993487, ; 472: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 274
	i32 2847789619, ; 473: Microsoft.EntityFrameworkCore.Relational => 0xa9bdd233 => 185
	i32 2849599387, ; 474: System.Threading.Overlapped.dll => 0xa9d96f9b => 140
	i32 2853208004, ; 475: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 297
	i32 2855708567, ; 476: Xamarin.AndroidX.Transition => 0xaa36a797 => 293
	i32 2861098320, ; 477: Mono.Android.Export.dll => 0xaa88e550 => 169
	i32 2861189240, ; 478: Microsoft.Maui.Essentials => 0xaa8a4878 => 222
	i32 2870099610, ; 479: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 235
	i32 2873277539, ; 480: Microsoft.FluentUI.AspNetCore.Components.Emojis.Symbols.dll => 0xab42bc63 => 215
	i32 2875164099, ; 481: Jsr305Binding.dll => 0xab5f85c3 => 302
	i32 2875220617, ; 482: System.Globalization.Calendars.dll => 0xab606289 => 40
	i32 2884993177, ; 483: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 261
	i32 2887636118, ; 484: System.Net.dll => 0xac1dd496 => 81
	i32 2892341533, ; 485: Microsoft.AspNetCore.Components.Web => 0xac65a11d => 180
	i32 2899753641, ; 486: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 56
	i32 2900621748, ; 487: System.Dynamic.Runtime.dll => 0xace3f9b4 => 37
	i32 2901442782, ; 488: System.Reflection => 0xacf080de => 97
	i32 2905242038, ; 489: mscorlib.dll => 0xad2a79b6 => 166
	i32 2909740682, ; 490: System.Private.CoreLib => 0xad6f1e8a => 172
	i32 2916838712, ; 491: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 298
	i32 2919462931, ; 492: System.Numerics.Vectors.dll => 0xae037813 => 82
	i32 2921128767, ; 493: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 237
	i32 2936416060, ; 494: System.Resources.Reader => 0xaf06273c => 98
	i32 2940926066, ; 495: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 30
	i32 2942453041, ; 496: System.Xml.XPath.XDocument => 0xaf624531 => 159
	i32 2959614098, ; 497: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2968338931, ; 498: System.Security.Principal.Windows => 0xb0ed41f3 => 127
	i32 2971004615, ; 499: Microsoft.Extensions.Options.ConfigurationExtensions.dll => 0xb115eec7 => 204
	i32 2972252294, ; 500: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 119
	i32 2978675010, ; 501: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 257
	i32 2987532451, ; 502: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 288
	i32 2996846495, ; 503: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 270
	i32 3016983068, ; 504: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 290
	i32 3019664252, ; 505: Microsoft.FluentUI.AspNetCore.Components.Emojis.PeopleBody => 0xb3fc6b7c => 213
	i32 3020703001, ; 506: Microsoft.Extensions.Diagnostics => 0xb40c4519 => 195
	i32 3023353419, ; 507: WindowsBase.dll => 0xb434b64b => 165
	i32 3024354802, ; 508: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 265
	i32 3028510009, ; 509: xclsvApp.dll => 0xb4836539 => 0
	i32 3038032645, ; 510: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 347
	i32 3056245963, ; 511: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 287
	i32 3057625584, ; 512: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 278
	i32 3059408633, ; 513: Mono.Android.Runtime => 0xb65adef9 => 170
	i32 3059793426, ; 514: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3069363400, ; 515: Microsoft.Extensions.Caching.Abstractions.dll => 0xb6f2c4c8 => 187
	i32 3075834255, ; 516: System.Threading.Tasks => 0xb755818f => 144
	i32 3077302341, ; 517: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 325
	i32 3090735792, ; 518: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 125
	i32 3095508748, ; 519: Microsoft.FluentUI.AspNetCore.Components.Emojis.SmileysEmotion => 0xb881b70c => 214
	i32 3099732863, ; 520: System.Security.Claims.dll => 0xb8c22b7f => 118
	i32 3103600923, ; 521: System.Formats.Asn1 => 0xb8fd311b => 38
	i32 3111772706, ; 522: System.Runtime.Serialization => 0xb979e222 => 115
	i32 3121463068, ; 523: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 47
	i32 3124832203, ; 524: System.Threading.Tasks.Extensions => 0xba4127cb => 142
	i32 3132293585, ; 525: System.Security.AccessControl => 0xbab301d1 => 117
	i32 3147165239, ; 526: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 34
	i32 3148237826, ; 527: GoogleGson.dll => 0xbba64c02 => 176
	i32 3159123045, ; 528: System.Reflection.Primitives.dll => 0xbc4c6465 => 95
	i32 3160747431, ; 529: System.IO.MemoryMappedFiles => 0xbc652da7 => 53
	i32 3166208407, ; 530: Microsoft.FluentUI.AspNetCore.Components.Emojis.TravelPlaces => 0xbcb88197 => 216
	i32 3178803400, ; 531: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 279
	i32 3192346100, ; 532: System.Security.SecureString => 0xbe4755f4 => 129
	i32 3193515020, ; 533: System.Web => 0xbe592c0c => 153
	i32 3195844289, ; 534: Microsoft.Extensions.Caching.Abstractions => 0xbe7cb6c1 => 187
	i32 3204380047, ; 535: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 536: System.Xml.XmlDocument.dll => 0xbf506931 => 161
	i32 3211777861, ; 537: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 256
	i32 3220365878, ; 538: System.Threading => 0xbff2e236 => 148
	i32 3226221578, ; 539: System.Runtime.Handles.dll => 0xc04c3c0a => 104
	i32 3251039220, ; 540: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 89
	i32 3258312781, ; 541: Xamarin.AndroidX.CardView => 0xc235e84d => 244
	i32 3265493905, ; 542: System.Linq.Queryable.dll => 0xc2a37b91 => 60
	i32 3265893370, ; 543: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 142
	i32 3277815716, ; 544: System.Resources.Writer.dll => 0xc35f7fa4 => 100
	i32 3279906254, ; 545: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 546: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3290767353, ; 547: System.Security.Cryptography.Encoding => 0xc4251ff9 => 122
	i32 3299363146, ; 548: System.Text.Encoding => 0xc4a8494a => 135
	i32 3303498502, ; 549: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 28
	i32 3305363605, ; 550: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 320
	i32 3316684772, ; 551: System.Net.Requests.dll => 0xc5b097e4 => 72
	i32 3317135071, ; 552: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 254
	i32 3317144872, ; 553: System.Data => 0xc5b79d28 => 24
	i32 3340431453, ; 554: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 242
	i32 3345895724, ; 555: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 283
	i32 3346324047, ; 556: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 280
	i32 3357674450, ; 557: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 337
	i32 3358260929, ; 558: System.Text.Json => 0xc82afec1 => 137
	i32 3360279109, ; 559: SQLitePCLRaw.core => 0xc849ca45 => 226
	i32 3362336904, ; 560: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 235
	i32 3362522851, ; 561: Xamarin.AndroidX.Core => 0xc86c06e3 => 251
	i32 3366347497, ; 562: Java.Interop => 0xc8a662e9 => 168
	i32 3374999561, ; 563: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 284
	i32 3381016424, ; 564: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 316
	i32 3395150330, ; 565: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 101
	i32 3403906625, ; 566: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 123
	i32 3405233483, ; 567: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 255
	i32 3421170118, ; 568: Microsoft.Extensions.Configuration.Binder => 0xcbeae9c6 => 191
	i32 3428513518, ; 569: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 192
	i32 3429136800, ; 570: System.Xml => 0xcc6479a0 => 163
	i32 3430777524, ; 571: netstandard => 0xcc7d82b4 => 167
	i32 3441283291, ; 572: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 258
	i32 3445260447, ; 573: System.Formats.Tar => 0xcd5a809f => 39
	i32 3447171714, ; 574: Microsoft.FluentUI.AspNetCore.Components.Emojis.FoodDrink.dll => 0xcd77aa82 => 211
	i32 3452344032, ; 575: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 218
	i32 3457240403, ; 576: AWSSDK.Core => 0xce114d53 => 173
	i32 3463511458, ; 577: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 324
	i32 3464190856, ; 578: Microsoft.AspNetCore.Components.Forms.dll => 0xce7b5b88 => 179
	i32 3471940407, ; 579: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3476120550, ; 580: Mono.Android => 0xcf3163e6 => 171
	i32 3479583265, ; 581: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 337
	i32 3484440000, ; 582: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 336
	i32 3485117614, ; 583: System.Text.Json.dll => 0xcfbaacae => 137
	i32 3486566296, ; 584: System.Transactions => 0xcfd0c798 => 150
	i32 3493954962, ; 585: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 247
	i32 3500000672, ; 586: Microsoft.JSInterop => 0xd09dc5a0 => 217
	i32 3509114376, ; 587: System.Xml.Linq => 0xd128d608 => 155
	i32 3515174580, ; 588: System.Security.dll => 0xd1854eb4 => 130
	i32 3530912306, ; 589: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 590: System.Net.HttpListener => 0xd2ff69f1 => 65
	i32 3560100363, ; 591: System.Threading.Timer => 0xd432d20b => 147
	i32 3570554715, ; 592: System.IO.FileSystem.AccessControl => 0xd4d2575b => 47
	i32 3580758918, ; 593: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 344
	i32 3597029428, ; 594: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 233
	i32 3598340787, ; 595: System.Net.WebSockets.Client => 0xd67a52b3 => 79
	i32 3608519521, ; 596: System.Linq.dll => 0xd715a361 => 61
	i32 3624195450, ; 597: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 106
	i32 3627220390, ; 598: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 282
	i32 3633644679, ; 599: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 237
	i32 3638274909, ; 600: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 49
	i32 3641597786, ; 601: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 268
	i32 3643446276, ; 602: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 341
	i32 3643854240, ; 603: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 279
	i32 3645089577, ; 604: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3657292374, ; 605: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 190
	i32 3660523487, ; 606: System.Net.NetworkInformation => 0xda2f27df => 68
	i32 3672681054, ; 607: Mono.Android.dll => 0xdae8aa5e => 171
	i32 3682565725, ; 608: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 243
	i32 3684561358, ; 609: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 247
	i32 3697841164, ; 610: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 346
	i32 3700866549, ; 611: System.Net.WebProxy.dll => 0xdc96bdf5 => 78
	i32 3706696989, ; 612: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 252
	i32 3716563718, ; 613: System.Runtime.Intrinsics => 0xdd864306 => 108
	i32 3718780102, ; 614: Xamarin.AndroidX.Annotation => 0xdda814c6 => 236
	i32 3724971120, ; 615: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 278
	i32 3732100267, ; 616: System.Net.NameResolution => 0xde7354ab => 67
	i32 3732214720, ; 617: Microsoft.AspNetCore.Metadata.dll => 0xde7513c0 => 181
	i32 3737834244, ; 618: System.Net.Http.Json.dll => 0xdecad304 => 63
	i32 3748608112, ; 619: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 27
	i32 3751444290, ; 620: System.Xml.XPath => 0xdf9a7f42 => 160
	i32 3754567612, ; 621: SQLitePCLRaw.provider.e_sqlite3 => 0xdfca27bc => 228
	i32 3786282454, ; 622: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 245
	i32 3792276235, ; 623: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3800979733, ; 624: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 218
	i32 3802395368, ; 625: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3819260425, ; 626: System.Net.WebProxy => 0xe3a54a09 => 78
	i32 3823082795, ; 627: System.Security.Cryptography.dll => 0xe3df9d2b => 126
	i32 3829621856, ; 628: System.Numerics.dll => 0xe4436460 => 83
	i32 3841636137, ; 629: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 193
	i32 3844307129, ; 630: System.Net.Mail.dll => 0xe52378b9 => 66
	i32 3849253459, ; 631: System.Runtime.InteropServices.dll => 0xe56ef253 => 107
	i32 3870376305, ; 632: System.Net.HttpListener.dll => 0xe6b14171 => 65
	i32 3873536506, ; 633: System.Security.Principal => 0xe6e179fa => 128
	i32 3875112723, ; 634: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 122
	i32 3879880761, ; 635: Microsoft.FluentUI.AspNetCore.Components.Emojis.PeopleBody.dll => 0xe7424839 => 213
	i32 3885497537, ; 636: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 77
	i32 3885922214, ; 637: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 293
	i32 3888767677, ; 638: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 283
	i32 3889960447, ; 639: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 345
	i32 3896106733, ; 640: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 641: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 251
	i32 3901907137, ; 642: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3920810846, ; 643: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 44
	i32 3921031405, ; 644: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 296
	i32 3928044579, ; 645: System.Xml.ReaderWriter => 0xea213423 => 156
	i32 3930554604, ; 646: System.Security.Principal.dll => 0xea4780ec => 128
	i32 3931092270, ; 647: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 281
	i32 3945713374, ; 648: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3953953790, ; 649: System.Text.Encoding.CodePages => 0xebac8bfe => 133
	i32 3955647286, ; 650: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 239
	i32 3959773229, ; 651: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 270
	i32 3980434154, ; 652: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 340
	i32 3987592930, ; 653: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 322
	i32 4003436829, ; 654: System.Diagnostics.Process.dll => 0xee9f991d => 29
	i32 4015948917, ; 655: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 238
	i32 4023392905, ; 656: System.IO.Pipelines => 0xefd01a89 => 229
	i32 4025784931, ; 657: System.Memory => 0xeff49a63 => 62
	i32 4046471985, ; 658: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 220
	i32 4054681211, ; 659: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 90
	i32 4065015087, ; 660: Microsoft.FluentUI.AspNetCore.Components.Emojis.Objects => 0xf24b352f => 212
	i32 4068434129, ; 661: System.Private.Xml.Linq.dll => 0xf27f60d1 => 87
	i32 4073602200, ; 662: System.Threading.dll => 0xf2ce3c98 => 148
	i32 4078967171, ; 663: Microsoft.Extensions.Hosting.Abstractions.dll => 0xf3201983 => 198
	i32 4079385022, ; 664: MySqlConnector.dll => 0xf32679be => 224
	i32 4094352644, ; 665: Microsoft.Maui.Essentials.dll => 0xf40add04 => 222
	i32 4099507663, ; 666: System.Drawing.dll => 0xf45985cf => 36
	i32 4100113165, ; 667: System.Private.Uri => 0xf462c30d => 86
	i32 4101593132, ; 668: Xamarin.AndroidX.Emoji2 => 0xf479582c => 259
	i32 4101842092, ; 669: Microsoft.Extensions.Caching.Memory => 0xf47d24ac => 188
	i32 4102112229, ; 670: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 335
	i32 4121155151, ; 671: xclsvApp => 0xf5a3d64f => 0
	i32 4125707920, ; 672: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 330
	i32 4126470640, ; 673: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 192
	i32 4127667938, ; 674: System.IO.FileSystem.Watcher => 0xf60736e2 => 50
	i32 4130442656, ; 675: System.AppContext => 0xf6318da0 => 6
	i32 4147896353, ; 676: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 90
	i32 4150914736, ; 677: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 342
	i32 4151237749, ; 678: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 679: System.Xml.XmlSerializer => 0xf7e95c85 => 162
	i32 4161255271, ; 680: System.Reflection.TypeExtensions => 0xf807b767 => 96
	i32 4164802419, ; 681: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 50
	i32 4181436372, ; 682: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 113
	i32 4182413190, ; 683: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 275
	i32 4185676441, ; 684: System.Security => 0xf97c5a99 => 130
	i32 4196529839, ; 685: System.Net.WebClient.dll => 0xfa21f6af => 76
	i32 4213026141, ; 686: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 27
	i32 4256097574, ; 687: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 252
	i32 4258378803, ; 688: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 274
	i32 4260525087, ; 689: System.Buffers => 0xfdf2741f => 7
	i32 4271975918, ; 690: Microsoft.Maui.Controls.dll => 0xfea12dee => 219
	i32 4274623895, ; 691: CommunityToolkit.Mvvm.dll => 0xfec99597 => 175
	i32 4274976490, ; 692: System.Runtime.Numerics => 0xfecef6ea => 110
	i32 4292120959, ; 693: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 275
	i32 4292162634, ; 694: Microsoft.FluentUI.AspNetCore.Components.Emojis.TravelPlaces.dll => 0xffd5344a => 216
	i32 4294763496 ; 695: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 261
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [696 x i32] [
	i32 68, ; 0
	i32 67, ; 1
	i32 108, ; 2
	i32 194, ; 3
	i32 271, ; 4
	i32 305, ; 5
	i32 48, ; 6
	i32 80, ; 7
	i32 145, ; 8
	i32 30, ; 9
	i32 346, ; 10
	i32 124, ; 11
	i32 223, ; 12
	i32 102, ; 13
	i32 210, ; 14
	i32 196, ; 15
	i32 289, ; 16
	i32 107, ; 17
	i32 289, ; 18
	i32 139, ; 19
	i32 309, ; 20
	i32 77, ; 21
	i32 124, ; 22
	i32 13, ; 23
	i32 245, ; 24
	i32 132, ; 25
	i32 291, ; 26
	i32 151, ; 27
	i32 343, ; 28
	i32 344, ; 29
	i32 18, ; 30
	i32 243, ; 31
	i32 26, ; 32
	i32 195, ; 33
	i32 265, ; 34
	i32 1, ; 35
	i32 59, ; 36
	i32 42, ; 37
	i32 91, ; 38
	i32 178, ; 39
	i32 248, ; 40
	i32 147, ; 41
	i32 267, ; 42
	i32 264, ; 43
	i32 315, ; 44
	i32 54, ; 45
	i32 199, ; 46
	i32 69, ; 47
	i32 343, ; 48
	i32 234, ; 49
	i32 83, ; 50
	i32 328, ; 51
	i32 266, ; 52
	i32 227, ; 53
	i32 327, ; 54
	i32 131, ; 55
	i32 55, ; 56
	i32 149, ; 57
	i32 74, ; 58
	i32 145, ; 59
	i32 62, ; 60
	i32 146, ; 61
	i32 347, ; 62
	i32 165, ; 63
	i32 339, ; 64
	i32 249, ; 65
	i32 12, ; 66
	i32 262, ; 67
	i32 125, ; 68
	i32 152, ; 69
	i32 113, ; 70
	i32 166, ; 71
	i32 164, ; 72
	i32 264, ; 73
	i32 277, ; 74
	i32 84, ; 75
	i32 326, ; 76
	i32 320, ; 77
	i32 205, ; 78
	i32 150, ; 79
	i32 309, ; 80
	i32 60, ; 81
	i32 207, ; 82
	i32 200, ; 83
	i32 51, ; 84
	i32 103, ; 85
	i32 114, ; 86
	i32 40, ; 87
	i32 302, ; 88
	i32 300, ; 89
	i32 174, ; 90
	i32 120, ; 91
	i32 334, ; 92
	i32 52, ; 93
	i32 44, ; 94
	i32 119, ; 95
	i32 254, ; 96
	i32 332, ; 97
	i32 260, ; 98
	i32 81, ; 99
	i32 136, ; 100
	i32 296, ; 101
	i32 241, ; 102
	i32 8, ; 103
	i32 73, ; 104
	i32 314, ; 105
	i32 155, ; 106
	i32 311, ; 107
	i32 154, ; 108
	i32 92, ; 109
	i32 306, ; 110
	i32 45, ; 111
	i32 329, ; 112
	i32 317, ; 113
	i32 310, ; 114
	i32 109, ; 115
	i32 204, ; 116
	i32 129, ; 117
	i32 225, ; 118
	i32 25, ; 119
	i32 231, ; 120
	i32 72, ; 121
	i32 55, ; 122
	i32 46, ; 123
	i32 338, ; 124
	i32 203, ; 125
	i32 255, ; 126
	i32 22, ; 127
	i32 269, ; 128
	i32 86, ; 129
	i32 43, ; 130
	i32 160, ; 131
	i32 71, ; 132
	i32 282, ; 133
	i32 3, ; 134
	i32 42, ; 135
	i32 63, ; 136
	i32 16, ; 137
	i32 53, ; 138
	i32 341, ; 139
	i32 305, ; 140
	i32 105, ; 141
	i32 310, ; 142
	i32 303, ; 143
	i32 266, ; 144
	i32 34, ; 145
	i32 158, ; 146
	i32 85, ; 147
	i32 32, ; 148
	i32 12, ; 149
	i32 51, ; 150
	i32 56, ; 151
	i32 286, ; 152
	i32 36, ; 153
	i32 208, ; 154
	i32 193, ; 155
	i32 316, ; 156
	i32 304, ; 157
	i32 239, ; 158
	i32 35, ; 159
	i32 58, ; 160
	i32 196, ; 161
	i32 273, ; 162
	i32 176, ; 163
	i32 17, ; 164
	i32 307, ; 165
	i32 164, ; 166
	i32 198, ; 167
	i32 329, ; 168
	i32 272, ; 169
	i32 202, ; 170
	i32 299, ; 171
	i32 184, ; 172
	i32 335, ; 173
	i32 153, ; 174
	i32 197, ; 175
	i32 295, ; 176
	i32 280, ; 177
	i32 210, ; 178
	i32 184, ; 179
	i32 333, ; 180
	i32 241, ; 181
	i32 188, ; 182
	i32 29, ; 183
	i32 175, ; 184
	i32 52, ; 185
	i32 331, ; 186
	i32 300, ; 187
	i32 5, ; 188
	i32 315, ; 189
	i32 290, ; 190
	i32 294, ; 191
	i32 246, ; 192
	i32 311, ; 193
	i32 238, ; 194
	i32 226, ; 195
	i32 257, ; 196
	i32 85, ; 197
	i32 299, ; 198
	i32 61, ; 199
	i32 112, ; 200
	i32 57, ; 201
	i32 345, ; 202
	i32 286, ; 203
	i32 99, ; 204
	i32 19, ; 205
	i32 250, ; 206
	i32 111, ; 207
	i32 101, ; 208
	i32 102, ; 209
	i32 313, ; 210
	i32 104, ; 211
	i32 303, ; 212
	i32 71, ; 213
	i32 38, ; 214
	i32 32, ; 215
	i32 103, ; 216
	i32 73, ; 217
	i32 319, ; 218
	i32 9, ; 219
	i32 123, ; 220
	i32 46, ; 221
	i32 240, ; 222
	i32 205, ; 223
	i32 9, ; 224
	i32 43, ; 225
	i32 4, ; 226
	i32 287, ; 227
	i32 182, ; 228
	i32 323, ; 229
	i32 199, ; 230
	i32 206, ; 231
	i32 224, ; 232
	i32 318, ; 233
	i32 31, ; 234
	i32 138, ; 235
	i32 92, ; 236
	i32 93, ; 237
	i32 338, ; 238
	i32 49, ; 239
	i32 141, ; 240
	i32 112, ; 241
	i32 140, ; 242
	i32 256, ; 243
	i32 115, ; 244
	i32 304, ; 245
	i32 157, ; 246
	i32 76, ; 247
	i32 79, ; 248
	i32 276, ; 249
	i32 37, ; 250
	i32 298, ; 251
	i32 260, ; 252
	i32 253, ; 253
	i32 64, ; 254
	i32 138, ; 255
	i32 15, ; 256
	i32 209, ; 257
	i32 215, ; 258
	i32 116, ; 259
	i32 292, ; 260
	i32 301, ; 261
	i32 248, ; 262
	i32 173, ; 263
	i32 48, ; 264
	i32 70, ; 265
	i32 80, ; 266
	i32 126, ; 267
	i32 182, ; 268
	i32 183, ; 269
	i32 94, ; 270
	i32 121, ; 271
	i32 308, ; 272
	i32 26, ; 273
	i32 227, ; 274
	i32 269, ; 275
	i32 97, ; 276
	i32 28, ; 277
	i32 244, ; 278
	i32 336, ; 279
	i32 314, ; 280
	i32 149, ; 281
	i32 229, ; 282
	i32 169, ; 283
	i32 4, ; 284
	i32 209, ; 285
	i32 98, ; 286
	i32 180, ; 287
	i32 33, ; 288
	i32 93, ; 289
	i32 291, ; 290
	i32 200, ; 291
	i32 21, ; 292
	i32 41, ; 293
	i32 170, ; 294
	i32 330, ; 295
	i32 262, ; 296
	i32 322, ; 297
	i32 276, ; 298
	i32 307, ; 299
	i32 301, ; 300
	i32 281, ; 301
	i32 2, ; 302
	i32 134, ; 303
	i32 111, ; 304
	i32 201, ; 305
	i32 211, ; 306
	i32 342, ; 307
	i32 231, ; 308
	i32 339, ; 309
	i32 58, ; 310
	i32 95, ; 311
	i32 321, ; 312
	i32 39, ; 313
	i32 242, ; 314
	i32 186, ; 315
	i32 25, ; 316
	i32 94, ; 317
	i32 89, ; 318
	i32 99, ; 319
	i32 10, ; 320
	i32 87, ; 321
	i32 100, ; 322
	i32 288, ; 323
	i32 214, ; 324
	i32 189, ; 325
	i32 308, ; 326
	i32 233, ; 327
	i32 318, ; 328
	i32 7, ; 329
	i32 186, ; 330
	i32 273, ; 331
	i32 313, ; 332
	i32 230, ; 333
	i32 88, ; 334
	i32 191, ; 335
	i32 268, ; 336
	i32 154, ; 337
	i32 317, ; 338
	i32 33, ; 339
	i32 174, ; 340
	i32 116, ; 341
	i32 82, ; 342
	i32 228, ; 343
	i32 20, ; 344
	i32 206, ; 345
	i32 11, ; 346
	i32 162, ; 347
	i32 3, ; 348
	i32 221, ; 349
	i32 325, ; 350
	i32 203, ; 351
	i32 201, ; 352
	i32 84, ; 353
	i32 212, ; 354
	i32 194, ; 355
	i32 312, ; 356
	i32 64, ; 357
	i32 327, ; 358
	i32 295, ; 359
	i32 143, ; 360
	i32 277, ; 361
	i32 157, ; 362
	i32 183, ; 363
	i32 41, ; 364
	i32 117, ; 365
	i32 190, ; 366
	i32 232, ; 367
	i32 321, ; 368
	i32 284, ; 369
	i32 131, ; 370
	i32 75, ; 371
	i32 66, ; 372
	i32 331, ; 373
	i32 172, ; 374
	i32 236, ; 375
	i32 143, ; 376
	i32 106, ; 377
	i32 151, ; 378
	i32 70, ; 379
	i32 156, ; 380
	i32 189, ; 381
	i32 121, ; 382
	i32 127, ; 383
	i32 326, ; 384
	i32 152, ; 385
	i32 259, ; 386
	i32 178, ; 387
	i32 141, ; 388
	i32 246, ; 389
	i32 323, ; 390
	i32 20, ; 391
	i32 14, ; 392
	i32 217, ; 393
	i32 135, ; 394
	i32 75, ; 395
	i32 59, ; 396
	i32 225, ; 397
	i32 249, ; 398
	i32 167, ; 399
	i32 168, ; 400
	i32 219, ; 401
	i32 15, ; 402
	i32 74, ; 403
	i32 6, ; 404
	i32 23, ; 405
	i32 271, ; 406
	i32 230, ; 407
	i32 177, ; 408
	i32 91, ; 409
	i32 324, ; 410
	i32 1, ; 411
	i32 136, ; 412
	i32 272, ; 413
	i32 294, ; 414
	i32 134, ; 415
	i32 69, ; 416
	i32 179, ; 417
	i32 208, ; 418
	i32 146, ; 419
	i32 197, ; 420
	i32 333, ; 421
	i32 312, ; 422
	i32 263, ; 423
	i32 202, ; 424
	i32 88, ; 425
	i32 96, ; 426
	i32 253, ; 427
	i32 258, ; 428
	i32 328, ; 429
	i32 31, ; 430
	i32 45, ; 431
	i32 267, ; 432
	i32 185, ; 433
	i32 232, ; 434
	i32 109, ; 435
	i32 158, ; 436
	i32 207, ; 437
	i32 35, ; 438
	i32 22, ; 439
	i32 114, ; 440
	i32 57, ; 441
	i32 292, ; 442
	i32 144, ; 443
	i32 118, ; 444
	i32 120, ; 445
	i32 110, ; 446
	i32 234, ; 447
	i32 139, ; 448
	i32 177, ; 449
	i32 240, ; 450
	i32 54, ; 451
	i32 105, ; 452
	i32 334, ; 453
	i32 220, ; 454
	i32 221, ; 455
	i32 133, ; 456
	i32 306, ; 457
	i32 297, ; 458
	i32 285, ; 459
	i32 340, ; 460
	i32 263, ; 461
	i32 223, ; 462
	i32 159, ; 463
	i32 319, ; 464
	i32 250, ; 465
	i32 163, ; 466
	i32 132, ; 467
	i32 285, ; 468
	i32 161, ; 469
	i32 332, ; 470
	i32 181, ; 471
	i32 274, ; 472
	i32 185, ; 473
	i32 140, ; 474
	i32 297, ; 475
	i32 293, ; 476
	i32 169, ; 477
	i32 222, ; 478
	i32 235, ; 479
	i32 215, ; 480
	i32 302, ; 481
	i32 40, ; 482
	i32 261, ; 483
	i32 81, ; 484
	i32 180, ; 485
	i32 56, ; 486
	i32 37, ; 487
	i32 97, ; 488
	i32 166, ; 489
	i32 172, ; 490
	i32 298, ; 491
	i32 82, ; 492
	i32 237, ; 493
	i32 98, ; 494
	i32 30, ; 495
	i32 159, ; 496
	i32 18, ; 497
	i32 127, ; 498
	i32 204, ; 499
	i32 119, ; 500
	i32 257, ; 501
	i32 288, ; 502
	i32 270, ; 503
	i32 290, ; 504
	i32 213, ; 505
	i32 195, ; 506
	i32 165, ; 507
	i32 265, ; 508
	i32 0, ; 509
	i32 347, ; 510
	i32 287, ; 511
	i32 278, ; 512
	i32 170, ; 513
	i32 16, ; 514
	i32 187, ; 515
	i32 144, ; 516
	i32 325, ; 517
	i32 125, ; 518
	i32 214, ; 519
	i32 118, ; 520
	i32 38, ; 521
	i32 115, ; 522
	i32 47, ; 523
	i32 142, ; 524
	i32 117, ; 525
	i32 34, ; 526
	i32 176, ; 527
	i32 95, ; 528
	i32 53, ; 529
	i32 216, ; 530
	i32 279, ; 531
	i32 129, ; 532
	i32 153, ; 533
	i32 187, ; 534
	i32 24, ; 535
	i32 161, ; 536
	i32 256, ; 537
	i32 148, ; 538
	i32 104, ; 539
	i32 89, ; 540
	i32 244, ; 541
	i32 60, ; 542
	i32 142, ; 543
	i32 100, ; 544
	i32 5, ; 545
	i32 13, ; 546
	i32 122, ; 547
	i32 135, ; 548
	i32 28, ; 549
	i32 320, ; 550
	i32 72, ; 551
	i32 254, ; 552
	i32 24, ; 553
	i32 242, ; 554
	i32 283, ; 555
	i32 280, ; 556
	i32 337, ; 557
	i32 137, ; 558
	i32 226, ; 559
	i32 235, ; 560
	i32 251, ; 561
	i32 168, ; 562
	i32 284, ; 563
	i32 316, ; 564
	i32 101, ; 565
	i32 123, ; 566
	i32 255, ; 567
	i32 191, ; 568
	i32 192, ; 569
	i32 163, ; 570
	i32 167, ; 571
	i32 258, ; 572
	i32 39, ; 573
	i32 211, ; 574
	i32 218, ; 575
	i32 173, ; 576
	i32 324, ; 577
	i32 179, ; 578
	i32 17, ; 579
	i32 171, ; 580
	i32 337, ; 581
	i32 336, ; 582
	i32 137, ; 583
	i32 150, ; 584
	i32 247, ; 585
	i32 217, ; 586
	i32 155, ; 587
	i32 130, ; 588
	i32 19, ; 589
	i32 65, ; 590
	i32 147, ; 591
	i32 47, ; 592
	i32 344, ; 593
	i32 233, ; 594
	i32 79, ; 595
	i32 61, ; 596
	i32 106, ; 597
	i32 282, ; 598
	i32 237, ; 599
	i32 49, ; 600
	i32 268, ; 601
	i32 341, ; 602
	i32 279, ; 603
	i32 14, ; 604
	i32 190, ; 605
	i32 68, ; 606
	i32 171, ; 607
	i32 243, ; 608
	i32 247, ; 609
	i32 346, ; 610
	i32 78, ; 611
	i32 252, ; 612
	i32 108, ; 613
	i32 236, ; 614
	i32 278, ; 615
	i32 67, ; 616
	i32 181, ; 617
	i32 63, ; 618
	i32 27, ; 619
	i32 160, ; 620
	i32 228, ; 621
	i32 245, ; 622
	i32 10, ; 623
	i32 218, ; 624
	i32 11, ; 625
	i32 78, ; 626
	i32 126, ; 627
	i32 83, ; 628
	i32 193, ; 629
	i32 66, ; 630
	i32 107, ; 631
	i32 65, ; 632
	i32 128, ; 633
	i32 122, ; 634
	i32 213, ; 635
	i32 77, ; 636
	i32 293, ; 637
	i32 283, ; 638
	i32 345, ; 639
	i32 8, ; 640
	i32 251, ; 641
	i32 2, ; 642
	i32 44, ; 643
	i32 296, ; 644
	i32 156, ; 645
	i32 128, ; 646
	i32 281, ; 647
	i32 23, ; 648
	i32 133, ; 649
	i32 239, ; 650
	i32 270, ; 651
	i32 340, ; 652
	i32 322, ; 653
	i32 29, ; 654
	i32 238, ; 655
	i32 229, ; 656
	i32 62, ; 657
	i32 220, ; 658
	i32 90, ; 659
	i32 212, ; 660
	i32 87, ; 661
	i32 148, ; 662
	i32 198, ; 663
	i32 224, ; 664
	i32 222, ; 665
	i32 36, ; 666
	i32 86, ; 667
	i32 259, ; 668
	i32 188, ; 669
	i32 335, ; 670
	i32 0, ; 671
	i32 330, ; 672
	i32 192, ; 673
	i32 50, ; 674
	i32 6, ; 675
	i32 90, ; 676
	i32 342, ; 677
	i32 21, ; 678
	i32 162, ; 679
	i32 96, ; 680
	i32 50, ; 681
	i32 113, ; 682
	i32 275, ; 683
	i32 130, ; 684
	i32 76, ; 685
	i32 27, ; 686
	i32 252, ; 687
	i32 274, ; 688
	i32 7, ; 689
	i32 219, ; 690
	i32 175, ; 691
	i32 110, ; 692
	i32 275, ; 693
	i32 216, ; 694
	i32 261 ; 695
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ df9aaf29a52042a4fbf800daf2f3a38964b9e958"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
