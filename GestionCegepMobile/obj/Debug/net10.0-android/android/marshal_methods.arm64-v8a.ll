; ModuleID = 'marshal_methods.arm64-v8a.ll'
source_filename = "marshal_methods.arm64-v8a.ll"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [219 x ptr] zeroinitializer, align 8

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [657 x i64] [
	i64 u0x001e58127c546039, ; 0: lib_System.Globalization.dll.so => 42
	i64 u0x006b9d7c1c7e1c42, ; 1: de/Microsoft.Data.SqlClient.resources => 202
	i64 u0x01109b0e4d99e61f, ; 2: System.ComponentModel.Annotations.dll => 13
	i64 u0x02827b47e97f2378, ; 3: System.Security.Cryptography.Pkcs.dll => 198
	i64 u0x0284512fad379f7e, ; 4: System.Runtime.Handles => 107
	i64 u0x029b2c18aaa0996c, ; 5: lib-ko-Microsoft.Data.SqlClient.resources.dll.so => 207
	i64 u0x02a4c5a44384f885, ; 6: Microsoft.Extensions.Caching.Memory => 183
	i64 u0x02abedc11addc1ed, ; 7: lib_Mono.Android.Runtime.dll.so => 174
	i64 u0x02f55bf70672f5c8, ; 8: lib_System.IO.FileSystem.DriveInfo.dll.so => 48
	i64 u0x03621c804933a890, ; 9: System.Buffers => 7
	i64 u0x0399610510a38a38, ; 10: lib_System.Private.DataContractSerialization.dll.so => 88
	i64 u0x0470607fd33c32db, ; 11: Microsoft.IdentityModel.Abstractions.dll => 188
	i64 u0x0517ef04e06e9f76, ; 12: System.Net.Primitives => 72
	i64 u0x0581db89237110e9, ; 13: lib_System.Collections.dll.so => 12
	i64 u0x05a1c25e78e22d87, ; 14: lib_System.Runtime.CompilerServices.Unsafe.dll.so => 104
	i64 u0x05d8ca8ee551619f, ; 15: zh-Hant/Microsoft.Data.SqlClient.resources => 213
	i64 u0x06073ed944b92dc4, ; 16: lib-tr-Microsoft.Data.SqlClient.resources.dll.so => 211
	i64 u0x06388ffe9f6c161a, ; 17: System.Xml.Linq.dll => 159
	i64 u0x06600c4c124cb358, ; 18: System.Configuration.dll => 19
	i64 u0x069fff96ec92a91d, ; 19: System.Xml.XPath.dll => 164
	i64 u0x07469f2eecce9e85, ; 20: mscorlib.dll => 170
	i64 u0x07dcdc7460a0c5e4, ; 21: System.Collections.NonGeneric => 10
	i64 u0x08015600dcbf6dc7, ; 22: it/Microsoft.Data.SqlClient.resources.dll => 205
	i64 u0x08a7c865576bbde7, ; 23: System.Reflection.Primitives => 98
	i64 u0x09138715c92dba90, ; 24: lib_System.ComponentModel.Annotations.dll.so => 13
	i64 u0x0919c28b89381a0b, ; 25: lib_Microsoft.Extensions.Options.dll.so => 186
	i64 u0x092266563089ae3e, ; 26: lib_System.Collections.NonGeneric.dll.so => 10
	i64 u0x09d144a7e214d457, ; 27: System.Security.Cryptography => 129
	i64 u0x09e2b9f743db21a8, ; 28: lib_System.Reflection.Metadata.dll.so => 97
	i64 u0x0a805f95d98f597b, ; 29: lib_Microsoft.Extensions.Caching.Abstractions.dll.so => 182
	i64 u0x0abb3e2b271edc45, ; 30: System.Threading.Channels.dll => 143
	i64 u0x0adeb6c0f5699d33, ; 31: Microsoft.Data.SqlClient.dll => 179
	i64 u0x0b06b1feab070143, ; 32: System.Formats.Tar => 39
	i64 u0x0c59ad9fbbd43abe, ; 33: Mono.Android => 175
	i64 u0x0c74af560004e816, ; 34: Microsoft.Win32.Registry.dll => 5
	i64 u0x0c83c82812e96127, ; 35: lib_System.Net.Mail.dll.so => 68
	i64 u0x0d13cd7cce4284e4, ; 36: System.Security.SecureString => 132
	i64 u0x0e14e73a54dda68e, ; 37: lib_System.Net.NameResolution.dll.so => 69
	i64 u0x0f5e7abaa7cf470a, ; 38: System.Net.HttpListener => 67
	i64 u0x0fbe06392ef90569, ; 39: lib-ja-Microsoft.Data.SqlClient.resources.dll.so => 206
	i64 u0x1001f97bbe242e64, ; 40: System.IO.UnmanagedMemoryStream => 57
	i64 u0x1065c4cb554c3d75, ; 41: System.IO.IsolatedStorage.dll => 52
	i64 u0x108cf0e0ba098a51, ; 42: es/Microsoft.Data.SqlClient.resources => 203
	i64 u0x10bde46c4142194d, ; 43: Microsoft.Data.SqlClient.Internal.Logging => 181
	i64 u0x10f6cfcbcf801616, ; 44: System.IO.Compression.Brotli => 43
	i64 u0x114443cdcf2091f1, ; 45: System.Security.Cryptography.Primitives => 127
	i64 u0x11a603952763e1d4, ; 46: System.Net.Mail => 68
	i64 u0x11a70d0e1009fb11, ; 47: System.Net.WebSockets.dll => 83
	i64 u0x11fbe62d469cc1c8, ; 48: Microsoft.VisualStudio.DesignTools.TapContract.dll => 216
	i64 u0x12128b3f59302d47, ; 49: lib_System.Xml.Serialization.dll.so => 161
	i64 u0x123639456fb056da, ; 50: System.Reflection.Emit.Lightweight.dll => 94
	i64 u0x12521e9764603eaa, ; 51: lib_System.Resources.Reader.dll.so => 101
	i64 u0x126ee4b0de53cbfd, ; 52: Microsoft.IdentityModel.Protocols.OpenIdConnect.dll => 192
	i64 u0x12d3b63863d4ab0b, ; 53: lib_System.Threading.Overlapped.dll.so => 144
	i64 u0x134eab1061c395ee, ; 54: System.Transactions => 154
	i64 u0x13beedefb0e28a45, ; 55: lib_System.Xml.XmlDocument.dll.so => 165
	i64 u0x13f1e5e209e91af4, ; 56: lib_Java.Interop.dll.so => 172
	i64 u0x1416d64c6430cb36, ; 57: Microsoft.Data.SqlClient.Internal.Logging.dll => 181
	i64 u0x143a1f6e62b82b56, ; 58: Microsoft.IdentityModel.Protocols.OpenIdConnect => 192
	i64 u0x143d8ea60a6a4011, ; 59: Microsoft.Extensions.DependencyInjection.Abstractions => 184
	i64 u0x1497051b917530bd, ; 60: lib_System.Net.WebSockets.dll.so => 83
	i64 u0x14b78ce3adce0011, ; 61: Microsoft.VisualStudio.DesignTools.TapContract => 216
	i64 u0x152a448bd1e745a7, ; 62: Microsoft.Win32.Primitives => 4
	i64 u0x1557de0138c445f4, ; 63: lib_Microsoft.Win32.Registry.dll.so => 5
	i64 u0x157c480e6f4ce1a2, ; 64: GestionCegepMobile => 0
	i64 u0x159cc6c81072f00e, ; 65: lib_System.Diagnostics.EventLog.dll.so => 196
	i64 u0x15bdc156ed462f2f, ; 66: lib_System.IO.FileSystem.dll.so => 51
	i64 u0x15e300c2c1668655, ; 67: System.Resources.Writer.dll => 103
	i64 u0x162be8a76b00cd97, ; 68: lib-de-Microsoft.Data.SqlClient.resources.dll.so => 202
	i64 u0x16bf2a22df043a09, ; 69: System.IO.Pipes.dll => 56
	i64 u0x16ea2b318ad2d830, ; 70: System.Security.Cryptography.Algorithms => 122
	i64 u0x16eeae54c7ebcc08, ; 71: System.Reflection.dll => 100
	i64 u0x1706ac686f4c5135, ; 72: lib_Microsoft.Data.SqlClient.Extensions.Abstractions.dll.so => 180
	i64 u0x17125c9a85b4929f, ; 73: lib_netstandard.dll.so => 171
	i64 u0x1716866f7416792e, ; 74: lib_System.Security.AccessControl.dll.so => 120
	i64 u0x1752c12f1e1fc00c, ; 75: System.Core => 21
	i64 u0x17f9358913beb16a, ; 76: System.Text.Encodings.Web => 139
	i64 u0x1809fb23f29ba44a, ; 77: lib_System.Reflection.TypeExtensions.dll.so => 99
	i64 u0x18a9befae51bb361, ; 78: System.Net.WebClient => 79
	i64 u0x19a4c090f14ebb66, ; 79: System.Security.Claims => 121
	i64 u0x1a91866a319e9259, ; 80: lib_System.Collections.Concurrent.dll.so => 8
	i64 u0x1aac34d1917ba5d3, ; 81: lib_System.dll.so => 168
	i64 u0x1aea8f1c3b282172, ; 82: lib_System.Net.Ping.dll.so => 71
	i64 u0x1c753b5ff15bce1b, ; 83: Mono.Android.Runtime.dll => 174
	i64 u0x1cd47467799d8250, ; 84: System.Threading.Tasks.dll => 148
	i64 u0x1d23eafdc6dc346c, ; 85: System.Globalization.Calendars.dll => 40
	i64 u0x1db6820994506bf5, ; 86: System.IO.FileSystem.AccessControl.dll => 47
	i64 u0x1dbb0c2c6a999acb, ; 87: System.Diagnostics.StackTrace => 30
	i64 u0x1deeda885c7f64cc, ; 88: lib_GestionCegepMobile.dll.so => 0
	i64 u0x1e7c31185e2fb266, ; 89: lib_System.Threading.Tasks.Parallel.dll.so => 147
	i64 u0x1e865fa1feb4791f, ; 90: System.Threading.RateLimiting => 200
	i64 u0x1ed8fcce5e9b50a0, ; 91: Microsoft.Extensions.Options.dll => 186
	i64 u0x1f055d15d807e1b2, ; 92: System.Xml.XmlSerializer => 166
	i64 u0x1f1ed22c1085f044, ; 93: lib_System.Diagnostics.FileVersionInfo.dll.so => 28
	i64 u0x1f61df9c5b94d2c1, ; 94: lib_System.Numerics.dll.so => 86
	i64 u0x20237ea48006d7a8, ; 95: lib_System.Net.WebClient.dll.so => 79
	i64 u0x209375905fcc1bad, ; 96: lib_System.IO.Compression.Brotli.dll.so => 43
	i64 u0x20fab3cf2dfbc8df, ; 97: lib_System.Diagnostics.Process.dll.so => 29
	i64 u0x2110167c128cba15, ; 98: System.Globalization => 42
	i64 u0x21419508838f7547, ; 99: System.Runtime.CompilerServices.VisualC => 105
	i64 u0x2174319c0d835bc9, ; 100: System.Runtime => 119
	i64 u0x219ea1b751a4dee4, ; 101: lib_System.IO.Compression.ZipFile.dll.so => 45
	i64 u0x21cc7e445dcd5469, ; 102: System.Reflection.Emit.ILGeneration => 93
	i64 u0x224538d85ed15a82, ; 103: System.IO.Pipes => 56
	i64 u0x22908438c6bed1af, ; 104: lib_System.Threading.Timer.dll.so => 151
	i64 u0x22fbc14e981e3b45, ; 105: lib_Microsoft.VisualStudio.DesignTools.MobileTapContracts.dll.so => 215
	i64 u0x237be844f1f812c7, ; 106: System.Threading.Thread.dll => 149
	i64 u0x23852b3bdc9f7096, ; 107: System.Resources.ResourceManager => 102
	i64 u0x23986dd7e5d4fc01, ; 108: System.IO.FileSystem.Primitives.dll => 49
	i64 u0x23f599165f90dd7a, ; 109: lib-cs-Microsoft.Data.SqlClient.resources.dll.so => 201
	i64 u0x2407aef2bbe8fadf, ; 110: System.Console => 20
	i64 u0x247619fe4413f8bf, ; 111: System.Runtime.Serialization.Primitives.dll => 116
	i64 u0x268c1439f13bcc29, ; 112: lib_Microsoft.Extensions.Primitives.dll.so => 187
	i64 u0x26a670e154a9c54b, ; 113: System.Reflection.Extensions.dll => 96
	i64 u0x26d077d9678fe34f, ; 114: System.IO.dll => 58
	i64 u0x270a44600c921861, ; 115: System.IdentityModel.Tokens.Jwt => 197
	i64 u0x2759af78ab94d39b, ; 116: System.Net.WebSockets => 83
	i64 u0x27b410442fad6cf1, ; 117: Java.Interop.dll => 172
	i64 u0x27b97e0d52c3034a, ; 118: System.Diagnostics.Debug => 26
	i64 u0x2801845a2c71fbfb, ; 119: System.Net.Primitives.dll => 72
	i64 u0x29f947844fb7fc11, ; 120: Microsoft.Maui.Controls.HotReload.Forms => 214
	i64 u0x2a3b095612184159, ; 121: lib_System.Net.NetworkInformation.dll.so => 70
	i64 u0x2a6507a5ffabdf28, ; 122: System.Diagnostics.TraceSource.dll => 33
	i64 u0x2ad5d6b13b7a3e04, ; 123: System.ComponentModel.DataAnnotations.dll => 14
	i64 u0x2af298f63581d886, ; 124: System.Text.RegularExpressions.dll => 141
	i64 u0x2af615542f04da50, ; 125: System.IdentityModel.Tokens.Jwt.dll => 197
	i64 u0x2afc1c4f898552ee, ; 126: lib_System.Formats.Asn1.dll.so => 38
	i64 u0x2cbd9262ca785540, ; 127: lib_System.Text.Encoding.CodePages.dll.so => 136
	i64 u0x2cc9e1fed6257257, ; 128: lib_System.Reflection.Emit.Lightweight.dll.so => 94
	i64 u0x2cd723e9fe623c7c, ; 129: lib_System.Private.Xml.Linq.dll.so => 90
	i64 u0x2ce66f4c8733e883, ; 130: pt-BR/Microsoft.Data.SqlClient.resources.dll => 209
	i64 u0x2d169d318a968379, ; 131: System.Threading.dll => 152
	i64 u0x2d5ffcae1ad0aaca, ; 132: System.Data.dll => 24
	i64 u0x2db915caf23548d2, ; 133: System.Text.Json.dll => 140
	i64 u0x2dcaa0bb15a4117a, ; 134: System.IO.UnmanagedMemoryStream.dll => 57
	i64 u0x2e2ced2c3c6a1edc, ; 135: lib_System.Threading.AccessControl.dll.so => 142
	i64 u0x2e5a40c319acb800, ; 136: System.IO.FileSystem => 51
	i64 u0x2f02f94df3200fe5, ; 137: System.Diagnostics.Process => 29
	i64 u0x2f2e98e1c89b1aff, ; 138: System.Xml.ReaderWriter => 160
	i64 u0x2f40b2521deba305, ; 139: lib_Microsoft.SqlServer.Server.dll.so => 194
	i64 u0x2f5911d9ba814e4e, ; 140: System.Diagnostics.Tracing => 34
	i64 u0x2f84070a459bc31f, ; 141: lib_System.Xml.dll.so => 167
	i64 u0x2feb4d2fcda05cfd, ; 142: Microsoft.Extensions.Caching.Abstractions.dll => 182
	i64 u0x309f2bedefa9a318, ; 143: Microsoft.IdentityModel.Abstractions => 188
	i64 u0x30c6dda129408828, ; 144: System.IO.IsolatedStorage => 52
	i64 u0x31195fef5d8fb552, ; 145: _Microsoft.Android.Resource.Designer.dll => 218
	i64 u0x31496b779ed0663d, ; 146: lib_System.Reflection.DispatchProxy.dll.so => 92
	i64 u0x3235427f8d12dae1, ; 147: lib_System.Drawing.Primitives.dll.so => 35
	i64 u0x32aa989ff07a84ff, ; 148: lib_System.Xml.ReaderWriter.dll.so => 160
	i64 u0x33829542f112d59b, ; 149: System.Collections.Immutable => 9
	i64 u0x341abc357fbb4ebf, ; 150: lib_System.Net.Sockets.dll.so => 78
	i64 u0x346a212343615ac5, ; 151: lib_System.Linq.AsyncEnumerable.dll.so => 59
	i64 u0x348d598f4054415e, ; 152: Microsoft.SqlServer.Server => 194
	i64 u0x3496c1e2dcaf5ecc, ; 153: lib_System.IO.Pipes.AccessControl.dll.so => 55
	i64 u0x353590da528c9d22, ; 154: System.ComponentModel.Annotations => 13
	i64 u0x355c649948d55d97, ; 155: lib_System.Runtime.Intrinsics.dll.so => 111
	i64 u0x3628ab68db23a01a, ; 156: lib_System.Diagnostics.Tools.dll.so => 32
	i64 u0x3673b042508f5b6b, ; 157: lib_System.Runtime.Extensions.dll.so => 106
	i64 u0x36740f1a8ecdc6c4, ; 158: System.Numerics => 86
	i64 u0x36b2b50fdf589ae2, ; 159: System.Reflection.Emit.Lightweight => 94
	i64 u0x36cada77dc79928b, ; 160: System.IO.MemoryMappedFiles => 53
	i64 u0x374ef46b06791af6, ; 161: System.Reflection.Primitives.dll => 98
	i64 u0x37bc29f3183003b6, ; 162: lib_System.IO.dll.so => 58
	i64 u0x380134e03b1e160a, ; 163: System.Collections.Immutable.dll => 9
	i64 u0x38049b5c59b39324, ; 164: System.Runtime.CompilerServices.Unsafe => 104
	i64 u0x382b20286945c849, ; 165: lib_Microsoft.Bcl.Cryptography.dll.so => 178
	i64 u0x38869c811d74050e, ; 166: System.Net.NameResolution.dll => 69
	i64 u0x38e93ec1c057cdf6, ; 167: Microsoft.IdentityModel.Protocols => 191
	i64 u0x39251dccb84bdcaa, ; 168: lib_System.Configuration.ConfigurationManager.dll.so => 195
	i64 u0x3ab5859054645f72, ; 169: System.Security.Cryptography.Primitives.dll => 127
	i64 u0x3ae44ac43a1fbdbb, ; 170: System.Runtime.Serialization => 118
	i64 u0x3b860f9932505633, ; 171: lib_System.Text.Encoding.Extensions.dll.so => 137
	i64 u0x3bea9ebe8c027c01, ; 172: lib_Microsoft.IdentityModel.Tokens.dll.so => 193
	i64 u0x3c3aafb6b3a00bf6, ; 173: lib_System.Security.Cryptography.X509Certificates.dll.so => 128
	i64 u0x3c3bc99634ca0e6f, ; 174: lib_Microsoft.Data.SqlClient.Internal.Logging.dll.so => 181
	i64 u0x3c4049146b59aa90, ; 175: System.Runtime.InteropServices.JavaScript => 108
	i64 u0x3c5f19e4acdcebd8, ; 176: lib_Microsoft.Data.SqlClient.dll.so => 179
	i64 u0x3c7e5ed3d5db71bb, ; 177: System.Security => 133
	i64 u0x3d2b1913edfc08d7, ; 178: lib_System.Threading.ThreadPool.dll.so => 150
	i64 u0x3d46f0b995082740, ; 179: System.Xml.Linq => 159
	i64 u0x3e0b360b2840f096, ; 180: it/Microsoft.Data.SqlClient.resources => 205
	i64 u0x3e57d4d195c53c2e, ; 181: System.Reflection.TypeExtensions => 99
	i64 u0x3e616ab4ed1f3f15, ; 182: lib_System.Data.dll.so => 24
	i64 u0x3f510adf788828dd, ; 183: System.Threading.Tasks.Extensions => 146
	i64 u0x40c98b6bd77346d4, ; 184: Microsoft.VisualBasic.dll => 3
	i64 u0x415e36f6b13ff6f3, ; 185: System.Configuration.ConfigurationManager.dll => 195
	i64 u0x41833cf766d27d96, ; 186: mscorlib => 170
	i64 u0x423a9ecc4d905a88, ; 187: lib_System.Resources.ResourceManager.dll.so => 102
	i64 u0x423bf51ae7def810, ; 188: System.Xml.XPath => 164
	i64 u0x42462ff15ddba223, ; 189: System.Resources.Reader.dll => 101
	i64 u0x42a31b86e6ccc3f0, ; 190: System.Diagnostics.Contracts => 25
	i64 u0x430e95b891249788, ; 191: lib_System.Reflection.Emit.dll.so => 95
	i64 u0x43375950ec7c1b6a, ; 192: netstandard.dll => 171
	i64 u0x434c4e1d9284cdae, ; 193: Mono.Android.dll => 175
	i64 u0x437d06c381ed575a, ; 194: lib_Microsoft.VisualBasic.dll.so => 3
	i64 u0x448bd33429269b19, ; 195: Microsoft.CSharp => 1
	i64 u0x4499fa3c8e494654, ; 196: lib_System.Runtime.Serialization.Primitives.dll.so => 116
	i64 u0x458d2df79ac57c1d, ; 197: lib_System.IdentityModel.Tokens.Jwt.dll.so => 197
	i64 u0x45c40276a42e283e, ; 198: System.Diagnostics.TraceSource => 33
	i64 u0x45d443f2a29adc37, ; 199: System.AppContext.dll => 6
	i64 u0x47358bd471172e1d, ; 200: lib_System.Xml.Linq.dll.so => 159
	i64 u0x480c0a47dd42dd81, ; 201: lib_System.IO.MemoryMappedFiles.dll.so => 53
	i64 u0x49e952f19a4e2022, ; 202: System.ObjectModel => 87
	i64 u0x4a75d156cedf4b97, ; 203: Microsoft.Data.SqlClient.Extensions.Abstractions => 180
	i64 u0x4a7a18981dbd56bc, ; 204: System.IO.Compression.FileSystem.dll => 44
	i64 u0x4b07a0ed0ab33ff4, ; 205: System.Runtime.Extensions.dll => 106
	i64 u0x4b576d47ac054f3c, ; 206: System.IO.FileSystem.AccessControl => 47
	i64 u0x4b7b6532ded934b7, ; 207: System.Text.Json => 140
	i64 u0x4c7755cf07ad2d5f, ; 208: System.Net.Http.Json.dll => 65
	i64 u0x4cf6f67dc77aacd2, ; 209: System.Net.NetworkInformation.dll => 70
	i64 u0x4d3183dd245425d4, ; 210: System.Net.WebSockets.Client.dll => 82
	i64 u0x4d479f968a05e504, ; 211: System.Linq.Expressions.dll => 60
	i64 u0x4d55a010ffc4faff, ; 212: System.Private.Xml => 91
	i64 u0x4d5cbe77561c5b2e, ; 213: System.Web.dll => 157
	i64 u0x4d7793536e79c309, ; 214: System.ServiceProcess => 135
	i64 u0x4d95fccc1f67c7ca, ; 215: System.Runtime.Loader.dll => 112
	i64 u0x4db014bf0ff1c9c1, ; 216: System.Linq.AsyncEnumerable => 59
	i64 u0x4e32f00cb0937401, ; 217: Mono.Android.Runtime => 174
	i64 u0x4e5eea4668ac2b18, ; 218: System.Text.Encoding.CodePages => 136
	i64 u0x4ebd0c4b82c5eefc, ; 219: lib_System.Threading.Channels.dll.so => 143
	i64 u0x4ee8eaa9c9c1151a, ; 220: System.Globalization.Calendars => 40
	i64 u0x4f27ca9d6e02176c, ; 221: cs/Microsoft.Data.SqlClient.resources => 201
	i64 u0x4ffd65baff757598, ; 222: Microsoft.IdentityModel.Tokens => 193
	i64 u0x50320f2a19424f3f, ; 223: lib-it-Microsoft.Data.SqlClient.resources.dll.so => 205
	i64 u0x50c3a29b21050d45, ; 224: System.Linq.Parallel.dll => 61
	i64 u0x5146d4e23aed3198, ; 225: ja/Microsoft.Data.SqlClient.resources => 206
	i64 u0x516324a5050a7e3c, ; 226: System.Net.WebProxy => 81
	i64 u0x516d6f0b21a303de, ; 227: lib_System.Diagnostics.Contracts.dll.so => 25
	i64 u0x51bb8a2afe774e32, ; 228: System.Drawing => 36
	i64 u0x5247c5c32a4140f0, ; 229: System.Resources.Reader => 101
	i64 u0x526ce79eb8e90527, ; 230: lib_System.Net.Primitives.dll.so => 72
	i64 u0x52829f00b4467c38, ; 231: lib_System.Data.Common.dll.so => 22
	i64 u0x5290402954d7bce0, ; 232: zh-Hans/Microsoft.Data.SqlClient.resources => 212
	i64 u0x53978aac584c666e, ; 233: lib_System.Security.Cryptography.Cng.dll.so => 123
	i64 u0x53a96d5c86c9e194, ; 234: System.Net.NetworkInformation => 70
	i64 u0x53be1038a61e8d44, ; 235: System.Runtime.InteropServices.RuntimeInformation.dll => 109
	i64 u0x5435e6f049e9bc37, ; 236: System.Security.Claims.dll => 121
	i64 u0x54795225dd1587af, ; 237: lib_System.Runtime.dll.so => 119
	i64 u0x5588627c9a108ec9, ; 238: System.Collections.Specialized => 11
	i64 u0x55a898e4f42e3fae, ; 239: Microsoft.VisualBasic.Core.dll => 2
	i64 u0x55fa0c610fe93bb1, ; 240: lib_System.Security.Cryptography.OpenSsl.dll.so => 126
	i64 u0x56442b99bc64bb47, ; 241: System.Runtime.Serialization.Xml.dll => 117
	i64 u0x56a8b26e1aeae27b, ; 242: System.Threading.Tasks.Dataflow => 145
	i64 u0x56f932d61e93c07f, ; 243: System.Globalization.Extensions => 41
	i64 u0x571c5cfbec5ae8e2, ; 244: System.Private.Uri => 89
	i64 u0x579a06fed6eec900, ; 245: System.Private.CoreLib.dll => 177
	i64 u0x57c542c14049b66d, ; 246: System.Diagnostics.DiagnosticSource => 27
	i64 u0x581a8bd5cfda563e, ; 247: System.Threading.Timer => 151
	i64 u0x595a356d23e8da9a, ; 248: lib_Microsoft.CSharp.dll.so => 1
	i64 u0x5a745f5101a75527, ; 249: lib_System.IO.Compression.FileSystem.dll.so => 44
	i64 u0x5a8f6699f4a1caa9, ; 250: lib_System.Threading.dll.so => 152
	i64 u0x5ae9cd33b15841bf, ; 251: System.ComponentModel => 18
	i64 u0x5b54391bdc6fcfe6, ; 252: System.Private.DataContractSerialization => 88
	i64 u0x5b8109e8e14c5e3e, ; 253: System.Globalization.Extensions.dll => 41
	i64 u0x5c30a4a35f9cc8c4, ; 254: lib_System.Reflection.Extensions.dll.so => 96
	i64 u0x5c53c29f5073b0c9, ; 255: System.Diagnostics.FileVersionInfo => 28
	i64 u0x5c87463c575c7616, ; 256: lib_System.Globalization.Extensions.dll.so => 41
	i64 u0x5d0a4a29b02d9d3c, ; 257: System.Net.WebHeaderCollection.dll => 80
	i64 u0x5d33da2f84c1de97, ; 258: lib-pt-BR-Microsoft.Data.SqlClient.resources.dll.so => 209
	i64 u0x5d7960d446a1890e, ; 259: lib-pl-Microsoft.Data.SqlClient.resources.dll.so => 208
	i64 u0x5d7ec76c1c703055, ; 260: System.Threading.Tasks.Parallel => 147
	i64 u0x5db0cbbd1028510e, ; 261: lib_System.Runtime.InteropServices.dll.so => 110
	i64 u0x5e467bc8f09ad026, ; 262: System.Collections.Specialized.dll => 11
	i64 u0x5e5173b3208d97e7, ; 263: System.Runtime.Handles.dll => 107
	i64 u0x5ea92fdb19ec8c4c, ; 264: System.Text.Encodings.Web.dll => 139
	i64 u0x5eb8046dd40e9ac3, ; 265: System.ComponentModel.Primitives => 16
	i64 u0x5ec272d219c9aba4, ; 266: System.Security.Cryptography.Csp.dll => 124
	i64 u0x5eee1376d94c7f5e, ; 267: System.Net.HttpListener.dll => 67
	i64 u0x5f36ccf5c6a57e24, ; 268: System.Xml.ReaderWriter.dll => 160
	i64 u0x5f4294b9b63cb842, ; 269: System.Data.Common => 22
	i64 u0x5fac98e0b37a5b9d, ; 270: System.Runtime.CompilerServices.Unsafe.dll => 104
	i64 u0x60f62d786afcf130, ; 271: System.Memory => 64
	i64 u0x61bb78c89f867353, ; 272: System.IO => 58
	i64 u0x61d88f399afb2f45, ; 273: lib_System.Runtime.Loader.dll.so => 112
	i64 u0x6219beeff33faa04, ; 274: cs/Microsoft.Data.SqlClient.resources.dll => 201
	i64 u0x622eef6f9e59068d, ; 275: System.Private.CoreLib => 177
	i64 u0x625def565caafc1c, ; 276: tr/Microsoft.Data.SqlClient.resources.dll => 211
	i64 u0x62812a93be7f3265, ; 277: Microsoft.Bcl.Cryptography => 178
	i64 u0x63cdbd66ac39bb46, ; 278: lib_Microsoft.VisualStudio.DesignTools.XamlTapContract.dll.so => 217
	i64 u0x63f1f6883c1e23c2, ; 279: lib_System.Collections.Immutable.dll.so => 9
	i64 u0x640e3b14dbd325c2, ; 280: System.Security.Cryptography.Algorithms.dll => 122
	i64 u0x64587004560099b9, ; 281: System.Reflection => 100
	i64 u0x6468947914df5c9c, ; 282: Microsoft.Bcl.Cryptography.dll => 178
	i64 u0x64b1529a438a3c45, ; 283: lib_System.Runtime.Handles.dll.so => 107
	i64 u0x64b61dd9da8a4d57, ; 284: System.Net.ServerSentEvents.dll => 76
	i64 u0x65ece51227bfa724, ; 285: lib_System.Runtime.Numerics.dll.so => 113
	i64 u0x6679b2337ee6b22a, ; 286: lib_System.IO.FileSystem.Primitives.dll.so => 49
	i64 u0x667c66a03dd97d40, ; 287: System.Linq.AsyncEnumerable.dll => 59
	i64 u0x6692e924eade1b29, ; 288: lib_System.Console.dll.so => 20
	i64 u0x674303f65d8fad6f, ; 289: lib_System.Net.Quic.dll.so => 73
	i64 u0x67c0802770244408, ; 290: System.Windows.dll => 158
	i64 u0x68100b69286e27cd, ; 291: lib_System.Formats.Tar.dll.so => 39
	i64 u0x6872ec7a2e36b1ac, ; 292: System.Drawing.Primitives.dll => 35
	i64 u0x68fbbbe2eb455198, ; 293: System.Formats.Asn1 => 38
	i64 u0x6a4d7577b2317255, ; 294: System.Runtime.InteropServices.dll => 110
	i64 u0x6afcedb171067e2b, ; 295: System.Core.dll => 21
	i64 u0x6d0a12b2adba20d8, ; 296: System.Security.Cryptography.ProtectedData.dll => 199
	i64 u0x6d3b7628f8253e93, ; 297: pl/Microsoft.Data.SqlClient.resources => 208
	i64 u0x6d70755158ca866e, ; 298: lib_System.ComponentModel.EventBasedAsync.dll.so => 15
	i64 u0x6d79993361e10ef2, ; 299: Microsoft.Extensions.Primitives => 187
	i64 u0x6d7eeca99577fc8b, ; 300: lib_System.Net.WebProxy.dll.so => 81
	i64 u0x6d8515b19946b6a2, ; 301: System.Net.WebProxy.dll => 81
	i64 u0x6d9bea6b3e895cf7, ; 302: Microsoft.Extensions.Primitives.dll => 187
	i64 u0x6e838d9a2a6f6c9e, ; 303: lib_System.ValueTuple.dll.so => 155
	i64 u0x6e9965ce1095e60a, ; 304: lib_System.Core.dll.so => 21
	i64 u0x6ffc4967cc47ba57, ; 305: System.IO.FileSystem.Watcher.dll => 50
	i64 u0x701cd46a1c25a5fe, ; 306: System.IO.FileSystem.dll => 51
	i64 u0x71485e7ffdb4b958, ; 307: System.Reflection.Extensions => 96
	i64 u0x71ad672adbe48f35, ; 308: System.ComponentModel.Primitives.dll => 16
	i64 u0x71bc142d620e986a, ; 309: lib_System.Security.Cryptography.Pkcs.dll.so => 198
	i64 u0x725f5a9e82a45c81, ; 310: System.Security.Cryptography.Encoding => 125
	i64 u0x72e0300099accce1, ; 311: System.Xml.XPath.XDocument => 163
	i64 u0x730bfb248998f67a, ; 312: System.IO.Compression.ZipFile => 45
	i64 u0x73a6be34e822f9d1, ; 313: lib_System.Runtime.Serialization.dll.so => 118
	i64 u0x73e4ce94e2eb6ffc, ; 314: lib_System.Memory.dll.so => 64
	i64 u0x743a1eccf080489a, ; 315: WindowsBase.dll => 169
	i64 u0x75c326eb821b85c4, ; 316: lib_System.ComponentModel.DataAnnotations.dll.so => 14
	i64 u0x76ca07b878f44da0, ; 317: System.Runtime.Numerics.dll => 113
	i64 u0x778a805e625329ef, ; 318: System.Linq.Parallel => 61
	i64 u0x77d9074d8f33a303, ; 319: lib_System.Net.ServerSentEvents.dll.so => 76
	i64 u0x77f8a4acc2fdc449, ; 320: System.Security.Cryptography.Cng.dll => 123
	i64 u0x782c5d8eb99ff201, ; 321: lib_Microsoft.VisualBasic.Core.dll.so => 2
	i64 u0x79eb916f2d11e1f0, ; 322: zh-Hans/Microsoft.Data.SqlClient.resources.dll => 212
	i64 u0x7a9a57d43b0845fa, ; 323: System.AppContext => 6
	i64 u0x7b4927e421291c41, ; 324: Microsoft.IdentityModel.JsonWebTokens.dll => 189
	i64 u0x7bef86a4335c4870, ; 325: System.ComponentModel.TypeConverter => 17
	i64 u0x7c41d387501568ba, ; 326: System.Net.WebClient.dll => 79
	i64 u0x7cd2ec8eaf5241cd, ; 327: System.Security.dll => 133
	i64 u0x7d8ee2bdc8e3aad1, ; 328: System.Numerics.Vectors => 85
	i64 u0x7dfc3d6d9d8d7b70, ; 329: System.Collections => 12
	i64 u0x7e2e564fa2f76c65, ; 330: lib_System.Diagnostics.Tracing.dll.so => 34
	i64 u0x7e302e110e1e1346, ; 331: lib_System.Security.Claims.dll.so => 121
	i64 u0x7e6ac99e4e8df72f, ; 332: System.IO.Hashing => 176
	i64 u0x7e946809d6008ef2, ; 333: lib_System.ObjectModel.dll.so => 87
	i64 u0x7ecc13347c8fd849, ; 334: lib_System.ComponentModel.dll.so => 18
	i64 u0x8076a9a44a2ca331, ; 335: System.Net.Quic => 73
	i64 u0x80b7e726b0280681, ; 336: Microsoft.VisualStudio.DesignTools.MobileTapContracts => 215
	i64 u0x80da183a87731838, ; 337: System.Reflection.Metadata => 97
	i64 u0x812c069d5cdecc17, ; 338: System.dll => 168
	i64 u0x81657cec2b31e8aa, ; 339: System.Net => 84
	i64 u0x82b399cb01b531c4, ; 340: lib_System.Web.dll.so => 157
	i64 u0x82df8f5532a10c59, ; 341: lib_System.Drawing.dll.so => 36
	i64 u0x82f0b6e911d13535, ; 342: lib_System.Transactions.dll.so => 154
	i64 u0x831585a9a3537881, ; 343: System.Threading.RateLimiting.dll => 200
	i64 u0x83a7afd2c49adc86, ; 344: lib_Microsoft.IdentityModel.Abstractions.dll.so => 188
	i64 u0x846ce984efea52c7, ; 345: System.Threading.Tasks.Parallel.dll => 147
	i64 u0x84ae73148a4557d2, ; 346: lib_System.IO.Pipes.dll.so => 56
	i64 u0x84b01102c12a9232, ; 347: System.Runtime.Serialization.Json.dll => 115
	i64 u0x8528b82bdbc15371, ; 348: ko/Microsoft.Data.SqlClient.resources => 207
	i64 u0x8662aaeb94fef37f, ; 349: lib_System.Dynamic.Runtime.dll.so => 37
	i64 u0x86b62cb077ec4fd7, ; 350: System.Runtime.Serialization.Xml => 117
	i64 u0x872a5b14c18d328c, ; 351: System.ComponentModel.DataAnnotations => 14
	i64 u0x87c69b87d9283884, ; 352: lib_System.Threading.Thread.dll.so => 149
	i64 u0x87f6569b25707834, ; 353: System.IO.Compression.Brotli.dll => 43
	i64 u0x88ba6bc4f7762b03, ; 354: lib_System.Reflection.dll.so => 100
	i64 u0x890cb548fd490ab9, ; 355: Microsoft.Data.SqlClient.Extensions.Abstractions.dll => 180
	i64 u0x8930322c7bd8f768, ; 356: netstandard => 171
	i64 u0x897a606c9e39c75f, ; 357: lib_System.ComponentModel.Primitives.dll.so => 16
	i64 u0x89911a22005b92b7, ; 358: System.IO.FileSystem.DriveInfo.dll => 48
	i64 u0x89c5188089ec2cd5, ; 359: lib_System.Runtime.InteropServices.RuntimeInformation.dll.so => 109
	i64 u0x8a19e3dc71b34b2c, ; 360: System.Reflection.TypeExtensions.dll => 99
	i64 u0x8a399a706fcbce4b, ; 361: Microsoft.Extensions.Caching.Abstractions => 182
	i64 u0x8b4ff5d0fdd5faa1, ; 362: lib_System.Diagnostics.DiagnosticSource.dll.so => 27
	i64 u0x8b541d476eb3774c, ; 363: System.Security.Principal.Windows => 130
	i64 u0x8b8d01333a96d0b5, ; 364: System.Diagnostics.Process.dll => 29
	i64 u0x8c156fe7f184f137, ; 365: tr/Microsoft.Data.SqlClient.resources => 211
	i64 u0x8cdfdb4ce85fb925, ; 366: lib_System.Security.Principal.Windows.dll.so => 130
	i64 u0x8cdfe7b8f4caa426, ; 367: System.IO.Compression.FileSystem => 44
	i64 u0x8d7b8ab4b3310ead, ; 368: System.Threading => 152
	i64 u0x8da188285aadfe8e, ; 369: System.Collections.Concurrent => 8
	i64 u0x8ed3cdd722b4d782, ; 370: System.Diagnostics.EventLog => 196
	i64 u0x8f44b45eb046bbd1, ; 371: System.ServiceModel.Web.dll => 134
	i64 u0x8fbf5b0114c6dcef, ; 372: System.Globalization.dll => 42
	i64 u0x90263f8448b8f572, ; 373: lib_System.Diagnostics.TraceSource.dll.so => 33
	i64 u0x903101b46fb73a04, ; 374: _Microsoft.Android.Resource.Designer => 218
	i64 u0x90393bd4865292f3, ; 375: lib_System.IO.Compression.dll.so => 46
	i64 u0x905e2b8e7ae91ae6, ; 376: System.Threading.Tasks.Extensions.dll => 146
	i64 u0x9157bd523cd7ed36, ; 377: lib_System.Text.Json.dll.so => 140
	i64 u0x91a74f07b30d37e2, ; 378: System.Linq.dll => 63
	i64 u0x91cb86ea3b17111d, ; 379: System.ServiceModel.Web => 134
	i64 u0x92054e486c0c7ea7, ; 380: System.IO.FileSystem.DriveInfo => 48
	i64 u0x928614058c40c4cd, ; 381: lib_System.Xml.XPath.XDocument.dll.so => 163
	i64 u0x93489853b6098685, ; 382: es/Microsoft.Data.SqlClient.resources.dll => 203
	i64 u0x944077d8ca3c6580, ; 383: System.IO.Compression.dll => 46
	i64 u0x948cffedc8ed7960, ; 384: System.Xml => 167
	i64 u0x948d746a7702861f, ; 385: Microsoft.IdentityModel.Logging.dll => 190
	i64 u0x94bbeab0d4764588, ; 386: System.IO.Hashing.dll => 176
	i64 u0x9502fd818eed2359, ; 387: lib_Microsoft.IdentityModel.Protocols.OpenIdConnect.dll.so => 192
	i64 u0x9564283c37ed59a9, ; 388: lib_Microsoft.IdentityModel.Logging.dll.so => 190
	i64 u0x965d480cfb8de46d, ; 389: pl/Microsoft.Data.SqlClient.resources.dll => 208
	i64 u0x97b8c771ea3e4220, ; 390: System.ComponentModel.dll => 18
	i64 u0x97e144c9d3c6976e, ; 391: System.Collections.Concurrent.dll => 8
	i64 u0x98d720cc4597562c, ; 392: System.Security.Cryptography.OpenSsl => 126
	i64 u0x991d510397f92d9d, ; 393: System.Linq.Expressions => 60
	i64 u0x996ceeb8a3da3d67, ; 394: System.Threading.Overlapped.dll => 144
	i64 u0x9a0cc42c6f36dfc9, ; 395: lib_Microsoft.IdentityModel.Protocols.dll.so => 191
	i64 u0x9b211a749105beac, ; 396: System.Transactions.Local => 153
	i64 u0x9b8734714671022d, ; 397: System.Threading.Tasks.Dataflow.dll => 145
	i64 u0x9c244ac7cda32d26, ; 398: System.Security.Cryptography.X509Certificates.dll => 128
	i64 u0x9c8f6872beab6408, ; 399: System.Xml.XPath.XDocument.dll => 163
	i64 u0x9ce01cf91101ae23, ; 400: System.Xml.XmlDocument => 165
	i64 u0x9e4b95dec42769f7, ; 401: System.Diagnostics.Debug.dll => 26
	i64 u0xa00832eb975f56a8, ; 402: lib_System.Net.dll.so => 84
	i64 u0xa0d8259f4cc284ec, ; 403: lib_System.Security.Cryptography.dll.so => 129
	i64 u0xa0ff9b3e34d92f11, ; 404: lib_System.Resources.Writer.dll.so => 103
	i64 u0xa12fbfb4da97d9f3, ; 405: System.Threading.Timer.dll => 151
	i64 u0xa2572680829d2c7c, ; 406: System.IO.Pipelines.dll => 54
	i64 u0xa26597e57ee9c7f6, ; 407: System.Xml.XmlDocument.dll => 165
	i64 u0xa308401900e5bed3, ; 408: lib_mscorlib.dll.so => 170
	i64 u0xa395572e7da6c99d, ; 409: lib_System.Security.dll.so => 133
	i64 u0xa3c64c49e90a9987, ; 410: System.Security.Cryptography.Pkcs => 198
	i64 u0xa3e683f24b43af6f, ; 411: System.Dynamic.Runtime.dll => 37
	i64 u0xa4edc8f2ceae241a, ; 412: System.Data.Common.dll => 22
	i64 u0xa5494f40f128ce6a, ; 413: System.Runtime.Serialization.Formatters.dll => 114
	i64 u0xa54b74df83dce92b, ; 414: System.Reflection.DispatchProxy => 92
	i64 u0xa5b7152421ed6d98, ; 415: lib_System.IO.FileSystem.Watcher.dll.so => 50
	i64 u0xa5c3844f17b822db, ; 416: lib_System.Linq.Parallel.dll.so => 61
	i64 u0xa5ce5c755bde8cb8, ; 417: lib_System.Security.Cryptography.Csp.dll.so => 124
	i64 u0xa5e599d1e0524750, ; 418: System.Numerics.Vectors.dll => 85
	i64 u0xa5f1ba49b85dd355, ; 419: System.Security.Cryptography.dll => 129
	i64 u0xa61975a5a37873ea, ; 420: lib_System.Xml.XmlSerializer.dll.so => 166
	i64 u0xa66cbee0130865f7, ; 421: lib_WindowsBase.dll.so => 169
	i64 u0xa71fe7d6f6f93efd, ; 422: Microsoft.Data.SqlClient => 179
	i64 u0xa763fbb98df8d9fb, ; 423: lib_Microsoft.Win32.Primitives.dll.so => 4
	i64 u0xa7eab29ed44b4e7a, ; 424: Mono.Android.Export => 173
	i64 u0xa8195217cbf017b7, ; 425: Microsoft.VisualBasic.Core => 2
	i64 u0xa8b52f21e0dbe690, ; 426: System.Runtime.Serialization.dll => 118
	i64 u0xa8c84ce526c2b4bd, ; 427: Microsoft.VisualStudio.DesignTools.XamlTapContract.dll => 217
	i64 u0xa8e6320dd07580ef, ; 428: lib_Microsoft.IdentityModel.JsonWebTokens.dll.so => 189
	i64 u0xa95590e7c57438a4, ; 429: System.Configuration => 19
	i64 u0xaa2219c8e3449ff5, ; 430: Microsoft.Extensions.Logging.Abstractions => 185
	i64 u0xaa443ac34067eeef, ; 431: System.Private.Xml.dll => 91
	i64 u0xaa52de307ef5d1dd, ; 432: System.Net.Http => 66
	i64 u0xaa9a7b0214a5cc5c, ; 433: System.Diagnostics.StackTrace.dll => 30
	i64 u0xaaaf86367285a918, ; 434: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 184
	i64 u0xab9c1b2687d86b0b, ; 435: lib_System.Linq.Expressions.dll.so => 60
	i64 u0xac2af3fa195a15ce, ; 436: System.Runtime.Numerics => 113
	i64 u0xac5acae88f60357e, ; 437: System.Diagnostics.Tools.dll => 32
	i64 u0xac79c7e46047ad98, ; 438: System.Security.Principal.Windows.dll => 130
	i64 u0xac98d31068e24591, ; 439: System.Xml.XDocument => 162
	i64 u0xacf42eea7ef9cd12, ; 440: System.Threading.Channels => 143
	i64 u0xadbb53caf78a79d2, ; 441: System.Web.HttpUtility => 156
	i64 u0xadc90ab061a9e6e4, ; 442: System.ComponentModel.TypeConverter.dll => 17
	i64 u0xadf4cf30debbeb9a, ; 443: System.Net.ServicePoint.dll => 77
	i64 u0xadf511667bef3595, ; 444: System.Net.Security => 75
	i64 u0xae0aaa94fdcfce0f, ; 445: System.ComponentModel.EventBasedAsync.dll => 15
	i64 u0xae282bcd03739de7, ; 446: Java.Interop => 172
	i64 u0xae53579c90db1107, ; 447: System.ObjectModel.dll => 87
	i64 u0xaf732d0b2193b8f5, ; 448: System.Security.Cryptography.OpenSsl.dll => 126
	i64 u0xb0bb43dc52ea59f9, ; 449: System.Diagnostics.Tracing.dll => 34
	i64 u0xb1dd05401aa8ee63, ; 450: System.Security.AccessControl => 120
	i64 u0xb220631954820169, ; 451: System.Text.RegularExpressions => 141
	i64 u0xb2376e1dbf8b4ed7, ; 452: System.Security.Cryptography.Csp => 124
	i64 u0xb2a1959fe95c5402, ; 453: lib_System.Runtime.InteropServices.JavaScript.dll.so => 108
	i64 u0xb3011a0a57f7ffb2, ; 454: Microsoft.VisualStudio.DesignTools.MobileTapContracts.dll => 215
	i64 u0xb398860d6ed7ba2f, ; 455: System.Security.Cryptography.ProtectedData => 199
	i64 u0xb4bd7015ecee9d86, ; 456: System.IO.Pipelines => 54
	i64 u0xb4c53d9749c5f226, ; 457: lib_System.IO.FileSystem.AccessControl.dll.so => 47
	i64 u0xb4ff710863453fda, ; 458: System.Diagnostics.FileVersionInfo.dll => 28
	i64 u0xb54092076b15e062, ; 459: System.Threading.AccessControl => 142
	i64 u0xb5c38bf497a4cfe2, ; 460: lib_System.Threading.Tasks.dll.so => 148
	i64 u0xb5c7fcdafbc67ee4, ; 461: Microsoft.Extensions.Logging.Abstractions.dll => 185
	i64 u0xb5ea31d5244c6626, ; 462: System.Threading.ThreadPool.dll => 150
	i64 u0xb7212c4683a94afe, ; 463: System.Drawing.Primitives => 35
	i64 u0xb81a2c6e0aee50fe, ; 464: lib_System.Private.CoreLib.dll.so => 177
	i64 u0xb8c60af47c08d4da, ; 465: System.Net.ServicePoint => 77
	i64 u0xb8e68d20aad91196, ; 466: lib_System.Xml.XPath.dll.so => 164
	i64 u0xb9185c33a1643eed, ; 467: Microsoft.CSharp.dll => 1
	i64 u0xba4670aa94a2b3c6, ; 468: lib_System.Xml.XDocument.dll.so => 162
	i64 u0xba48785529705af9, ; 469: System.Collections.dll => 12
	i64 u0xba965b8c86359996, ; 470: lib_System.Windows.dll.so => 158
	i64 u0xbb155df87f47f006, ; 471: GestionCegepMobile.dll => 0
	i64 u0xbb286883bc35db36, ; 472: System.Transactions.dll => 154
	i64 u0xbb65706fde942ce3, ; 473: System.Net.Sockets => 78
	i64 u0xbba28979413cad9e, ; 474: lib_System.Runtime.CompilerServices.VisualC.dll.so => 105
	i64 u0xbbd180354b67271a, ; 475: System.Runtime.Serialization.Formatters => 114
	i64 u0xbcd22b365b764643, ; 476: lib-zh-Hans-Microsoft.Data.SqlClient.resources.dll.so => 212
	i64 u0xbd0aaf9dbfcc3376, ; 477: fr/Microsoft.Data.SqlClient.resources.dll => 204
	i64 u0xbd0e2c0d55246576, ; 478: System.Net.Http.dll => 66
	i64 u0xbd3c2d7a8325e11b, ; 479: lib-fr-Microsoft.Data.SqlClient.resources.dll.so => 204
	i64 u0xbd3fbd85b9e1cb29, ; 480: lib_System.Net.HttpListener.dll.so => 67
	i64 u0xbd4aef17dbfb0390, ; 481: ru/Microsoft.Data.SqlClient.resources => 210
	i64 u0xbd4f572d2bd0a789, ; 482: System.IO.Compression.ZipFile.dll => 45
	i64 u0xbd877b14d0b56392, ; 483: System.Runtime.Intrinsics.dll => 111
	i64 u0xbe65a49036345cf4, ; 484: lib_System.Buffers.dll.so => 7
	i64 u0xbef9919db45b4ca7, ; 485: System.IO.Pipes.AccessControl => 55
	i64 u0xbfc1e1fb3095f2b3, ; 486: lib_System.Net.Http.Json.dll.so => 65
	i64 u0xc0d928351ab5ca77, ; 487: System.Console.dll => 20
	i64 u0xc0f5a221a9383aea, ; 488: System.Runtime.Intrinsics => 111
	i64 u0xc111030af54d7191, ; 489: System.Resources.Writer => 103
	i64 u0xc12b8b3afa48329c, ; 490: lib_System.Linq.dll.so => 63
	i64 u0xc183ca0b74453aa9, ; 491: lib_System.Threading.Tasks.Dataflow.dll.so => 145
	i64 u0xc26c064effb1dea9, ; 492: System.Buffers.dll => 7
	i64 u0xc278de356ad8a9e3, ; 493: Microsoft.IdentityModel.Logging => 190
	i64 u0xc2902f6cf5452577, ; 494: lib_Mono.Android.Export.dll.so => 173
	i64 u0xc2a3bca55b573141, ; 495: System.IO.FileSystem.Watcher => 50
	i64 u0xc30b52815b58ac2c, ; 496: lib_System.Runtime.Serialization.Xml.dll.so => 117
	i64 u0xc36d7d89c652f455, ; 497: System.Threading.Overlapped => 144
	i64 u0xc3c86c1e5e12f03d, ; 498: WindowsBase => 169
	i64 u0xc421b61fd853169d, ; 499: lib_System.Net.WebSockets.Client.dll.so => 82
	i64 u0xc463e077917aa21d, ; 500: System.Runtime.Serialization.Json => 115
	i64 u0xc4d69851fe06342f, ; 501: lib_Microsoft.Extensions.Caching.Memory.dll.so => 183
	i64 u0xc50fded0ded1418c, ; 502: lib_System.ComponentModel.TypeConverter.dll.so => 17
	i64 u0xc519125d6bc8fb11, ; 503: lib_System.Net.Requests.dll.so => 74
	i64 u0xc5325b2fcb37446f, ; 504: lib_System.Private.Xml.dll.so => 91
	i64 u0xc583d8477b5d3bac, ; 505: zh-Hant/Microsoft.Data.SqlClient.resources.dll => 213
	i64 u0xc5a0f4b95a699af7, ; 506: lib_System.Private.Uri.dll.so => 89
	i64 u0xc5cdcd5b6277579e, ; 507: lib_System.Security.Cryptography.Algorithms.dll.so => 122
	i64 u0xc7c01e7d7c93a110, ; 508: System.Text.Encoding.Extensions.dll => 137
	i64 u0xc7ce851898a4548e, ; 509: lib_System.Web.HttpUtility.dll.so => 156
	i64 u0xc809d4089d2556b2, ; 510: System.Runtime.InteropServices.JavaScript.dll => 108
	i64 u0xc858a28d9ee5a6c5, ; 511: lib_System.Collections.Specialized.dll.so => 11
	i64 u0xc8ac7c6bf1c2ec51, ; 512: System.Reflection.DispatchProxy.dll => 92
	i64 u0xc9c62c8f354ac568, ; 513: lib_System.Diagnostics.TextWriterTraceListener.dll.so => 31
	i64 u0xca32340d8d54dcd5, ; 514: Microsoft.Extensions.Caching.Memory.dll => 183
	i64 u0xca5801070d9fccfb, ; 515: System.Text.Encoding => 138
	i64 u0xcbb5f80c7293e696, ; 516: lib_System.Globalization.Calendars.dll.so => 40
	i64 u0xcbd4fdd9cef4a294, ; 517: lib__Microsoft.Android.Resource.Designer.dll.so => 218
	i64 u0xcc2876b32ef2794c, ; 518: lib_System.Text.RegularExpressions.dll.so => 141
	i64 u0xcc9fa2923aa1c9ef, ; 519: System.Diagnostics.Contracts.dll => 25
	i64 u0xccae9bb73e2326bd, ; 520: lib_System.IO.Hashing.dll.so => 176
	i64 u0xcd10a42808629144, ; 521: System.Net.Requests => 74
	i64 u0xcde1fa22dc303670, ; 522: Microsoft.VisualStudio.DesignTools.XamlTapContract => 217
	i64 u0xcf140ed700bc8e66, ; 523: Microsoft.SqlServer.Server.dll => 194
	i64 u0xcf23d8093f3ceadf, ; 524: System.Diagnostics.DiagnosticSource.dll => 27
	i64 u0xcf5ff6b6b2c4c382, ; 525: System.Net.Mail.dll => 68
	i64 u0xcf8fc898f98b0d34, ; 526: System.Private.Xml.Linq => 90
	i64 u0xd04b5f59ed596e31, ; 527: System.Reflection.Metadata.dll => 97
	i64 u0xd063299fcfc0c93f, ; 528: lib_System.Runtime.Serialization.Json.dll.so => 115
	i64 u0xd0de8a113e976700, ; 529: System.Diagnostics.TextWriterTraceListener => 31
	i64 u0xd0fc33d5ae5d4cb8, ; 530: System.Runtime.Extensions => 106
	i64 u0xd12beacdfc14f696, ; 531: System.Dynamic.Runtime => 37
	i64 u0xd198e7ce1b6a8344, ; 532: System.Net.Quic.dll => 73
	i64 u0xd22a0c4630f2fe66, ; 533: lib_System.Security.Cryptography.ProtectedData.dll.so => 199
	i64 u0xd2dffb59201927bd, ; 534: de/Microsoft.Data.SqlClient.resources.dll => 202
	i64 u0xd333d0af9e423810, ; 535: System.Runtime.InteropServices => 110
	i64 u0xd33a415cb4278969, ; 536: System.Security.Cryptography.Encoding.dll => 125
	i64 u0xd3651b6fc3125825, ; 537: System.Private.Uri.dll => 89
	i64 u0xd3801faafafb7698, ; 538: System.Private.DataContractSerialization.dll => 88
	i64 u0xd3edcc1f25459a50, ; 539: System.Reflection.Emit => 95
	i64 u0xd4645626dffec99d, ; 540: lib_Microsoft.Extensions.DependencyInjection.Abstractions.dll.so => 184
	i64 u0xd4fa0abb79079ea9, ; 541: System.Security.Principal.dll => 131
	i64 u0xd5858610826f1c08, ; 542: lib-ru-Microsoft.Data.SqlClient.resources.dll.so => 210
	i64 u0xd65786d27a4ad960, ; 543: lib_Microsoft.Maui.Controls.HotReload.Forms.dll.so => 214
	i64 u0xd72c760af136e863, ; 544: System.Xml.XmlSerializer.dll => 166
	i64 u0xd753f071e44c2a03, ; 545: lib_System.Security.SecureString.dll.so => 132
	i64 u0xd7b3764ada9d341d, ; 546: lib_Microsoft.Extensions.Logging.Abstractions.dll.so => 185
	i64 u0xdad05a11827959a3, ; 547: System.Collections.NonGeneric.dll => 10
	i64 u0xdaefdfe71aa53cf9, ; 548: System.IO.FileSystem.Primitives => 49
	i64 u0xdb58816721c02a59, ; 549: lib_System.Reflection.Emit.ILGeneration.dll.so => 93
	i64 u0xdbf2a779fbc3ac31, ; 550: System.Transactions.Local.dll => 153
	i64 u0xdbf9607a441b4505, ; 551: System.Linq => 63
	i64 u0xdbfc90157a0de9b0, ; 552: lib_System.Text.Encoding.dll.so => 138
	i64 u0xdc75032002d1a212, ; 553: lib_System.Transactions.Local.dll.so => 153
	i64 u0xdca8be7403f92d4f, ; 554: lib_System.Linq.Queryable.dll.so => 62
	i64 u0xdd2b722d78ef5f43, ; 555: System.Runtime.dll => 119
	i64 u0xdd67031857c72f96, ; 556: lib_System.Text.Encodings.Web.dll.so => 139
	i64 u0xdd92e229ad292030, ; 557: System.Numerics.dll => 86
	i64 u0xde110ae80fa7c2e2, ; 558: System.Xml.XDocument.dll => 162
	i64 u0xde572c2b2fb32f93, ; 559: lib_System.Threading.Tasks.Extensions.dll.so => 146
	i64 u0xdf4b773de8fb1540, ; 560: System.Net.dll => 84
	i64 u0xdf9c7682560a9629, ; 561: System.Net.ServerSentEvents => 76
	i64 u0xdfa254ebb4346068, ; 562: System.Net.Ping => 71
	i64 u0xe021eaa401792a05, ; 563: System.Text.Encoding.dll => 138
	i64 u0xe0ea30f1ac5b7731, ; 564: ko/Microsoft.Data.SqlClient.resources.dll => 207
	i64 u0xe0ee2e61123c1478, ; 565: lib-es-Microsoft.Data.SqlClient.resources.dll.so => 203
	i64 u0xe10b760bb1462e7a, ; 566: lib_System.Security.Cryptography.Primitives.dll.so => 127
	i64 u0xe12265280d0b036d, ; 567: fr/Microsoft.Data.SqlClient.resources => 204
	i64 u0xe1566bbdb759c5af, ; 568: Microsoft.Maui.Controls.HotReload.Forms.dll => 214
	i64 u0xe192a588d4410686, ; 569: lib_System.IO.Pipelines.dll.so => 54
	i64 u0xe1a08bd3fa539e0d, ; 570: System.Runtime.Loader => 112
	i64 u0xe1a77eb8831f7741, ; 571: System.Security.SecureString.dll => 132
	i64 u0xe1b52f9f816c70ef, ; 572: System.Private.Xml.Linq.dll => 90
	i64 u0xe1e199c8ab02e356, ; 573: System.Data.DataSetExtensions.dll => 23
	i64 u0xe1ecfdb7fff86067, ; 574: System.Net.Security.dll => 75
	i64 u0xe2252a80fe853de4, ; 575: lib_System.Security.Principal.dll.so => 131
	i64 u0xe22fa4c9c645db62, ; 576: System.Diagnostics.TextWriterTraceListener.dll => 31
	i64 u0xe2420585aeceb728, ; 577: System.Net.Requests.dll => 74
	i64 u0xe2ad448dee50fbdf, ; 578: System.Xml.Serialization => 161
	i64 u0xe2d920f978f5d85c, ; 579: System.Data.DataSetExtensions => 23
	i64 u0xe2e426c7714fa0bc, ; 580: Microsoft.Win32.Primitives.dll => 4
	i64 u0xe332bacb3eb4a806, ; 581: Mono.Android.Export.dll => 173
	i64 u0xe3b7cbae5ad66c75, ; 582: lib_System.Security.Cryptography.Encoding.dll.so => 125
	i64 u0xe4f74a0b5bf9703f, ; 583: System.Runtime.Serialization.Primitives => 116
	i64 u0xe5434e8a119ceb69, ; 584: lib_Mono.Android.dll.so => 175
	i64 u0xe55703b9ce5c038a, ; 585: System.Diagnostics.Tools => 32
	i64 u0xe57013c8afc270b5, ; 586: Microsoft.VisualBasic => 3
	i64 u0xe57d22ca4aeb4900, ; 587: System.Configuration.ConfigurationManager => 195
	i64 u0xe62913cc36bc07ec, ; 588: System.Xml.dll => 167
	i64 u0xe7e03cc18dcdeb49, ; 589: lib_System.Diagnostics.StackTrace.dll.so => 30
	i64 u0xe7e147ff99a7a380, ; 590: lib_System.Configuration.dll.so => 19
	i64 u0xe896622fe0902957, ; 591: System.Reflection.Emit.dll => 95
	i64 u0xe89a2a9ef110899b, ; 592: System.Drawing.dll => 36
	i64 u0xe8c5f8c100b5934b, ; 593: Microsoft.Win32.Registry => 5
	i64 u0xe9b9c8c0458fd92a, ; 594: System.Windows => 158
	i64 u0xed60c6fa891c051a, ; 595: lib_Microsoft.VisualStudio.DesignTools.TapContract.dll.so => 216
	i64 u0xed6ef763c6fb395f, ; 596: System.Diagnostics.EventLog.dll => 196
	i64 u0xedc4817167106c23, ; 597: System.Net.Sockets.dll => 78
	i64 u0xedc632067fb20ff3, ; 598: System.Memory.dll => 64
	i64 u0xee81f5b3f1c4f83b, ; 599: System.Threading.ThreadPool => 150
	i64 u0xeefc635595ef57f0, ; 600: System.Security.Cryptography.Cng => 123
	i64 u0xef03b1b5a04e9709, ; 601: System.Text.Encoding.CodePages.dll => 136
	i64 u0xefd0396433f04886, ; 602: pt-BR/Microsoft.Data.SqlClient.resources => 209
	i64 u0xefd1e0c4e5c9b371, ; 603: System.Resources.ResourceManager.dll => 102
	i64 u0xefe8f8d5ed3c72ea, ; 604: System.Formats.Tar.dll => 39
	i64 u0xeff59cbde4363ec3, ; 605: System.Threading.AccessControl.dll => 142
	i64 u0xf09e47b6ae914f6e, ; 606: System.Net.NameResolution => 69
	i64 u0xf0ac2b489fed2e35, ; 607: lib_System.Diagnostics.Debug.dll.so => 26
	i64 u0xf0bb49dadd3a1fe1, ; 608: lib_System.Net.ServicePoint.dll.so => 77
	i64 u0xf0de2537ee19c6ca, ; 609: lib_System.Net.WebHeaderCollection.dll.so => 80
	i64 u0xf161f4f3c3b7e62c, ; 610: System.Data => 24
	i64 u0xf16eb650d5a464bc, ; 611: System.ValueTuple => 155
	i64 u0xf1c4b4005493d871, ; 612: System.Formats.Asn1.dll => 38
	i64 u0xf300e085f8acd238, ; 613: lib_System.ServiceProcess.dll.so => 135
	i64 u0xf34e52b26e7e059d, ; 614: System.Runtime.CompilerServices.VisualC.dll => 105
	i64 u0xf3ad9b8fb3eefd12, ; 615: lib_System.IO.UnmanagedMemoryStream.dll.so => 57
	i64 u0xf3caa4fa646c92a8, ; 616: lib_System.Threading.RateLimiting.dll.so => 200
	i64 u0xf3ddfe05336abf29, ; 617: System => 168
	i64 u0xf408654b2a135055, ; 618: System.Reflection.Emit.ILGeneration.dll => 93
	i64 u0xf4103170a1de5bd0, ; 619: System.Linq.Queryable.dll => 62
	i64 u0xf42d20c23173d77c, ; 620: lib_System.ServiceModel.Web.dll.so => 134
	i64 u0xf4c1dd70a5496a17, ; 621: System.IO.Compression => 46
	i64 u0xf4ecf4b9afc64781, ; 622: System.ServiceProcess.dll => 135
	i64 u0xf518f63ead11fcd1, ; 623: System.Threading.Tasks => 148
	i64 u0xf5e59d7ac34b50aa, ; 624: Microsoft.IdentityModel.Protocols.dll => 191
	i64 u0xf5fc7602fe27b333, ; 625: System.Net.WebHeaderCollection => 80
	i64 u0xf61ade9836ad4692, ; 626: Microsoft.IdentityModel.Tokens.dll => 193
	i64 u0xf6c0e7d55a7a4e4f, ; 627: Microsoft.IdentityModel.JsonWebTokens => 189
	i64 u0xf70c0a7bf8ccf5af, ; 628: System.Web => 157
	i64 u0xf7be8a85d06b4b64, ; 629: ru/Microsoft.Data.SqlClient.resources.dll => 210
	i64 u0xf7e2cac4c45067b3, ; 630: lib_System.Numerics.Vectors.dll.so => 85
	i64 u0xf83775f330791063, ; 631: ja/Microsoft.Data.SqlClient.resources.dll => 206
	i64 u0xf8aac5ea82de1348, ; 632: System.Linq.Queryable => 62
	i64 u0xf8b77539b362d3ba, ; 633: lib_System.Reflection.Primitives.dll.so => 98
	i64 u0xf8cd217ba1bbfdc8, ; 634: lib-zh-Hant-Microsoft.Data.SqlClient.resources.dll.so => 213
	i64 u0xf915dc29808193a1, ; 635: System.Web.HttpUtility.dll => 156
	i64 u0xf9be54c8bcf8ff3b, ; 636: System.Security.AccessControl.dll => 120
	i64 u0xf9eec5bb3a6aedc6, ; 637: Microsoft.Extensions.Options => 186
	i64 u0xfa0e82300e67f913, ; 638: lib_System.AppContext.dll.so => 6
	i64 u0xfa2fdb27e8a2c8e8, ; 639: System.ComponentModel.EventBasedAsync => 15
	i64 u0xfa3f278f288b0e84, ; 640: lib_System.Net.Security.dll.so => 75
	i64 u0xfa645d91e9fc4cba, ; 641: System.Threading.Thread => 149
	i64 u0xfad4d2c770e827f9, ; 642: lib_System.IO.IsolatedStorage.dll.so => 52
	i64 u0xfb06dd2338e6f7c4, ; 643: System.Net.Ping.dll => 71
	i64 u0xfb087abe5365e3b7, ; 644: lib_System.Data.DataSetExtensions.dll.so => 23
	i64 u0xfb846e949baff5ea, ; 645: System.Xml.Serialization.dll => 161
	i64 u0xfbad3e4ce4b98145, ; 646: System.Security.Cryptography.X509Certificates => 128
	i64 u0xfbf0a31c9fc34bc4, ; 647: lib_System.Net.Http.dll.so => 66
	i64 u0xfc6b7527cc280b3f, ; 648: lib_System.Runtime.Serialization.Formatters.dll.so => 114
	i64 u0xfc93fc307d279893, ; 649: System.IO.Pipes.AccessControl.dll => 55
	i64 u0xfcd302092ada6328, ; 650: System.IO.MemoryMappedFiles.dll => 53
	i64 u0xfd49b3c1a76e2748, ; 651: System.Runtime.InteropServices.RuntimeInformation => 109
	i64 u0xfd536c702f64dc47, ; 652: System.Text.Encoding.Extensions => 137
	i64 u0xfda36abccf05cf5c, ; 653: System.Net.WebSockets.Client => 82
	i64 u0xff270a55858bac8d, ; 654: System.Security.Principal => 131
	i64 u0xff9b54613e0d2cc8, ; 655: System.Net.Http.Json => 65
	i64 u0xffdb7a971be4ec73 ; 656: System.ValueTuple.dll => 155
], align 8

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [657 x i32] [
	i32 42, i32 202, i32 13, i32 198, i32 107, i32 207, i32 183, i32 174,
	i32 48, i32 7, i32 88, i32 188, i32 72, i32 12, i32 104, i32 213,
	i32 211, i32 159, i32 19, i32 164, i32 170, i32 10, i32 205, i32 98,
	i32 13, i32 186, i32 10, i32 129, i32 97, i32 182, i32 143, i32 179,
	i32 39, i32 175, i32 5, i32 68, i32 132, i32 69, i32 67, i32 206,
	i32 57, i32 52, i32 203, i32 181, i32 43, i32 127, i32 68, i32 83,
	i32 216, i32 161, i32 94, i32 101, i32 192, i32 144, i32 154, i32 165,
	i32 172, i32 181, i32 192, i32 184, i32 83, i32 216, i32 4, i32 5,
	i32 0, i32 196, i32 51, i32 103, i32 202, i32 56, i32 122, i32 100,
	i32 180, i32 171, i32 120, i32 21, i32 139, i32 99, i32 79, i32 121,
	i32 8, i32 168, i32 71, i32 174, i32 148, i32 40, i32 47, i32 30,
	i32 0, i32 147, i32 200, i32 186, i32 166, i32 28, i32 86, i32 79,
	i32 43, i32 29, i32 42, i32 105, i32 119, i32 45, i32 93, i32 56,
	i32 151, i32 215, i32 149, i32 102, i32 49, i32 201, i32 20, i32 116,
	i32 187, i32 96, i32 58, i32 197, i32 83, i32 172, i32 26, i32 72,
	i32 214, i32 70, i32 33, i32 14, i32 141, i32 197, i32 38, i32 136,
	i32 94, i32 90, i32 209, i32 152, i32 24, i32 140, i32 57, i32 142,
	i32 51, i32 29, i32 160, i32 194, i32 34, i32 167, i32 182, i32 188,
	i32 52, i32 218, i32 92, i32 35, i32 160, i32 9, i32 78, i32 59,
	i32 194, i32 55, i32 13, i32 111, i32 32, i32 106, i32 86, i32 94,
	i32 53, i32 98, i32 58, i32 9, i32 104, i32 178, i32 69, i32 191,
	i32 195, i32 127, i32 118, i32 137, i32 193, i32 128, i32 181, i32 108,
	i32 179, i32 133, i32 150, i32 159, i32 205, i32 99, i32 24, i32 146,
	i32 3, i32 195, i32 170, i32 102, i32 164, i32 101, i32 25, i32 95,
	i32 171, i32 175, i32 3, i32 1, i32 116, i32 197, i32 33, i32 6,
	i32 159, i32 53, i32 87, i32 180, i32 44, i32 106, i32 47, i32 140,
	i32 65, i32 70, i32 82, i32 60, i32 91, i32 157, i32 135, i32 112,
	i32 59, i32 174, i32 136, i32 143, i32 40, i32 201, i32 193, i32 205,
	i32 61, i32 206, i32 81, i32 25, i32 36, i32 101, i32 72, i32 22,
	i32 212, i32 123, i32 70, i32 109, i32 121, i32 119, i32 11, i32 2,
	i32 126, i32 117, i32 145, i32 41, i32 89, i32 177, i32 27, i32 151,
	i32 1, i32 44, i32 152, i32 18, i32 88, i32 41, i32 96, i32 28,
	i32 41, i32 80, i32 209, i32 208, i32 147, i32 110, i32 11, i32 107,
	i32 139, i32 16, i32 124, i32 67, i32 160, i32 22, i32 104, i32 64,
	i32 58, i32 112, i32 201, i32 177, i32 211, i32 178, i32 217, i32 9,
	i32 122, i32 100, i32 178, i32 107, i32 76, i32 113, i32 49, i32 59,
	i32 20, i32 73, i32 158, i32 39, i32 35, i32 38, i32 110, i32 21,
	i32 199, i32 208, i32 15, i32 187, i32 81, i32 81, i32 187, i32 155,
	i32 21, i32 50, i32 51, i32 96, i32 16, i32 198, i32 125, i32 163,
	i32 45, i32 118, i32 64, i32 169, i32 14, i32 113, i32 61, i32 76,
	i32 123, i32 2, i32 212, i32 6, i32 189, i32 17, i32 79, i32 133,
	i32 85, i32 12, i32 34, i32 121, i32 176, i32 87, i32 18, i32 73,
	i32 215, i32 97, i32 168, i32 84, i32 157, i32 36, i32 154, i32 200,
	i32 188, i32 147, i32 56, i32 115, i32 207, i32 37, i32 117, i32 14,
	i32 149, i32 43, i32 100, i32 180, i32 171, i32 16, i32 48, i32 109,
	i32 99, i32 182, i32 27, i32 130, i32 29, i32 211, i32 130, i32 44,
	i32 152, i32 8, i32 196, i32 134, i32 42, i32 33, i32 218, i32 46,
	i32 146, i32 140, i32 63, i32 134, i32 48, i32 163, i32 203, i32 46,
	i32 167, i32 190, i32 176, i32 192, i32 190, i32 208, i32 18, i32 8,
	i32 126, i32 60, i32 144, i32 191, i32 153, i32 145, i32 128, i32 163,
	i32 165, i32 26, i32 84, i32 129, i32 103, i32 151, i32 54, i32 165,
	i32 170, i32 133, i32 198, i32 37, i32 22, i32 114, i32 92, i32 50,
	i32 61, i32 124, i32 85, i32 129, i32 166, i32 169, i32 179, i32 4,
	i32 173, i32 2, i32 118, i32 217, i32 189, i32 19, i32 185, i32 91,
	i32 66, i32 30, i32 184, i32 60, i32 113, i32 32, i32 130, i32 162,
	i32 143, i32 156, i32 17, i32 77, i32 75, i32 15, i32 172, i32 87,
	i32 126, i32 34, i32 120, i32 141, i32 124, i32 108, i32 215, i32 199,
	i32 54, i32 47, i32 28, i32 142, i32 148, i32 185, i32 150, i32 35,
	i32 177, i32 77, i32 164, i32 1, i32 162, i32 12, i32 158, i32 0,
	i32 154, i32 78, i32 105, i32 114, i32 212, i32 204, i32 66, i32 204,
	i32 67, i32 210, i32 45, i32 111, i32 7, i32 55, i32 65, i32 20,
	i32 111, i32 103, i32 63, i32 145, i32 7, i32 190, i32 173, i32 50,
	i32 117, i32 144, i32 169, i32 82, i32 115, i32 183, i32 17, i32 74,
	i32 91, i32 213, i32 89, i32 122, i32 137, i32 156, i32 108, i32 11,
	i32 92, i32 31, i32 183, i32 138, i32 40, i32 218, i32 141, i32 25,
	i32 176, i32 74, i32 217, i32 194, i32 27, i32 68, i32 90, i32 97,
	i32 115, i32 31, i32 106, i32 37, i32 73, i32 199, i32 202, i32 110,
	i32 125, i32 89, i32 88, i32 95, i32 184, i32 131, i32 210, i32 214,
	i32 166, i32 132, i32 185, i32 10, i32 49, i32 93, i32 153, i32 63,
	i32 138, i32 153, i32 62, i32 119, i32 139, i32 86, i32 162, i32 146,
	i32 84, i32 76, i32 71, i32 138, i32 207, i32 203, i32 127, i32 204,
	i32 214, i32 54, i32 112, i32 132, i32 90, i32 23, i32 75, i32 131,
	i32 31, i32 74, i32 161, i32 23, i32 4, i32 173, i32 125, i32 116,
	i32 175, i32 32, i32 3, i32 195, i32 167, i32 30, i32 19, i32 95,
	i32 36, i32 5, i32 158, i32 216, i32 196, i32 78, i32 64, i32 150,
	i32 123, i32 136, i32 209, i32 102, i32 39, i32 142, i32 69, i32 26,
	i32 77, i32 80, i32 24, i32 155, i32 38, i32 135, i32 105, i32 57,
	i32 200, i32 168, i32 93, i32 62, i32 134, i32 46, i32 135, i32 148,
	i32 191, i32 80, i32 193, i32 189, i32 157, i32 210, i32 85, i32 206,
	i32 62, i32 98, i32 213, i32 156, i32 120, i32 186, i32 6, i32 15,
	i32 75, i32 149, i32 52, i32 71, i32 23, i32 161, i32 128, i32 66,
	i32 114, i32 55, i32 53, i32 109, i32 137, i32 82, i32 131, i32 65,
	i32 155
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 u0x0000000000000000, ; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

; Functions

; Function attributes: memory(write, argmem: none, inaccessiblemem: none) "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.mm.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
	ret void
}

; Strings
@.mm.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { memory(write, argmem: none, inaccessiblemem: none) "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" }

; Metadata
!llvm.module.flags = !{!0, !1, !7, !8, !9, !10}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!".NET for Android remotes/origin/release/10.0.1xx @ db080b91dbe7947a69005a203ea98d9bb207ad04"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"branch-target-enforcement", i32 0}
!8 = !{i32 1, !"sign-return-address", i32 0}
!9 = !{i32 1, !"sign-return-address-all", i32 0}
!10 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
