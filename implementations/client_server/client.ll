; ModuleID = 'client.cpp'
source_filename = "client.cpp"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx13.0.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }
%"class.std::__1::basic_istream" = type { i32 (...)**, i64, %"class.std::__1::basic_ios.base" }
%"class.std::__1::basic_ios.base" = type <{ %"class.std::__1::ios_base", %"class.std::__1::basic_ostream"*, i32 }>
%"class.std::__1::ios_base" = type { i32 (...)**, i32, i64, i64, i32, i32, i8*, i8*, void (i32, %"class.std::__1::ios_base"*, i32)**, i32*, i64, i64, i64*, i64, i64, i8**, i64, i64 }
%"class.std::__1::basic_ostream" = type { i32 (...)**, %"class.std::__1::basic_ios.base" }
%"class.std::__1::locale::id" = type <{ %"struct.std::__1::once_flag", i32, [4 x i8] }>
%"struct.std::__1::once_flag" = type { i64 }
%struct.sockaddr_in = type { i8, i8, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.hostent = type { i8*, i8**, i32, i32, i8** }
%struct.sockaddr = type { i8, i8, [14 x i8] }
%"class.std::__1::basic_string" = type { %"class.std::__1::__compressed_pair" }
%"class.std::__1::__compressed_pair" = type { %"struct.std::__1::__compressed_pair_elem" }
%"struct.std::__1::__compressed_pair_elem" = type { %"struct.std::__1::basic_string<char>::__rep" }
%"struct.std::__1::basic_string<char>::__rep" = type { %union.anon }
%union.anon = type { %"struct.std::__1::basic_string<char>::__long" }
%"struct.std::__1::basic_string<char>::__long" = type { i8*, i64, i64 }
%"class.std::__1::basic_istream<char>::sentry" = type { i8 }
%"class.std::__1::ctype" = type <{ %"class.std::__1::locale::facet", i32*, i8, [7 x i8] }>
%"class.std::__1::locale::facet" = type { %"class.std::__1::__shared_count" }
%"class.std::__1::__shared_count" = type { i32 (...)**, i64 }
%"class.std::__1::locale" = type { %"class.std::__1::locale::__imp"* }
%"class.std::__1::locale::__imp" = type opaque
%"class.std::__1::basic_ios" = type <{ %"class.std::__1::ios_base", %"class.std::__1::basic_ostream"*, i32, [4 x i8] }>
%"class.std::__1::basic_streambuf" = type { i32 (...)**, %"class.std::__1::locale", i8*, i8*, i8*, i8*, i8*, i8* }
%"struct.std::__1::__default_init_tag" = type { i8 }
%"class.std::__1::__basic_string_common" = type { i8 }
%"struct.std::__1::basic_string<char>::__raw" = type { [3 x i64] }
%"struct.std::__1::__compressed_pair_elem.0" = type { i8 }
%"class.std::__1::allocator" = type { i8 }
%"struct.std::__1::__non_trivial_if" = type { i8 }
%"struct.std::__1::basic_string<char>::__short" = type { [23 x i8], %struct.anon }
%struct.anon = type { i8 }

@__stderrp = external global %struct.__sFILE*, align 8
@.str = private unnamed_addr constant [18 x i8] c"%s: unknown host\0A\00", align 1
@.str.1 = private unnamed_addr constant [29 x i8] c"Error getting port of socket\00", align 1
@.str.2 = private unnamed_addr constant [39 x i8] c"Error: Message exceeds maximum length\0A\00", align 1
@.str.3 = private unnamed_addr constant [31 x i8] c"Error connecting stream socket\00", align 1
@.str.4 = private unnamed_addr constant [31 x i8] c"Error sending on stream socket\00", align 1
@.str.5 = private unnamed_addr constant [9 x i8] c"connect \00", align 1
@.str.6 = private unnamed_addr constant [12 x i8] c"disconnect \00", align 1
@.str.7 = private unnamed_addr constant [36 x i8] c"Usage: ./client hostname client_id\0A\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"> \00", align 1
@_ZNSt3__13cinE = external global %"class.std::__1::basic_istream", align 8
@.str.9 = private unnamed_addr constant [8 x i8] c"connect\00", align 1
@.str.10 = private unnamed_addr constant [11 x i8] c"disconnect\00", align 1
@.str.11 = private unnamed_addr constant [38 x i8] c"Usage: <connect/disconnect> port_num\0A\00", align 1
@.str.12 = private unnamed_addr constant [21 x i8] c"Connecting to %s:%d\0A\00", align 1
@.str.13 = private unnamed_addr constant [26 x i8] c"Disconnecting from %s:%d\0A\00", align 1
@_ZNSt3__15ctypeIcE2idE = external global %"class.std::__1::locale::id", align 8

; Function Attrs: mustprogress noinline optnone ssp uwtable
define noundef i32 @_Z20make_server_sockaddrP11sockaddr_ini(%struct.sockaddr_in* noundef %addr, i32 noundef %port) #0 {
entry:
  %addr.addr = alloca %struct.sockaddr_in*, align 8
  %port.addr = alloca i32, align 4
  store %struct.sockaddr_in* %addr, %struct.sockaddr_in** %addr.addr, align 8
  store i32 %port, i32* %port.addr, align 4
  %0 = load %struct.sockaddr_in*, %struct.sockaddr_in** %addr.addr, align 8
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %0, i32 0, i32 1
  store i8 2, i8* %sin_family, align 1
  %1 = load %struct.sockaddr_in*, %struct.sockaddr_in** %addr.addr, align 8
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %1, i32 0, i32 3
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0
  store i32 0, i32* %s_addr, align 4
  %2 = load i32, i32* %port.addr, align 4
  %3 = call i1 @llvm.is.constant.i32(i32 %2)
  br i1 %3, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %4 = load i32, i32* %port.addr, align 4
  %conv = trunc i32 %4 to i16
  %conv1 = zext i16 %conv to i32
  %and = and i32 %conv1, 65280
  %shr = lshr i32 %and, 8
  %5 = load i32, i32* %port.addr, align 4
  %conv2 = trunc i32 %5 to i16
  %conv3 = zext i16 %conv2 to i32
  %and4 = and i32 %conv3, 255
  %shl = shl i32 %and4, 8
  %or = or i32 %shr, %shl
  %conv5 = trunc i32 %or to i16
  br label %cond.end

cond.false:                                       ; preds = %entry
  %6 = load i32, i32* %port.addr, align 4
  %conv6 = trunc i32 %6 to i16
  %call = call noundef zeroext i16 @_ZL12_OSSwapInt16t(i16 noundef zeroext %conv6)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i16 [ %conv5, %cond.true ], [ %call, %cond.false ]
  %7 = load %struct.sockaddr_in*, %struct.sockaddr_in** %addr.addr, align 8
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %7, i32 0, i32 2
  store i16 %cond, i16* %sin_port, align 2
  ret i32 0
}

; Function Attrs: convergent nofree nosync nounwind readnone willreturn
declare i1 @llvm.is.constant.i32(i32) #1

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef zeroext i16 @_ZL12_OSSwapInt16t(i16 noundef zeroext %_data) #2 {
entry:
  %_data.addr = alloca i16, align 2
  store i16 %_data, i16* %_data.addr, align 2
  %0 = load i16, i16* %_data.addr, align 2
  %conv = zext i16 %0 to i32
  %shl = shl i32 %conv, 8
  %1 = load i16, i16* %_data.addr, align 2
  %conv1 = zext i16 %1 to i32
  %shr = ashr i32 %conv1, 8
  %or = or i32 %shl, %shr
  %conv2 = trunc i32 %or to i16
  ret i16 %conv2
}

; Function Attrs: mustprogress noinline optnone ssp uwtable
define noundef i32 @_Z20make_client_sockaddrP11sockaddr_inPKci(%struct.sockaddr_in* noundef %addr, i8* noundef %hostname, i32 noundef %port) #0 {
entry:
  %retval = alloca i32, align 4
  %addr.addr = alloca %struct.sockaddr_in*, align 8
  %hostname.addr = alloca i8*, align 8
  %port.addr = alloca i32, align 4
  %host = alloca %struct.hostent*, align 8
  store %struct.sockaddr_in* %addr, %struct.sockaddr_in** %addr.addr, align 8
  store i8* %hostname, i8** %hostname.addr, align 8
  store i32 %port, i32* %port.addr, align 4
  %0 = load %struct.sockaddr_in*, %struct.sockaddr_in** %addr.addr, align 8
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %0, i32 0, i32 1
  store i8 2, i8* %sin_family, align 1
  %1 = load i8*, i8** %hostname.addr, align 8
  %call = call %struct.hostent* @gethostbyname(i8* noundef %1)
  store %struct.hostent* %call, %struct.hostent** %host, align 8
  %2 = load %struct.hostent*, %struct.hostent** %host, align 8
  %cmp = icmp eq %struct.hostent* %2, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %3 = load %struct.__sFILE*, %struct.__sFILE** @__stderrp, align 8
  %4 = load i8*, i8** %hostname.addr, align 8
  %call1 = call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* noundef %3, i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0), i8* noundef %4)
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %5 = load %struct.sockaddr_in*, %struct.sockaddr_in** %addr.addr, align 8
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %5, i32 0, i32 3
  %6 = bitcast %struct.in_addr* %sin_addr to i8*
  %7 = load %struct.hostent*, %struct.hostent** %host, align 8
  %h_addr_list = getelementptr inbounds %struct.hostent, %struct.hostent* %7, i32 0, i32 4
  %8 = load i8**, i8*** %h_addr_list, align 8
  %arrayidx = getelementptr inbounds i8*, i8** %8, i64 0
  %9 = load i8*, i8** %arrayidx, align 8
  %10 = load %struct.hostent*, %struct.hostent** %host, align 8
  %h_length = getelementptr inbounds %struct.hostent, %struct.hostent* %10, i32 0, i32 3
  %11 = load i32, i32* %h_length, align 4
  %conv = sext i32 %11 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %6, i8* align 1 %9, i64 %conv, i1 false)
  %12 = load i32, i32* %port.addr, align 4
  %13 = call i1 @llvm.is.constant.i32(i32 %12)
  br i1 %13, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end
  %14 = load i32, i32* %port.addr, align 4
  %conv2 = trunc i32 %14 to i16
  %conv3 = zext i16 %conv2 to i32
  %and = and i32 %conv3, 65280
  %shr = lshr i32 %and, 8
  %15 = load i32, i32* %port.addr, align 4
  %conv4 = trunc i32 %15 to i16
  %conv5 = zext i16 %conv4 to i32
  %and6 = and i32 %conv5, 255
  %shl = shl i32 %and6, 8
  %or = or i32 %shr, %shl
  %conv7 = trunc i32 %or to i16
  br label %cond.end

cond.false:                                       ; preds = %if.end
  %16 = load i32, i32* %port.addr, align 4
  %conv8 = trunc i32 %16 to i16
  %call9 = call noundef zeroext i16 @_ZL12_OSSwapInt16t(i16 noundef zeroext %conv8)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i16 [ %conv7, %cond.true ], [ %call9, %cond.false ]
  %17 = load %struct.sockaddr_in*, %struct.sockaddr_in** %addr.addr, align 8
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %17, i32 0, i32 2
  store i16 %cond, i16* %sin_port, align 2
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %cond.end, %if.then
  %18 = load i32, i32* %retval, align 4
  ret i32 %18
}

declare %struct.hostent* @gethostbyname(i8* noundef) #3

declare i32 @fprintf(%struct.__sFILE* noundef, i8* noundef, ...) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: mustprogress noinline optnone ssp uwtable
define noundef i32 @_Z15get_port_numberi(i32 noundef %sockfd) #0 {
entry:
  %retval = alloca i32, align 4
  %sockfd.addr = alloca i32, align 4
  %addr = alloca %struct.sockaddr_in, align 4
  %length = alloca i32, align 4
  store i32 %sockfd, i32* %sockfd.addr, align 4
  store i32 16, i32* %length, align 4
  %0 = load i32, i32* %sockfd.addr, align 4
  %1 = bitcast %struct.sockaddr_in* %addr to %struct.sockaddr*
  %call = call i32 @"\01_getsockname"(i32 noundef %0, %struct.sockaddr* noundef %1, i32* noundef %length)
  %cmp = icmp eq i32 %call, -1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @perror(i8* noundef getelementptr inbounds ([29 x i8], [29 x i8]* @.str.1, i64 0, i64 0)) #11
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %addr, i32 0, i32 2
  %2 = load i16, i16* %sin_port, align 2
  %3 = call i1 @llvm.is.constant.i16(i16 %2)
  br i1 %3, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end
  %sin_port1 = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %addr, i32 0, i32 2
  %4 = load i16, i16* %sin_port1, align 2
  %conv = zext i16 %4 to i32
  %and = and i32 %conv, 65280
  %shr = lshr i32 %and, 8
  %sin_port2 = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %addr, i32 0, i32 2
  %5 = load i16, i16* %sin_port2, align 2
  %conv3 = zext i16 %5 to i32
  %and4 = and i32 %conv3, 255
  %shl = shl i32 %and4, 8
  %or = or i32 %shr, %shl
  %conv5 = trunc i32 %or to i16
  br label %cond.end

cond.false:                                       ; preds = %if.end
  %sin_port6 = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %addr, i32 0, i32 2
  %6 = load i16, i16* %sin_port6, align 2
  %call7 = call noundef zeroext i16 @_ZL12_OSSwapInt16t(i16 noundef zeroext %6)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i16 [ %conv5, %cond.true ], [ %call7, %cond.false ]
  %conv8 = zext i16 %cond to i32
  store i32 %conv8, i32* %retval, align 4
  br label %return

return:                                           ; preds = %cond.end, %if.then
  %7 = load i32, i32* %retval, align 4
  ret i32 %7
}

declare i32 @"\01_getsockname"(i32 noundef, %struct.sockaddr* noundef, i32* noundef) #3

; Function Attrs: cold
declare void @perror(i8* noundef) #5

; Function Attrs: convergent nofree nosync nounwind readnone willreturn
declare i1 @llvm.is.constant.i16(i16) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable
define noundef i32 @_Z12send_messagePKciS0_(i8* noundef %hostname, i32 noundef %port, i8* noundef %message) #0 {
entry:
  %retval = alloca i32, align 4
  %hostname.addr = alloca i8*, align 8
  %port.addr = alloca i32, align 4
  %message.addr = alloca i8*, align 8
  %sockfd = alloca i32, align 4
  %addr = alloca %struct.sockaddr_in, align 4
  %message_len = alloca i64, align 8
  %sent = alloca i64, align 8
  %n = alloca i64, align 8
  store i8* %hostname, i8** %hostname.addr, align 8
  store i32 %port, i32* %port.addr, align 4
  store i8* %message, i8** %message.addr, align 8
  %0 = load i8*, i8** %message.addr, align 8
  %call = call i64 @strlen(i8* noundef %0)
  %cmp = icmp ugt i64 %call, 256
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @perror(i8* noundef getelementptr inbounds ([39 x i8], [39 x i8]* @.str.2, i64 0, i64 0)) #11
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %call1 = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 0)
  store i32 %call1, i32* %sockfd, align 4
  %1 = load i8*, i8** %hostname.addr, align 8
  %2 = load i32, i32* %port.addr, align 4
  %call2 = call noundef i32 @_Z20make_client_sockaddrP11sockaddr_inPKci(%struct.sockaddr_in* noundef %addr, i8* noundef %1, i32 noundef %2)
  %cmp3 = icmp eq i32 %call2, -1
  br i1 %cmp3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  store i32 -1, i32* %retval, align 4
  br label %return

if.end5:                                          ; preds = %if.end
  %3 = load i32, i32* %sockfd, align 4
  %4 = bitcast %struct.sockaddr_in* %addr to %struct.sockaddr*
  %call6 = call i32 @"\01_connect"(i32 noundef %3, %struct.sockaddr* noundef %4, i32 noundef 16)
  %cmp7 = icmp eq i32 %call6, -1
  br i1 %cmp7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end5
  call void @perror(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str.3, i64 0, i64 0)) #11
  store i32 -1, i32* %retval, align 4
  br label %return

if.end9:                                          ; preds = %if.end5
  %5 = load i8*, i8** %message.addr, align 8
  %call10 = call i64 @strlen(i8* noundef %5)
  store i64 %call10, i64* %message_len, align 8
  store i64 0, i64* %sent, align 8
  br label %do.body

do.body:                                          ; preds = %do.cond, %if.end9
  %6 = load i32, i32* %sockfd, align 4
  %7 = load i8*, i8** %message.addr, align 8
  %8 = load i64, i64* %sent, align 8
  %add.ptr = getelementptr inbounds i8, i8* %7, i64 %8
  %9 = load i64, i64* %message_len, align 8
  %10 = load i64, i64* %sent, align 8
  %sub = sub i64 %9, %10
  %call11 = call i64 @"\01_send"(i32 noundef %6, i8* noundef %add.ptr, i64 noundef %sub, i32 noundef 0)
  store i64 %call11, i64* %n, align 8
  %11 = load i64, i64* %n, align 8
  %cmp12 = icmp eq i64 %11, -1
  br i1 %cmp12, label %if.then13, label %if.end14

if.then13:                                        ; preds = %do.body
  call void @perror(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str.4, i64 0, i64 0)) #11
  store i32 -1, i32* %retval, align 4
  br label %return

if.end14:                                         ; preds = %do.body
  %12 = load i64, i64* %n, align 8
  %13 = load i64, i64* %sent, align 8
  %add = add i64 %13, %12
  store i64 %add, i64* %sent, align 8
  br label %do.cond

do.cond:                                          ; preds = %if.end14
  %14 = load i64, i64* %sent, align 8
  %15 = load i64, i64* %message_len, align 8
  %cmp15 = icmp ult i64 %14, %15
  br i1 %cmp15, label %do.body, label %do.end, !llvm.loop !10

do.end:                                           ; preds = %do.cond
  %16 = load i32, i32* %sockfd, align 4
  %call16 = call i32 @"\01_close"(i32 noundef %16)
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %do.end, %if.then13, %if.then8, %if.then4, %if.then
  %17 = load i32, i32* %retval, align 4
  ret i32 %17
}

declare i64 @strlen(i8* noundef) #3

declare i32 @socket(i32 noundef, i32 noundef, i32 noundef) #3

declare i32 @"\01_connect"(i32 noundef, %struct.sockaddr* noundef, i32 noundef) #3

declare i64 @"\01_send"(i32 noundef, i8* noundef, i64 noundef, i32 noundef) #3

declare i32 @"\01_close"(i32 noundef) #3

; Function Attrs: mustprogress noinline optnone ssp uwtable
define noundef i32 @_Z7connectPKciS0_(i8* noundef %hostname, i32 noundef %port, i8* noundef %client_id) #0 {
entry:
  %hostname.addr = alloca i8*, align 8
  %port.addr = alloca i32, align 4
  %client_id.addr = alloca i8*, align 8
  %connect_str = alloca i8*, align 8
  %target = alloca [256 x i8], align 1
  store i8* %hostname, i8** %hostname.addr, align 8
  store i32 %port, i32* %port.addr, align 4
  store i8* %client_id, i8** %client_id.addr, align 8
  store i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.5, i64 0, i64 0), i8** %connect_str, align 8
  %arraydecay = getelementptr inbounds [256 x i8], [256 x i8]* %target, i64 0, i64 0
  %0 = load i8*, i8** %connect_str, align 8
  %call = call i8* @strcpy(i8* noundef %arraydecay, i8* noundef %0)
  %1 = load i8*, i8** %hostname.addr, align 8
  %2 = load i32, i32* %port.addr, align 4
  %arraydecay1 = getelementptr inbounds [256 x i8], [256 x i8]* %target, i64 0, i64 0
  %3 = load i8*, i8** %client_id.addr, align 8
  %call2 = call i8* @strcat(i8* noundef %arraydecay1, i8* noundef %3)
  %call3 = call noundef i32 @_Z12send_messagePKciS0_(i8* noundef %1, i32 noundef %2, i8* noundef %call2)
  ret i32 %call3
}

declare i8* @strcpy(i8* noundef, i8* noundef) #3

declare i8* @strcat(i8* noundef, i8* noundef) #3

; Function Attrs: mustprogress noinline optnone ssp uwtable
define noundef i32 @_Z10disconnectPKciS0_(i8* noundef %hostname, i32 noundef %port, i8* noundef %client_id) #0 {
entry:
  %hostname.addr = alloca i8*, align 8
  %port.addr = alloca i32, align 4
  %client_id.addr = alloca i8*, align 8
  %disconnect_str = alloca i8*, align 8
  %target = alloca [256 x i8], align 1
  store i8* %hostname, i8** %hostname.addr, align 8
  store i32 %port, i32* %port.addr, align 4
  store i8* %client_id, i8** %client_id.addr, align 8
  store i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.6, i64 0, i64 0), i8** %disconnect_str, align 8
  %arraydecay = getelementptr inbounds [256 x i8], [256 x i8]* %target, i64 0, i64 0
  %0 = load i8*, i8** %disconnect_str, align 8
  %call = call i8* @strcpy(i8* noundef %arraydecay, i8* noundef %0)
  %1 = load i8*, i8** %hostname.addr, align 8
  %2 = load i32, i32* %port.addr, align 4
  %arraydecay1 = getelementptr inbounds [256 x i8], [256 x i8]* %target, i64 0, i64 0
  %3 = load i8*, i8** %client_id.addr, align 8
  %call2 = call i8* @strcat(i8* noundef %arraydecay1, i8* noundef %3)
  %call3 = call noundef i32 @_Z12send_messagePKciS0_(i8* noundef %1, i32 noundef %2, i8* noundef %call2)
  ret i32 %call3
}

; Function Attrs: mustprogress noinline norecurse optnone ssp uwtable
define noundef i32 @main(i32 noundef %argc, i8** noundef %argv) #6 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %hostname = alloca i8*, align 8
  %client_id = alloca i8*, align 8
  %port = alloca i32, align 4
  %command = alloca %"class.std::__1::basic_string", align 8
  %exn.slot = alloca i8*, align 8
  %ehselector.slot = alloca i32, align 4
  %message = alloca i8*, align 8
  %cleanup.dest.slot = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %0 = load i32, i32* %argc.addr, align 4
  %cmp = icmp ne i32 %0, 3
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0))
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i8**, i8*** %argv.addr, align 8
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 1
  %2 = load i8*, i8** %arrayidx, align 8
  store i8* %2, i8** %hostname, align 8
  %3 = load i8**, i8*** %argv.addr, align 8
  %arrayidx1 = getelementptr inbounds i8*, i8** %3, i64 2
  %4 = load i8*, i8** %arrayidx1, align 8
  store i8* %4, i8** %client_id, align 8
  br label %while.body

while.body:                                       ; preds = %if.end, %cleanup.cont
  %call2 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0))
  %call3 = call noundef %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1Ev(%"class.std::__1::basic_string"* noundef nonnull align 8 dereferenceable(24) %command) #12
  %call4 = invoke noundef nonnull align 8 dereferenceable(16) %"class.std::__1::basic_istream"* @_ZNSt3__1rsIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS_13basic_istreamIT_T0_EES9_RNS_12basic_stringIS6_S7_T1_EE(%"class.std::__1::basic_istream"* noundef nonnull align 8 dereferenceable(16) @_ZNSt3__13cinE, %"class.std::__1::basic_string"* noundef nonnull align 8 dereferenceable(24) %command)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %while.body
  %call6 = invoke noundef nonnull align 8 dereferenceable(16) %"class.std::__1::basic_istream"* @_ZNSt3__113basic_istreamIcNS_11char_traitsIcEEErsERi(%"class.std::__1::basic_istream"* noundef nonnull align 8 dereferenceable(16) %call4, i32* noundef nonnull align 4 dereferenceable(4) %port)
          to label %invoke.cont5 unwind label %lpad

invoke.cont5:                                     ; preds = %invoke.cont
  %call7 = call noundef i8* @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5c_strEv(%"class.std::__1::basic_string"* noundef nonnull align 8 dereferenceable(24) %command) #12
  store i8* %call7, i8** %message, align 8
  %5 = load i8*, i8** %message, align 8
  %call9 = invoke i32 @strcmp(i8* noundef %5, i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0))
          to label %invoke.cont8 unwind label %lpad

invoke.cont8:                                     ; preds = %invoke.cont5
  %cmp10 = icmp ne i32 %call9, 0
  br i1 %cmp10, label %land.lhs.true, label %if.end17

land.lhs.true:                                    ; preds = %invoke.cont8
  %6 = load i8*, i8** %message, align 8
  %call12 = invoke i32 @strcmp(i8* noundef %6, i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.10, i64 0, i64 0))
          to label %invoke.cont11 unwind label %lpad

invoke.cont11:                                    ; preds = %land.lhs.true
  %cmp13 = icmp ne i32 %call12, 0
  br i1 %cmp13, label %if.then14, label %if.end17

if.then14:                                        ; preds = %invoke.cont11
  %call16 = invoke i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([38 x i8], [38 x i8]* @.str.11, i64 0, i64 0))
          to label %invoke.cont15 unwind label %lpad

invoke.cont15:                                    ; preds = %if.then14
  store i32 1, i32* %retval, align 4
  store i32 1, i32* %cleanup.dest.slot, align 4
  br label %cleanup

lpad:                                             ; preds = %invoke.cont29, %if.else, %invoke.cont22, %if.then21, %if.end17, %if.then14, %land.lhs.true, %invoke.cont5, %invoke.cont, %while.body
  %7 = landingpad { i8*, i32 }
          cleanup
  %8 = extractvalue { i8*, i32 } %7, 0
  store i8* %8, i8** %exn.slot, align 8
  %9 = extractvalue { i8*, i32 } %7, 1
  store i32 %9, i32* %ehselector.slot, align 4
  %call38 = call noundef %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(%"class.std::__1::basic_string"* noundef nonnull align 8 dereferenceable(24) %command) #12
  br label %eh.resume

if.end17:                                         ; preds = %invoke.cont11, %invoke.cont8
  %10 = load i8*, i8** %message, align 8
  %call19 = invoke i32 @strcmp(i8* noundef %10, i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0))
          to label %invoke.cont18 unwind label %lpad

invoke.cont18:                                    ; preds = %if.end17
  %cmp20 = icmp eq i32 %call19, 0
  br i1 %cmp20, label %if.then21, label %if.else

if.then21:                                        ; preds = %invoke.cont18
  %11 = load i8*, i8** %hostname, align 8
  %12 = load i32, i32* %port, align 4
  %call23 = invoke i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.12, i64 0, i64 0), i8* noundef %11, i32 noundef %12)
          to label %invoke.cont22 unwind label %lpad

invoke.cont22:                                    ; preds = %if.then21
  %13 = load i8*, i8** %hostname, align 8
  %14 = load i32, i32* %port, align 4
  %15 = load i8*, i8** %client_id, align 8
  %call25 = invoke noundef i32 @_Z7connectPKciS0_(i8* noundef %13, i32 noundef %14, i8* noundef %15)
          to label %invoke.cont24 unwind label %lpad

invoke.cont24:                                    ; preds = %invoke.cont22
  %cmp26 = icmp eq i32 %call25, -1
  br i1 %cmp26, label %if.then27, label %if.end28

if.then27:                                        ; preds = %invoke.cont24
  store i32 1, i32* %retval, align 4
  store i32 1, i32* %cleanup.dest.slot, align 4
  br label %cleanup

if.end28:                                         ; preds = %invoke.cont24
  br label %if.end36

if.else:                                          ; preds = %invoke.cont18
  %16 = load i8*, i8** %hostname, align 8
  %17 = load i32, i32* %port, align 4
  %call30 = invoke i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([26 x i8], [26 x i8]* @.str.13, i64 0, i64 0), i8* noundef %16, i32 noundef %17)
          to label %invoke.cont29 unwind label %lpad

invoke.cont29:                                    ; preds = %if.else
  %18 = load i8*, i8** %hostname, align 8
  %19 = load i32, i32* %port, align 4
  %20 = load i8*, i8** %client_id, align 8
  %call32 = invoke noundef i32 @_Z10disconnectPKciS0_(i8* noundef %18, i32 noundef %19, i8* noundef %20)
          to label %invoke.cont31 unwind label %lpad

invoke.cont31:                                    ; preds = %invoke.cont29
  %cmp33 = icmp eq i32 %call32, -1
  br i1 %cmp33, label %if.then34, label %if.end35

if.then34:                                        ; preds = %invoke.cont31
  store i32 1, i32* %retval, align 4
  store i32 1, i32* %cleanup.dest.slot, align 4
  br label %cleanup

if.end35:                                         ; preds = %invoke.cont31
  br label %if.end36

if.end36:                                         ; preds = %if.end35, %if.end28
  store i32 0, i32* %cleanup.dest.slot, align 4
  br label %cleanup

cleanup:                                          ; preds = %if.end36, %if.then34, %if.then27, %invoke.cont15
  %call37 = call noundef %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(%"class.std::__1::basic_string"* noundef nonnull align 8 dereferenceable(24) %command) #12
  %cleanup.dest = load i32, i32* %cleanup.dest.slot, align 4
  switch i32 %cleanup.dest, label %unreachable [
    i32 0, label %cleanup.cont
    i32 1, label %return
  ]

cleanup.cont:                                     ; preds = %cleanup
  br label %while.body, !llvm.loop !12

return:                                           ; preds = %cleanup, %if.then
  %21 = load i32, i32* %retval, align 4
  ret i32 %21

eh.resume:                                        ; preds = %lpad
  %exn = load i8*, i8** %exn.slot, align 8
  %sel = load i32, i32* %ehselector.slot, align 4
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn, 0
  %lpad.val39 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1
  resume { i8*, i32 } %lpad.val39

unreachable:                                      ; preds = %cleanup
  unreachable
}

declare i32 @printf(i8* noundef, ...) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal noundef %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1Ev(%"class.std::__1::basic_string"* noundef nonnull returned align 8 dereferenceable(24) %this) unnamed_addr #7 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::basic_string"*, align 8
  store %"class.std::__1::basic_string"* %this, %"class.std::__1::basic_string"** %this.addr, align 8
  %this1 = load %"class.std::__1::basic_string"*, %"class.std::__1::basic_string"** %this.addr, align 8
  %call = call noundef %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2Ev(%"class.std::__1::basic_string"* noundef nonnull align 8 dereferenceable(24) %this1) #12
  ret %"class.std::__1::basic_string"* %this1
}

; Function Attrs: mustprogress noinline optnone ssp uwtable
define linkonce_odr noundef nonnull align 8 dereferenceable(16) %"class.std::__1::basic_istream"* @_ZNSt3__1rsIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS_13basic_istreamIT_T0_EES9_RNS_12basic_stringIS6_S7_T1_EE(%"class.std::__1::basic_istream"* noundef nonnull align 8 dereferenceable(16) %__is, %"class.std::__1::basic_string"* noundef nonnull align 8 dereferenceable(24) %__str) #0 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %__is.addr = alloca %"class.std::__1::basic_istream"*, align 8
  %__str.addr = alloca %"class.std::__1::basic_string"*, align 8
  %__state = alloca i32, align 4
  %__sen = alloca %"class.std::__1::basic_istream<char>::sentry", align 1
  %__n = alloca i64, align 8
  %exn.slot = alloca i8*, align 8
  %ehselector.slot = alloca i32, align 4
  %__c = alloca i64, align 8
  %__ct = alloca %"class.std::__1::ctype"*, align 8
  %ref.tmp = alloca %"class.std::__1::locale", align 8
  %__i = alloca i32, align 4
  %__ch = alloca i8, align 1
  store %"class.std::__1::basic_istream"* %__is, %"class.std::__1::basic_istream"** %__is.addr, align 8
  store %"class.std::__1::basic_string"* %__str, %"class.std::__1::basic_string"** %__str.addr, align 8
  store i32 0, i32* %__state, align 4
  %0 = load %"class.std::__1::basic_istream"*, %"class.std::__1::basic_istream"** %__is.addr, align 8
  %call = call noundef %"class.std::__1::basic_istream<char>::sentry"* @_ZNSt3__113basic_istreamIcNS_11char_traitsIcEEE6sentryC1ERS3_b(%"class.std::__1::basic_istream<char>::sentry"* noundef nonnull align 1 dereferenceable(1) %__sen, %"class.std::__1::basic_istream"* noundef nonnull align 8 dereferenceable(16) %0, i1 noundef zeroext false)
  %call1 = call noundef zeroext i1 @_ZNKSt3__113basic_istreamIcNS_11char_traitsIcEEE6sentrycvbEv(%"class.std::__1::basic_istream<char>::sentry"* noundef nonnull align 1 dereferenceable(1) %__sen)
  br i1 %call1, label %if.then, label %if.end76

if.then:                                          ; preds = %entry
  %1 = load %"class.std::__1::basic_string"*, %"class.std::__1::basic_string"** %__str.addr, align 8
  call void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5clearEv(%"class.std::__1::basic_string"* noundef nonnull align 8 dereferenceable(24) %1) #12
  %2 = load %"class.std::__1::basic_istream"*, %"class.std::__1::basic_istream"** %__is.addr, align 8
  %3 = bitcast %"class.std::__1::basic_istream"* %2 to i8**
  %vtable = load i8*, i8** %3, align 8
  %vbase.offset.ptr = getelementptr i8, i8* %vtable, i64 -24
  %4 = bitcast i8* %vbase.offset.ptr to i64*
  %vbase.offset = load i64, i64* %4, align 8
  %5 = bitcast %"class.std::__1::basic_istream"* %2 to i8*
  %add.ptr = getelementptr inbounds i8, i8* %5, i64 %vbase.offset
  %6 = bitcast i8* %add.ptr to %"class.std::__1::ios_base"*
  %call2 = invoke noundef i64 @_ZNKSt3__18ios_base5widthEv(%"class.std::__1::ios_base"* noundef nonnull align 8 dereferenceable(136) %6)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %if.then
  store i64 %call2, i64* %__n, align 8
  %7 = load i64, i64* %__n, align 8
  %cmp = icmp sle i64 %7, 0
  br i1 %cmp, label %if.then3, label %if.end

if.then3:                                         ; preds = %invoke.cont
  %8 = load %"class.std::__1::basic_string"*, %"class.std::__1::basic_string"** %__str.addr, align 8
  %call4 = call noundef i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE8max_sizeEv(%"class.std::__1::basic_string"* noundef nonnull align 8 dereferenceable(24) %8) #12
  store i64 %call4, i64* %__n, align 8
  br label %if.end

lpad:                                             ; preds = %while.end, %invoke.cont42, %invoke.cont37, %if.end36, %if.end31, %invoke.cont24, %while.body, %if.end8, %if.then
  %9 = landingpad { i8*, i32 }
          catch i8* null
  %10 = extractvalue { i8*, i32 } %9, 0
  store i8* %10, i8** %exn.slot, align 8
  %11 = extractvalue { i8*, i32 } %9, 1
  store i32 %11, i32* %ehselector.slot, align 4
  br label %catch

if.end:                                           ; preds = %if.then3, %invoke.cont
  %12 = load i64, i64* %__n, align 8
  %cmp5 = icmp sle i64 %12, 0
  br i1 %cmp5, label %if.then6, label %if.end8

if.then6:                                         ; preds = %if.end
  %call7 = call noundef i64 @_ZNSt3__114numeric_limitsIlE3maxEv() #12
  store i64 %call7, i64* %__n, align 8
  br label %if.end8

if.end8:                                          ; preds = %if.then6, %if.end
  store i64 0, i64* %__c, align 8
  %13 = load %"class.std::__1::basic_istream"*, %"class.std::__1::basic_istream"** %__is.addr, align 8
  %14 = bitcast %"class.std::__1::basic_istream"* %13 to i8**
  %vtable9 = load i8*, i8** %14, align 8
  %vbase.offset.ptr10 = getelementptr i8, i8* %vtable9, i64 -24
  %15 = bitcast i8* %vbase.offset.ptr10 to i64*
  %vbase.offset11 = load i64, i64* %15, align 8
  %16 = bitcast %"class.std::__1::basic_istream"* %13 to i8*
  %add.ptr12 = getelementptr inbounds i8, i8* %16, i64 %vbase.offset11
  %17 = bitcast i8* %add.ptr12 to %"class.std::__1::ios_base"*
  invoke void @_ZNKSt3__18ios_base6getlocEv(%"class.std::__1::locale"* sret(%"class.std::__1::locale") align 8 %ref.tmp, %"class.std::__1::ios_base"* noundef nonnull align 8 dereferenceable(136) %17)
          to label %invoke.cont13 unwind label %lpad

invoke.cont13:                                    ; preds = %if.end8
  %call16 = invoke noundef nonnull align 8 dereferenceable(25) %"class.std::__1::ctype"* @_ZNSt3__1L9use_facetINS_5ctypeIcEEEERKT_RKNS_6localeE(%"class.std::__1::locale"* noundef nonnull align 8 dereferenceable(8) %ref.tmp)
          to label %invoke.cont15 unwind label %lpad14

invoke.cont15:                                    ; preds = %invoke.cont13
  %call17 = call noundef %"class.std::__1::locale"* @_ZNSt3__16localeD1Ev(%"class.std::__1::locale"* noundef nonnull align 8 dereferenceable(8) %ref.tmp) #12
  store %"class.std::__1::ctype"* %call16, %"class.std::__1::ctype"** %__ct, align 8
  br label %while.cond

while.cond:                                       ; preds = %invoke.cont44, %invoke.cont15
  %18 = load i64, i64* %__c, align 8
  %19 = load i64, i64* %__n, align 8
  %cmp19 = icmp slt i64 %18, %19
  br i1 %cmp19, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %20 = load %"class.std::__1::basic_istream"*, %"class.std::__1::basic_istream"** %__is.addr, align 8
  %21 = bitcast %"class.std::__1::basic_istream"* %20 to i8**
  %vtable20 = load i8*, i8** %21, align 8
  %vbase.offset.ptr21 = getelementptr i8, i8* %vtable20, i64 -24
  %22 = bitcast i8* %vbase.offset.ptr21 to i64*
  %vbase.offset22 = load i64, i64* %22, align 8
  %23 = bitcast %"class.std::__1::basic_istream"* %20 to i8*
  %add.ptr23 = getelementptr inbounds i8, i8* %23, i64 %vbase.offset22
  %24 = bitcast i8* %add.ptr23 to %"class.std::__1::basic_ios"*
  %call25 = invoke noundef %"class.std::__1::basic_streambuf"* @_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5rdbufEv(%"class.std::__1::basic_ios"* noundef nonnull align 8 dereferenceable(148) %24)
          to label %invoke.cont24 unwind label %lpad

invoke.cont24:                                    ; preds = %while.body
  %call27 = invoke noundef i32 @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5sgetcEv(%"class.std::__1::basic_streambuf"* noundef nonnull align 8 dereferenceable(64) %call25)
          to label %invoke.cont26 unwind label %lpad

invoke.cont26:                                    ; preds = %invoke.cont24
  store i32 %call27, i32* %__i, align 4
  %25 = load i32, i32* %__i, align 4
  %call28 = call noundef i32 @_ZNSt3__111char_traitsIcE3eofEv() #12
  %call29 = call noundef zeroext i1 @_ZNSt3__111char_traitsIcE11eq_int_typeEii(i32 noundef %25, i32 noundef %call28) #12
  br i1 %call29, label %if.then30, label %if.end31

if.then30:                                        ; preds = %invoke.cont26
  %26 = load i32, i32* %__state, align 4
  %or = or i32 %26, 2
  store i32 %or, i32* %__state, align 4
  br label %while.end

lpad14:                                           ; preds = %invoke.cont13
  %27 = landingpad { i8*, i32 }
          catch i8* null
  %28 = extractvalue { i8*, i32 } %27, 0
  store i8* %28, i8** %exn.slot, align 8
  %29 = extractvalue { i8*, i32 } %27, 1
  store i32 %29, i32* %ehselector.slot, align 4
  %call18 = call noundef %"class.std::__1::locale"* @_ZNSt3__16localeD1Ev(%"class.std::__1::locale"* noundef nonnull align 8 dereferenceable(8) %ref.tmp) #12
  br label %catch

catch:                                            ; preds = %lpad14, %lpad
  %exn = load i8*, i8** %exn.slot, align 8
  %30 = call i8* @__cxa_begin_catch(i8* %exn) #12
  %31 = load i32, i32* %__state, align 4
  %or56 = or i32 %31, 1
  store i32 %or56, i32* %__state, align 4
  %32 = load %"class.std::__1::basic_istream"*, %"class.std::__1::basic_istream"** %__is.addr, align 8
  %33 = bitcast %"class.std::__1::basic_istream"* %32 to i8**
  %vtable57 = load i8*, i8** %33, align 8
  %vbase.offset.ptr58 = getelementptr i8, i8* %vtable57, i64 -24
  %34 = bitcast i8* %vbase.offset.ptr58 to i64*
  %vbase.offset59 = load i64, i64* %34, align 8
  %35 = bitcast %"class.std::__1::basic_istream"* %32 to i8*
  %add.ptr60 = getelementptr inbounds i8, i8* %35, i64 %vbase.offset59
  %36 = bitcast i8* %add.ptr60 to %"class.std::__1::ios_base"*
  %37 = load i32, i32* %__state, align 4
  invoke void @_ZNSt3__18ios_base18__setstate_nothrowEj(%"class.std::__1::ios_base"* noundef nonnull align 8 dereferenceable(136) %36, i32 noundef %37)
          to label %invoke.cont62 unwind label %lpad61

invoke.cont62:                                    ; preds = %catch
  %38 = load %"class.std::__1::basic_istream"*, %"class.std::__1::basic_istream"** %__is.addr, align 8
  %39 = bitcast %"class.std::__1::basic_istream"* %38 to i8**
  %vtable63 = load i8*, i8** %39, align 8
  %vbase.offset.ptr64 = getelementptr i8, i8* %vtable63, i64 -24
  %40 = bitcast i8* %vbase.offset.ptr64 to i64*
  %vbase.offset65 = load i64, i64* %40, align 8
  %41 = bitcast %"class.std::__1::basic_istream"* %38 to i8*
  %add.ptr66 = getelementptr inbounds i8, i8* %41, i64 %vbase.offset65
  %42 = bitcast i8* %add.ptr66 to %"class.std::__1::basic_ios"*
  %call68 = invoke noundef i32 @_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE10exceptionsEv(%"class.std::__1::basic_ios"* noundef nonnull align 8 dereferenceable(148) %42)
          to label %invoke.cont67 unwind label %lpad61

invoke.cont67:                                    ; preds = %invoke.cont62
  %and = and i32 %call68, 1
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then69, label %if.end70

if.then69:                                        ; preds = %invoke.cont67
  invoke void @__cxa_rethrow() #13
          to label %unreachable unwind label %lpad61

if.end31:                                         ; preds = %invoke.cont26
  %43 = load i32, i32* %__i, align 4
  %call32 = call noundef signext i8 @_ZNSt3__111char_traitsIcE12to_char_typeEi(i32 noundef %43) #12
  store i8 %call32, i8* %__ch, align 1
  %44 = load %"class.std::__1::ctype"*, %"class.std::__1::ctype"** %__ct, align 8
  %45 = load %"class.std::__1::ctype"*, %"class.std::__1::ctype"** %__ct, align 8
  %46 = load i8, i8* %__ch, align 1
  %call34 = invoke noundef zeroext i1 @_ZNKSt3__15ctypeIcE2isEjc(%"class.std::__1::ctype"* noundef nonnull align 8 dereferenceable(25) %44, i32 noundef 16384, i8 noundef signext %46)
          to label %invoke.cont33 unwind label %lpad

invoke.cont33:                                    ; preds = %if.end31
  br i1 %call34, label %if.then35, label %if.end36

if.then35:                                        ; preds = %invoke.cont33
  br label %while.end

if.end36:                                         ; preds = %invoke.cont33
  %47 = load %"class.std::__1::basic_string"*, %"class.std::__1::basic_string"** %__str.addr, align 8
  %48 = load i8, i8* %__ch, align 1
  invoke void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9push_backEc(%"class.std::__1::basic_string"* noundef nonnull align 8 dereferenceable(24) %47, i8 noundef signext %48)
          to label %invoke.cont37 unwind label %lpad

invoke.cont37:                                    ; preds = %if.end36
  %49 = load i64, i64* %__c, align 8
  %inc = add nsw i64 %49, 1
  store i64 %inc, i64* %__c, align 8
  %50 = load %"class.std::__1::basic_istream"*, %"class.std::__1::basic_istream"** %__is.addr, align 8
  %51 = bitcast %"class.std::__1::basic_istream"* %50 to i8**
  %vtable38 = load i8*, i8** %51, align 8
  %vbase.offset.ptr39 = getelementptr i8, i8* %vtable38, i64 -24
  %52 = bitcast i8* %vbase.offset.ptr39 to i64*
  %vbase.offset40 = load i64, i64* %52, align 8
  %53 = bitcast %"class.std::__1::basic_istream"* %50 to i8*
  %add.ptr41 = getelementptr inbounds i8, i8* %53, i64 %vbase.offset40
  %54 = bitcast i8* %add.ptr41 to %"class.std::__1::basic_ios"*
  %call43 = invoke noundef %"class.std::__1::basic_streambuf"* @_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5rdbufEv(%"class.std::__1::basic_ios"* noundef nonnull align 8 dereferenceable(148) %54)
          to label %invoke.cont42 unwind label %lpad

invoke.cont42:                                    ; preds = %invoke.cont37
  %call45 = invoke noundef i32 @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE6sbumpcEv(%"class.std::__1::basic_streambuf"* noundef nonnull align 8 dereferenceable(64) %call43)
          to label %invoke.cont44 unwind label %lpad

invoke.cont44:                                    ; preds = %invoke.cont42
  br label %while.cond, !llvm.loop !13

while.end:                                        ; preds = %if.then35, %if.then30, %while.cond
  %55 = load %"class.std::__1::basic_istream"*, %"class.std::__1::basic_istream"** %__is.addr, align 8
  %56 = bitcast %"class.std::__1::basic_istream"* %55 to i8**
  %vtable46 = load i8*, i8** %56, align 8
  %vbase.offset.ptr47 = getelementptr i8, i8* %vtable46, i64 -24
  %57 = bitcast i8* %vbase.offset.ptr47 to i64*
  %vbase.offset48 = load i64, i64* %57, align 8
  %58 = bitcast %"class.std::__1::basic_istream"* %55 to i8*
  %add.ptr49 = getelementptr inbounds i8, i8* %58, i64 %vbase.offset48
  %59 = bitcast i8* %add.ptr49 to %"class.std::__1::ios_base"*
  %call51 = invoke noundef i64 @_ZNSt3__18ios_base5widthEl(%"class.std::__1::ios_base"* noundef nonnull align 8 dereferenceable(136) %59, i64 noundef 0)
          to label %invoke.cont50 unwind label %lpad

invoke.cont50:                                    ; preds = %while.end
  %60 = load i64, i64* %__c, align 8
  %cmp52 = icmp eq i64 %60, 0
  br i1 %cmp52, label %if.then53, label %if.end55

if.then53:                                        ; preds = %invoke.cont50
  %61 = load i32, i32* %__state, align 4
  %or54 = or i32 %61, 4
  store i32 %or54, i32* %__state, align 4
  br label %if.end55

if.end55:                                         ; preds = %if.then53, %invoke.cont50
  br label %try.cont

lpad61:                                           ; preds = %if.then69, %invoke.cont62, %catch
  %62 = landingpad { i8*, i32 }
          cleanup
  %63 = extractvalue { i8*, i32 } %62, 0
  store i8* %63, i8** %exn.slot, align 8
  %64 = extractvalue { i8*, i32 } %62, 1
  store i32 %64, i32* %ehselector.slot, align 4
  invoke void @__cxa_end_catch()
          to label %invoke.cont71 unwind label %terminate.lpad

if.end70:                                         ; preds = %invoke.cont67
  call void @__cxa_end_catch()
  br label %try.cont

try.cont:                                         ; preds = %if.end70, %if.end55
  %65 = load %"class.std::__1::basic_istream"*, %"class.std::__1::basic_istream"** %__is.addr, align 8
  %66 = bitcast %"class.std::__1::basic_istream"* %65 to i8**
  %vtable72 = load i8*, i8** %66, align 8
  %vbase.offset.ptr73 = getelementptr i8, i8* %vtable72, i64 -24
  %67 = bitcast i8* %vbase.offset.ptr73 to i64*
  %vbase.offset74 = load i64, i64* %67, align 8
  %68 = bitcast %"class.std::__1::basic_istream"* %65 to i8*
  %add.ptr75 = getelementptr inbounds i8, i8* %68, i64 %vbase.offset74
  %69 = bitcast i8* %add.ptr75 to %"class.std::__1::basic_ios"*
  %70 = load i32, i32* %__state, align 4
  call void @_ZNSt3__19basic_iosIcNS_11char_traitsIcEEE8setstateEj(%"class.std::__1::basic_ios"* noundef nonnull align 8 dereferenceable(148) %69, i32 noundef %70)
  br label %if.end76

invoke.cont71:                                    ; preds = %lpad61
  br label %eh.resume

if.end76:                                         ; preds = %try.cont, %entry
  %71 = load %"class.std::__1::basic_istream"*, %"class.std::__1::basic_istream"** %__is.addr, align 8
  ret %"class.std::__1::basic_istream"* %71

eh.resume:                                        ; preds = %invoke.cont71
  %exn77 = load i8*, i8** %exn.slot, align 8
  %sel = load i32, i32* %ehselector.slot, align 4
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn77, 0
  %lpad.val78 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1
  resume { i8*, i32 } %lpad.val78

terminate.lpad:                                   ; preds = %lpad61
  %72 = landingpad { i8*, i32 }
          catch i8* null
  %73 = extractvalue { i8*, i32 } %72, 0
  call void @__clang_call_terminate(i8* %73) #14
  unreachable

unreachable:                                      ; preds = %if.then69
  unreachable
}

declare i32 @__gxx_personality_v0(...)

declare noundef nonnull align 8 dereferenceable(16) %"class.std::__1::basic_istream"* @_ZNSt3__113basic_istreamIcNS_11char_traitsIcEEErsERi(%"class.std::__1::basic_istream"* noundef nonnull align 8 dereferenceable(16), i32* noundef nonnull align 4 dereferenceable(4)) #3

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef i8* @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5c_strEv(%"class.std::__1::basic_string"* noundef nonnull align 8 dereferenceable(24) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::basic_string"*, align 8
  store %"class.std::__1::basic_string"* %this, %"class.std::__1::basic_string"** %this.addr, align 8
  %this1 = load %"class.std::__1::basic_string"*, %"class.std::__1::basic_string"** %this.addr, align 8
  %call = call noundef i8* @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataEv(%"class.std::__1::basic_string"* noundef nonnull align 8 dereferenceable(24) %this1) #12
  ret i8* %call
}

declare i32 @strcmp(i8* noundef, i8* noundef) #3

; Function Attrs: nounwind
declare noundef %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(%"class.std::__1::basic_string"* noundef nonnull returned align 8 dereferenceable(24)) unnamed_addr #8

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal noundef %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2Ev(%"class.std::__1::basic_string"* noundef nonnull returned align 8 dereferenceable(24) %this) unnamed_addr #7 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %this.addr = alloca %"class.std::__1::basic_string"*, align 8
  %ref.tmp = alloca %"struct.std::__1::__default_init_tag", align 1
  %ref.tmp2 = alloca %"struct.std::__1::__default_init_tag", align 1
  store %"class.std::__1::basic_string"* %this, %"class.std::__1::basic_string"** %this.addr, align 8
  %this1 = load %"class.std::__1::basic_string"*, %"class.std::__1::basic_string"** %this.addr, align 8
  %0 = bitcast %"class.std::__1::basic_string"* %this1 to %"class.std::__1::__basic_string_common"*
  %__r_ = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %this1, i32 0, i32 0
  %call = invoke noundef %"class.std::__1::__compressed_pair"* @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_EC1INS_18__default_init_tagESA_EEOT_OT0_(%"class.std::__1::__compressed_pair"* noundef nonnull align 8 dereferenceable(24) %__r_, %"struct.std::__1::__default_init_tag"* noundef nonnull align 1 dereferenceable(1) %ref.tmp, %"struct.std::__1::__default_init_tag"* noundef nonnull align 1 dereferenceable(1) %ref.tmp2)
          to label %invoke.cont unwind label %terminate.lpad

invoke.cont:                                      ; preds = %entry
  call void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6__zeroEv(%"class.std::__1::basic_string"* noundef nonnull align 8 dereferenceable(24) %this1) #12
  ret %"class.std::__1::basic_string"* %this1

terminate.lpad:                                   ; preds = %entry
  %1 = landingpad { i8*, i32 }
          catch i8* null
  %2 = extractvalue { i8*, i32 } %1, 0
  call void @__clang_call_terminate(i8* %2) #14
  unreachable
}

; Function Attrs: noinline optnone ssp uwtable
define internal noundef %"class.std::__1::__compressed_pair"* @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_EC1INS_18__default_init_tagESA_EEOT_OT0_(%"class.std::__1::__compressed_pair"* noundef nonnull returned align 8 dereferenceable(24) %this, %"struct.std::__1::__default_init_tag"* noundef nonnull align 1 dereferenceable(1) %__t1, %"struct.std::__1::__default_init_tag"* noundef nonnull align 1 dereferenceable(1) %__t2) unnamed_addr #9 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::__compressed_pair"*, align 8
  %__t1.addr = alloca %"struct.std::__1::__default_init_tag"*, align 8
  %__t2.addr = alloca %"struct.std::__1::__default_init_tag"*, align 8
  store %"class.std::__1::__compressed_pair"* %this, %"class.std::__1::__compressed_pair"** %this.addr, align 8
  store %"struct.std::__1::__default_init_tag"* %__t1, %"struct.std::__1::__default_init_tag"** %__t1.addr, align 8
  store %"struct.std::__1::__default_init_tag"* %__t2, %"struct.std::__1::__default_init_tag"** %__t2.addr, align 8
  %this1 = load %"class.std::__1::__compressed_pair"*, %"class.std::__1::__compressed_pair"** %this.addr, align 8
  %0 = load %"struct.std::__1::__default_init_tag"*, %"struct.std::__1::__default_init_tag"** %__t1.addr, align 8
  %1 = load %"struct.std::__1::__default_init_tag"*, %"struct.std::__1::__default_init_tag"** %__t2.addr, align 8
  %call = call noundef %"class.std::__1::__compressed_pair"* @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_EC2INS_18__default_init_tagESA_EEOT_OT0_(%"class.std::__1::__compressed_pair"* noundef nonnull align 8 dereferenceable(24) %this1, %"struct.std::__1::__default_init_tag"* noundef nonnull align 1 dereferenceable(1) %0, %"struct.std::__1::__default_init_tag"* noundef nonnull align 1 dereferenceable(1) %1)
  ret %"class.std::__1::__compressed_pair"* %this1
}

; Function Attrs: noinline noreturn nounwind
define linkonce_odr hidden void @__clang_call_terminate(i8* %0) #10 {
  %2 = call i8* @__cxa_begin_catch(i8* %0) #12
  call void @_ZSt9terminatev() #14
  unreachable
}

declare i8* @__cxa_begin_catch(i8*)

declare void @_ZSt9terminatev()

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6__zeroEv(%"class.std::__1::basic_string"* noundef nonnull align 8 dereferenceable(24) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::basic_string"*, align 8
  %__a = alloca [3 x i64]*, align 8
  %__i = alloca i32, align 4
  store %"class.std::__1::basic_string"* %this, %"class.std::__1::basic_string"** %this.addr, align 8
  %this1 = load %"class.std::__1::basic_string"*, %"class.std::__1::basic_string"** %this.addr, align 8
  %__r_ = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %this1, i32 0, i32 0
  %call = call noundef nonnull align 8 dereferenceable(24) %"struct.std::__1::basic_string<char>::__rep"* @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstEv(%"class.std::__1::__compressed_pair"* noundef nonnull align 8 dereferenceable(24) %__r_) #12
  %0 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__rep", %"struct.std::__1::basic_string<char>::__rep"* %call, i32 0, i32 0
  %__r = bitcast %union.anon* %0 to %"struct.std::__1::basic_string<char>::__raw"*
  %__words = getelementptr inbounds %"struct.std::__1::basic_string<char>::__raw", %"struct.std::__1::basic_string<char>::__raw"* %__r, i32 0, i32 0
  store [3 x i64]* %__words, [3 x i64]** %__a, align 8
  store i32 0, i32* %__i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %__i, align 4
  %cmp = icmp ult i32 %1, 3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load [3 x i64]*, [3 x i64]** %__a, align 8
  %3 = load i32, i32* %__i, align 4
  %idxprom = zext i32 %3 to i64
  %arrayidx = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 %idxprom
  store i64 0, i64* %arrayidx, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %__i, align 4
  %inc = add i32 %4, 1
  store i32 %inc, i32* %__i, align 4
  br label %for.cond, !llvm.loop !14

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: noinline optnone ssp uwtable
define internal noundef %"class.std::__1::__compressed_pair"* @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_EC2INS_18__default_init_tagESA_EEOT_OT0_(%"class.std::__1::__compressed_pair"* noundef nonnull returned align 8 dereferenceable(24) %this, %"struct.std::__1::__default_init_tag"* noundef nonnull align 1 dereferenceable(1) %__t1, %"struct.std::__1::__default_init_tag"* noundef nonnull align 1 dereferenceable(1) %__t2) unnamed_addr #9 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::__compressed_pair"*, align 8
  %__t1.addr = alloca %"struct.std::__1::__default_init_tag"*, align 8
  %__t2.addr = alloca %"struct.std::__1::__default_init_tag"*, align 8
  %agg.tmp = alloca %"struct.std::__1::__default_init_tag", align 1
  %agg.tmp3 = alloca %"struct.std::__1::__default_init_tag", align 1
  store %"class.std::__1::__compressed_pair"* %this, %"class.std::__1::__compressed_pair"** %this.addr, align 8
  store %"struct.std::__1::__default_init_tag"* %__t1, %"struct.std::__1::__default_init_tag"** %__t1.addr, align 8
  store %"struct.std::__1::__default_init_tag"* %__t2, %"struct.std::__1::__default_init_tag"** %__t2.addr, align 8
  %this1 = load %"class.std::__1::__compressed_pair"*, %"class.std::__1::__compressed_pair"** %this.addr, align 8
  %0 = bitcast %"class.std::__1::__compressed_pair"* %this1 to %"struct.std::__1::__compressed_pair_elem"*
  %1 = load %"struct.std::__1::__default_init_tag"*, %"struct.std::__1::__default_init_tag"** %__t1.addr, align 8
  %call = call noundef nonnull align 1 dereferenceable(1) %"struct.std::__1::__default_init_tag"* @_ZNSt3__1L7forwardINS_18__default_init_tagEEEOT_RNS_16remove_referenceIS2_E4typeE(%"struct.std::__1::__default_init_tag"* noundef nonnull align 1 dereferenceable(1) %1) #12
  %call2 = call noundef %"struct.std::__1::__compressed_pair_elem"* @_ZNSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EEC2ENS_18__default_init_tagE(%"struct.std::__1::__compressed_pair_elem"* noundef nonnull align 8 dereferenceable(24) %0)
  %2 = bitcast %"class.std::__1::__compressed_pair"* %this1 to %"struct.std::__1::__compressed_pair_elem.0"*
  %3 = load %"struct.std::__1::__default_init_tag"*, %"struct.std::__1::__default_init_tag"** %__t2.addr, align 8
  %call4 = call noundef nonnull align 1 dereferenceable(1) %"struct.std::__1::__default_init_tag"* @_ZNSt3__1L7forwardINS_18__default_init_tagEEEOT_RNS_16remove_referenceIS2_E4typeE(%"struct.std::__1::__default_init_tag"* noundef nonnull align 1 dereferenceable(1) %3) #12
  %call5 = call noundef %"struct.std::__1::__compressed_pair_elem.0"* @_ZNSt3__122__compressed_pair_elemINS_9allocatorIcEELi1ELb1EEC2ENS_18__default_init_tagE(%"struct.std::__1::__compressed_pair_elem.0"* noundef nonnull align 1 dereferenceable(1) %2)
  ret %"class.std::__1::__compressed_pair"* %this1
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef nonnull align 1 dereferenceable(1) %"struct.std::__1::__default_init_tag"* @_ZNSt3__1L7forwardINS_18__default_init_tagEEEOT_RNS_16remove_referenceIS2_E4typeE(%"struct.std::__1::__default_init_tag"* noundef nonnull align 1 dereferenceable(1) %__t) #2 {
entry:
  %__t.addr = alloca %"struct.std::__1::__default_init_tag"*, align 8
  store %"struct.std::__1::__default_init_tag"* %__t, %"struct.std::__1::__default_init_tag"** %__t.addr, align 8
  %0 = load %"struct.std::__1::__default_init_tag"*, %"struct.std::__1::__default_init_tag"** %__t.addr, align 8
  ret %"struct.std::__1::__default_init_tag"* %0
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal noundef %"struct.std::__1::__compressed_pair_elem"* @_ZNSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EEC2ENS_18__default_init_tagE(%"struct.std::__1::__compressed_pair_elem"* noundef nonnull returned align 8 dereferenceable(24) %this) unnamed_addr #7 align 2 {
entry:
  %0 = alloca %"struct.std::__1::__default_init_tag", align 1
  %this.addr = alloca %"struct.std::__1::__compressed_pair_elem"*, align 8
  store %"struct.std::__1::__compressed_pair_elem"* %this, %"struct.std::__1::__compressed_pair_elem"** %this.addr, align 8
  %this1 = load %"struct.std::__1::__compressed_pair_elem"*, %"struct.std::__1::__compressed_pair_elem"** %this.addr, align 8
  %__value_ = getelementptr inbounds %"struct.std::__1::__compressed_pair_elem", %"struct.std::__1::__compressed_pair_elem"* %this1, i32 0, i32 0
  ret %"struct.std::__1::__compressed_pair_elem"* %this1
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal noundef %"struct.std::__1::__compressed_pair_elem.0"* @_ZNSt3__122__compressed_pair_elemINS_9allocatorIcEELi1ELb1EEC2ENS_18__default_init_tagE(%"struct.std::__1::__compressed_pair_elem.0"* noundef nonnull returned align 1 dereferenceable(1) %this) unnamed_addr #7 align 2 {
entry:
  %0 = alloca %"struct.std::__1::__default_init_tag", align 1
  %this.addr = alloca %"struct.std::__1::__compressed_pair_elem.0"*, align 8
  store %"struct.std::__1::__compressed_pair_elem.0"* %this, %"struct.std::__1::__compressed_pair_elem.0"** %this.addr, align 8
  %this1 = load %"struct.std::__1::__compressed_pair_elem.0"*, %"struct.std::__1::__compressed_pair_elem.0"** %this.addr, align 8
  %1 = bitcast %"struct.std::__1::__compressed_pair_elem.0"* %this1 to %"class.std::__1::allocator"*
  %call = call noundef %"class.std::__1::allocator"* @_ZNSt3__19allocatorIcEC2Ev(%"class.std::__1::allocator"* noundef nonnull align 1 dereferenceable(1) %1) #12
  ret %"struct.std::__1::__compressed_pair_elem.0"* %this1
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal noundef %"class.std::__1::allocator"* @_ZNSt3__19allocatorIcEC2Ev(%"class.std::__1::allocator"* noundef nonnull returned align 1 dereferenceable(1) %this) unnamed_addr #7 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::allocator"*, align 8
  store %"class.std::__1::allocator"* %this, %"class.std::__1::allocator"** %this.addr, align 8
  %this1 = load %"class.std::__1::allocator"*, %"class.std::__1::allocator"** %this.addr, align 8
  %0 = bitcast %"class.std::__1::allocator"* %this1 to %"struct.std::__1::__non_trivial_if"*
  %call = call noundef %"struct.std::__1::__non_trivial_if"* @_ZNSt3__116__non_trivial_ifILb1ENS_9allocatorIcEEEC2Ev(%"struct.std::__1::__non_trivial_if"* noundef nonnull align 1 dereferenceable(1) %0) #12
  ret %"class.std::__1::allocator"* %this1
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal noundef %"struct.std::__1::__non_trivial_if"* @_ZNSt3__116__non_trivial_ifILb1ENS_9allocatorIcEEEC2Ev(%"struct.std::__1::__non_trivial_if"* noundef nonnull returned align 1 dereferenceable(1) %this) unnamed_addr #7 align 2 {
entry:
  %this.addr = alloca %"struct.std::__1::__non_trivial_if"*, align 8
  store %"struct.std::__1::__non_trivial_if"* %this, %"struct.std::__1::__non_trivial_if"** %this.addr, align 8
  %this1 = load %"struct.std::__1::__non_trivial_if"*, %"struct.std::__1::__non_trivial_if"** %this.addr, align 8
  ret %"struct.std::__1::__non_trivial_if"* %this1
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef nonnull align 8 dereferenceable(24) %"struct.std::__1::basic_string<char>::__rep"* @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstEv(%"class.std::__1::__compressed_pair"* noundef nonnull align 8 dereferenceable(24) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::__compressed_pair"*, align 8
  store %"class.std::__1::__compressed_pair"* %this, %"class.std::__1::__compressed_pair"** %this.addr, align 8
  %this1 = load %"class.std::__1::__compressed_pair"*, %"class.std::__1::__compressed_pair"** %this.addr, align 8
  %0 = bitcast %"class.std::__1::__compressed_pair"* %this1 to %"struct.std::__1::__compressed_pair_elem"*
  %call = call noundef nonnull align 8 dereferenceable(24) %"struct.std::__1::basic_string<char>::__rep"* @_ZNSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EE5__getEv(%"struct.std::__1::__compressed_pair_elem"* noundef nonnull align 8 dereferenceable(24) %0) #12
  ret %"struct.std::__1::basic_string<char>::__rep"* %call
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef nonnull align 8 dereferenceable(24) %"struct.std::__1::basic_string<char>::__rep"* @_ZNSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EE5__getEv(%"struct.std::__1::__compressed_pair_elem"* noundef nonnull align 8 dereferenceable(24) %this) #2 align 2 {
entry:
  %this.addr = alloca %"struct.std::__1::__compressed_pair_elem"*, align 8
  store %"struct.std::__1::__compressed_pair_elem"* %this, %"struct.std::__1::__compressed_pair_elem"** %this.addr, align 8
  %this1 = load %"struct.std::__1::__compressed_pair_elem"*, %"struct.std::__1::__compressed_pair_elem"** %this.addr, align 8
  %__value_ = getelementptr inbounds %"struct.std::__1::__compressed_pair_elem", %"struct.std::__1::__compressed_pair_elem"* %this1, i32 0, i32 0
  ret %"struct.std::__1::basic_string<char>::__rep"* %__value_
}

declare noundef %"class.std::__1::basic_istream<char>::sentry"* @_ZNSt3__113basic_istreamIcNS_11char_traitsIcEEE6sentryC1ERS3_b(%"class.std::__1::basic_istream<char>::sentry"* noundef nonnull returned align 1 dereferenceable(1), %"class.std::__1::basic_istream"* noundef nonnull align 8 dereferenceable(16), i1 noundef zeroext) unnamed_addr #3

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef zeroext i1 @_ZNKSt3__113basic_istreamIcNS_11char_traitsIcEEE6sentrycvbEv(%"class.std::__1::basic_istream<char>::sentry"* noundef nonnull align 1 dereferenceable(1) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::basic_istream<char>::sentry"*, align 8
  store %"class.std::__1::basic_istream<char>::sentry"* %this, %"class.std::__1::basic_istream<char>::sentry"** %this.addr, align 8
  %this1 = load %"class.std::__1::basic_istream<char>::sentry"*, %"class.std::__1::basic_istream<char>::sentry"** %this.addr, align 8
  %__ok_ = getelementptr inbounds %"class.std::__1::basic_istream<char>::sentry", %"class.std::__1::basic_istream<char>::sentry"* %this1, i32 0, i32 0
  %0 = load i8, i8* %__ok_, align 1
  %tobool = trunc i8 %0 to i1
  ret i1 %tobool
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5clearEv(%"class.std::__1::basic_string"* noundef nonnull align 8 dereferenceable(24) %this) #2 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %this.addr = alloca %"class.std::__1::basic_string"*, align 8
  %ref.tmp = alloca i8, align 1
  %ref.tmp4 = alloca i8, align 1
  store %"class.std::__1::basic_string"* %this, %"class.std::__1::basic_string"** %this.addr, align 8
  %this1 = load %"class.std::__1::basic_string"*, %"class.std::__1::basic_string"** %this.addr, align 8
  invoke void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE26__invalidate_all_iteratorsEv(%"class.std::__1::basic_string"* noundef nonnull align 8 dereferenceable(24) %this1)
          to label %invoke.cont unwind label %terminate.lpad

invoke.cont:                                      ; preds = %entry
  %call = call noundef zeroext i1 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9__is_longEv(%"class.std::__1::basic_string"* noundef nonnull align 8 dereferenceable(24) %this1) #12
  br i1 %call, label %if.then, label %if.else

if.then:                                          ; preds = %invoke.cont
  %call2 = call noundef i8* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__get_long_pointerEv(%"class.std::__1::basic_string"* noundef nonnull align 8 dereferenceable(24) %this1) #12
  store i8 0, i8* %ref.tmp, align 1
  call void @_ZNSt3__111char_traitsIcE6assignERcRKc(i8* noundef nonnull align 1 dereferenceable(1) %call2, i8* noundef nonnull align 1 dereferenceable(1) %ref.tmp) #12
  call void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE15__set_long_sizeEm(%"class.std::__1::basic_string"* noundef nonnull align 8 dereferenceable(24) %this1, i64 noundef 0) #12
  br label %if.end

if.else:                                          ; preds = %invoke.cont
  %call3 = call noundef i8* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE19__get_short_pointerEv(%"class.std::__1::basic_string"* noundef nonnull align 8 dereferenceable(24) %this1) #12
  store i8 0, i8* %ref.tmp4, align 1
  call void @_ZNSt3__111char_traitsIcE6assignERcRKc(i8* noundef nonnull align 1 dereferenceable(1) %call3, i8* noundef nonnull align 1 dereferenceable(1) %ref.tmp4) #12
  call void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE16__set_short_sizeEm(%"class.std::__1::basic_string"* noundef nonnull align 8 dereferenceable(24) %this1, i64 noundef 0) #12
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void

terminate.lpad:                                   ; preds = %entry
  %0 = landingpad { i8*, i32 }
          catch i8* null
  %1 = extractvalue { i8*, i32 } %0, 0
  call void @__clang_call_terminate(i8* %1) #14
  unreachable
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef i64 @_ZNKSt3__18ios_base5widthEv(%"class.std::__1::ios_base"* noundef nonnull align 8 dereferenceable(136) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::ios_base"*, align 8
  store %"class.std::__1::ios_base"* %this, %"class.std::__1::ios_base"** %this.addr, align 8
  %this1 = load %"class.std::__1::ios_base"*, %"class.std::__1::ios_base"** %this.addr, align 8
  %__width_ = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %this1, i32 0, i32 3
  %0 = load i64, i64* %__width_, align 8
  ret i64 %0
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE8max_sizeEv(%"class.std::__1::basic_string"* noundef nonnull align 8 dereferenceable(24) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::basic_string"*, align 8
  %__m = alloca i64, align 8
  store %"class.std::__1::basic_string"* %this, %"class.std::__1::basic_string"** %this.addr, align 8
  %this1 = load %"class.std::__1::basic_string"*, %"class.std::__1::basic_string"** %this.addr, align 8
  %call = call noundef nonnull align 1 dereferenceable(1) %"class.std::__1::allocator"* @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7__allocEv(%"class.std::__1::basic_string"* noundef nonnull align 8 dereferenceable(24) %this1) #12
  %call2 = call noundef i64 @_ZNSt3__116allocator_traitsINS_9allocatorIcEEE8max_sizeIS2_vEEmRKS2_(%"class.std::__1::allocator"* noundef nonnull align 1 dereferenceable(1) %call) #12
  store i64 %call2, i64* %__m, align 8
  %0 = load i64, i64* %__m, align 8
  %sub = sub i64 %0, 16
  ret i64 %sub
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef i64 @_ZNSt3__114numeric_limitsIlE3maxEv() #2 align 2 {
entry:
  %call = call noundef i64 @_ZNSt3__123__libcpp_numeric_limitsIlLb1EE3maxEv() #12
  ret i64 %call
}

; Function Attrs: mustprogress noinline optnone ssp uwtable
define internal noundef nonnull align 8 dereferenceable(25) %"class.std::__1::ctype"* @_ZNSt3__1L9use_facetINS_5ctypeIcEEEERKT_RKNS_6localeE(%"class.std::__1::locale"* noundef nonnull align 8 dereferenceable(8) %__l) #0 {
entry:
  %__l.addr = alloca %"class.std::__1::locale"*, align 8
  store %"class.std::__1::locale"* %__l, %"class.std::__1::locale"** %__l.addr, align 8
  %0 = load %"class.std::__1::locale"*, %"class.std::__1::locale"** %__l.addr, align 8
  %call = call noundef %"class.std::__1::locale::facet"* @_ZNKSt3__16locale9use_facetERNS0_2idE(%"class.std::__1::locale"* noundef nonnull align 8 dereferenceable(8) %0, %"class.std::__1::locale::id"* noundef nonnull align 8 dereferenceable(12) @_ZNSt3__15ctypeIcE2idE)
  %1 = bitcast %"class.std::__1::locale::facet"* %call to %"class.std::__1::ctype"*
  ret %"class.std::__1::ctype"* %1
}

declare void @_ZNKSt3__18ios_base6getlocEv(%"class.std::__1::locale"* sret(%"class.std::__1::locale") align 8, %"class.std::__1::ios_base"* noundef nonnull align 8 dereferenceable(136)) #3

; Function Attrs: nounwind
declare noundef %"class.std::__1::locale"* @_ZNSt3__16localeD1Ev(%"class.std::__1::locale"* noundef nonnull returned align 8 dereferenceable(8)) unnamed_addr #8

; Function Attrs: mustprogress noinline optnone ssp uwtable
define internal noundef %"class.std::__1::basic_streambuf"* @_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5rdbufEv(%"class.std::__1::basic_ios"* noundef nonnull align 8 dereferenceable(148) %this) #0 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::basic_ios"*, align 8
  store %"class.std::__1::basic_ios"* %this, %"class.std::__1::basic_ios"** %this.addr, align 8
  %this1 = load %"class.std::__1::basic_ios"*, %"class.std::__1::basic_ios"** %this.addr, align 8
  %0 = bitcast %"class.std::__1::basic_ios"* %this1 to %"class.std::__1::ios_base"*
  %call = call noundef i8* @_ZNKSt3__18ios_base5rdbufEv(%"class.std::__1::ios_base"* noundef nonnull align 8 dereferenceable(136) %0)
  %1 = bitcast i8* %call to %"class.std::__1::basic_streambuf"*
  ret %"class.std::__1::basic_streambuf"* %1
}

; Function Attrs: mustprogress noinline optnone ssp uwtable
define internal noundef i32 @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5sgetcEv(%"class.std::__1::basic_streambuf"* noundef nonnull align 8 dereferenceable(64) %this) #0 align 2 {
entry:
  %retval = alloca i32, align 4
  %this.addr = alloca %"class.std::__1::basic_streambuf"*, align 8
  store %"class.std::__1::basic_streambuf"* %this, %"class.std::__1::basic_streambuf"** %this.addr, align 8
  %this1 = load %"class.std::__1::basic_streambuf"*, %"class.std::__1::basic_streambuf"** %this.addr, align 8
  %__ninp_ = getelementptr inbounds %"class.std::__1::basic_streambuf", %"class.std::__1::basic_streambuf"* %this1, i32 0, i32 3
  %0 = load i8*, i8** %__ninp_, align 8
  %__einp_ = getelementptr inbounds %"class.std::__1::basic_streambuf", %"class.std::__1::basic_streambuf"* %this1, i32 0, i32 4
  %1 = load i8*, i8** %__einp_, align 8
  %cmp = icmp eq i8* %0, %1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = bitcast %"class.std::__1::basic_streambuf"* %this1 to i32 (%"class.std::__1::basic_streambuf"*)***
  %vtable = load i32 (%"class.std::__1::basic_streambuf"*)**, i32 (%"class.std::__1::basic_streambuf"*)*** %2, align 8
  %vfn = getelementptr inbounds i32 (%"class.std::__1::basic_streambuf"*)*, i32 (%"class.std::__1::basic_streambuf"*)** %vtable, i64 9
  %3 = load i32 (%"class.std::__1::basic_streambuf"*)*, i32 (%"class.std::__1::basic_streambuf"*)** %vfn, align 8
  %call = call noundef i32 %3(%"class.std::__1::basic_streambuf"* noundef nonnull align 8 dereferenceable(64) %this1)
  store i32 %call, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %__ninp_2 = getelementptr inbounds %"class.std::__1::basic_streambuf", %"class.std::__1::basic_streambuf"* %this1, i32 0, i32 3
  %4 = load i8*, i8** %__ninp_2, align 8
  %5 = load i8, i8* %4, align 1
  %call3 = call noundef i32 @_ZNSt3__111char_traitsIcE11to_int_typeEc(i8 noundef signext %5) #12
  store i32 %call3, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %6 = load i32, i32* %retval, align 4
  ret i32 %6
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define linkonce_odr noundef zeroext i1 @_ZNSt3__111char_traitsIcE11eq_int_typeEii(i32 noundef %__c1, i32 noundef %__c2) #2 align 2 {
entry:
  %__c1.addr = alloca i32, align 4
  %__c2.addr = alloca i32, align 4
  store i32 %__c1, i32* %__c1.addr, align 4
  store i32 %__c2, i32* %__c2.addr, align 4
  %0 = load i32, i32* %__c1.addr, align 4
  %1 = load i32, i32* %__c2.addr, align 4
  %cmp = icmp eq i32 %0, %1
  ret i1 %cmp
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define linkonce_odr noundef i32 @_ZNSt3__111char_traitsIcE3eofEv() #2 align 2 {
entry:
  ret i32 -1
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define linkonce_odr noundef signext i8 @_ZNSt3__111char_traitsIcE12to_char_typeEi(i32 noundef %__c) #2 align 2 {
entry:
  %__c.addr = alloca i32, align 4
  store i32 %__c, i32* %__c.addr, align 4
  %0 = load i32, i32* %__c.addr, align 4
  %conv = trunc i32 %0 to i8
  ret i8 %conv
}

; Function Attrs: mustprogress noinline optnone ssp uwtable
define internal noundef zeroext i1 @_ZNKSt3__15ctypeIcE2isEjc(%"class.std::__1::ctype"* noundef nonnull align 8 dereferenceable(25) %this, i32 noundef %__m, i8 noundef signext %__c) #0 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::ctype"*, align 8
  %__m.addr = alloca i32, align 4
  %__c.addr = alloca i8, align 1
  store %"class.std::__1::ctype"* %this, %"class.std::__1::ctype"** %this.addr, align 8
  store i32 %__m, i32* %__m.addr, align 4
  store i8 %__c, i8* %__c.addr, align 1
  %this1 = load %"class.std::__1::ctype"*, %"class.std::__1::ctype"** %this.addr, align 8
  %0 = load i8, i8* %__c.addr, align 1
  %conv = sext i8 %0 to i32
  %call = call noundef i32 @_Z7isasciii(i32 noundef %conv)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %__tab_ = getelementptr inbounds %"class.std::__1::ctype", %"class.std::__1::ctype"* %this1, i32 0, i32 1
  %1 = load i32*, i32** %__tab_, align 8
  %2 = load i8, i8* %__c.addr, align 1
  %conv2 = sext i8 %2 to i32
  %idxprom = sext i32 %conv2 to i64
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 %idxprom
  %3 = load i32, i32* %arrayidx, align 4
  %4 = load i32, i32* %__m.addr, align 4
  %and = and i32 %3, %4
  %cmp = icmp ne i32 %and, 0
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i1 [ %cmp, %cond.true ], [ false, %cond.false ]
  ret i1 %cond
}

declare void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9push_backEc(%"class.std::__1::basic_string"* noundef nonnull align 8 dereferenceable(24), i8 noundef signext) #3

; Function Attrs: mustprogress noinline optnone ssp uwtable
define internal noundef i32 @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE6sbumpcEv(%"class.std::__1::basic_streambuf"* noundef nonnull align 8 dereferenceable(64) %this) #0 align 2 {
entry:
  %retval = alloca i32, align 4
  %this.addr = alloca %"class.std::__1::basic_streambuf"*, align 8
  store %"class.std::__1::basic_streambuf"* %this, %"class.std::__1::basic_streambuf"** %this.addr, align 8
  %this1 = load %"class.std::__1::basic_streambuf"*, %"class.std::__1::basic_streambuf"** %this.addr, align 8
  %__ninp_ = getelementptr inbounds %"class.std::__1::basic_streambuf", %"class.std::__1::basic_streambuf"* %this1, i32 0, i32 3
  %0 = load i8*, i8** %__ninp_, align 8
  %__einp_ = getelementptr inbounds %"class.std::__1::basic_streambuf", %"class.std::__1::basic_streambuf"* %this1, i32 0, i32 4
  %1 = load i8*, i8** %__einp_, align 8
  %cmp = icmp eq i8* %0, %1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = bitcast %"class.std::__1::basic_streambuf"* %this1 to i32 (%"class.std::__1::basic_streambuf"*)***
  %vtable = load i32 (%"class.std::__1::basic_streambuf"*)**, i32 (%"class.std::__1::basic_streambuf"*)*** %2, align 8
  %vfn = getelementptr inbounds i32 (%"class.std::__1::basic_streambuf"*)*, i32 (%"class.std::__1::basic_streambuf"*)** %vtable, i64 10
  %3 = load i32 (%"class.std::__1::basic_streambuf"*)*, i32 (%"class.std::__1::basic_streambuf"*)** %vfn, align 8
  %call = call noundef i32 %3(%"class.std::__1::basic_streambuf"* noundef nonnull align 8 dereferenceable(64) %this1)
  store i32 %call, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %__ninp_2 = getelementptr inbounds %"class.std::__1::basic_streambuf", %"class.std::__1::basic_streambuf"* %this1, i32 0, i32 3
  %4 = load i8*, i8** %__ninp_2, align 8
  %incdec.ptr = getelementptr inbounds i8, i8* %4, i32 1
  store i8* %incdec.ptr, i8** %__ninp_2, align 8
  %5 = load i8, i8* %4, align 1
  %call3 = call noundef i32 @_ZNSt3__111char_traitsIcE11to_int_typeEc(i8 noundef signext %5) #12
  store i32 %call3, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %6 = load i32, i32* %retval, align 4
  ret i32 %6
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef i64 @_ZNSt3__18ios_base5widthEl(%"class.std::__1::ios_base"* noundef nonnull align 8 dereferenceable(136) %this, i64 noundef %__wide) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::ios_base"*, align 8
  %__wide.addr = alloca i64, align 8
  %__r = alloca i64, align 8
  store %"class.std::__1::ios_base"* %this, %"class.std::__1::ios_base"** %this.addr, align 8
  store i64 %__wide, i64* %__wide.addr, align 8
  %this1 = load %"class.std::__1::ios_base"*, %"class.std::__1::ios_base"** %this.addr, align 8
  %__width_ = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %this1, i32 0, i32 3
  %0 = load i64, i64* %__width_, align 8
  store i64 %0, i64* %__r, align 8
  %1 = load i64, i64* %__wide.addr, align 8
  %__width_2 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %this1, i32 0, i32 3
  store i64 %1, i64* %__width_2, align 8
  %2 = load i64, i64* %__r, align 8
  ret i64 %2
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal void @_ZNSt3__18ios_base18__setstate_nothrowEj(%"class.std::__1::ios_base"* noundef nonnull align 8 dereferenceable(136) %this, i32 noundef %__state) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::ios_base"*, align 8
  %__state.addr = alloca i32, align 4
  store %"class.std::__1::ios_base"* %this, %"class.std::__1::ios_base"** %this.addr, align 8
  store i32 %__state, i32* %__state.addr, align 4
  %this1 = load %"class.std::__1::ios_base"*, %"class.std::__1::ios_base"** %this.addr, align 8
  %__rdbuf_ = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %this1, i32 0, i32 6
  %0 = load i8*, i8** %__rdbuf_, align 8
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %__state.addr, align 4
  %__rdstate_ = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %this1, i32 0, i32 4
  %2 = load i32, i32* %__rdstate_, align 8
  %or = or i32 %2, %1
  store i32 %or, i32* %__rdstate_, align 8
  br label %if.end

if.else:                                          ; preds = %entry
  %3 = load i32, i32* %__state.addr, align 4
  %or2 = or i32 %3, 1
  %__rdstate_3 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %this1, i32 0, i32 4
  %4 = load i32, i32* %__rdstate_3, align 8
  %or4 = or i32 %4, %or2
  store i32 %or4, i32* %__rdstate_3, align 8
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable
define internal noundef i32 @_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE10exceptionsEv(%"class.std::__1::basic_ios"* noundef nonnull align 8 dereferenceable(148) %this) #0 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::basic_ios"*, align 8
  store %"class.std::__1::basic_ios"* %this, %"class.std::__1::basic_ios"** %this.addr, align 8
  %this1 = load %"class.std::__1::basic_ios"*, %"class.std::__1::basic_ios"** %this.addr, align 8
  %0 = bitcast %"class.std::__1::basic_ios"* %this1 to %"class.std::__1::ios_base"*
  %call = call noundef i32 @_ZNKSt3__18ios_base10exceptionsEv(%"class.std::__1::ios_base"* noundef nonnull align 8 dereferenceable(136) %0)
  ret i32 %call
}

declare void @__cxa_rethrow()

declare void @__cxa_end_catch()

; Function Attrs: mustprogress noinline optnone ssp uwtable
define internal void @_ZNSt3__19basic_iosIcNS_11char_traitsIcEEE8setstateEj(%"class.std::__1::basic_ios"* noundef nonnull align 8 dereferenceable(148) %this, i32 noundef %__state) #0 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::basic_ios"*, align 8
  %__state.addr = alloca i32, align 4
  store %"class.std::__1::basic_ios"* %this, %"class.std::__1::basic_ios"** %this.addr, align 8
  store i32 %__state, i32* %__state.addr, align 4
  %this1 = load %"class.std::__1::basic_ios"*, %"class.std::__1::basic_ios"** %this.addr, align 8
  %0 = bitcast %"class.std::__1::basic_ios"* %this1 to %"class.std::__1::ios_base"*
  %1 = load i32, i32* %__state.addr, align 4
  call void @_ZNSt3__18ios_base8setstateEj(%"class.std::__1::ios_base"* noundef nonnull align 8 dereferenceable(136) %0, i32 noundef %1)
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE26__invalidate_all_iteratorsEv(%"class.std::__1::basic_string"* noundef nonnull align 8 dereferenceable(24) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::basic_string"*, align 8
  store %"class.std::__1::basic_string"* %this, %"class.std::__1::basic_string"** %this.addr, align 8
  %this1 = load %"class.std::__1::basic_string"*, %"class.std::__1::basic_string"** %this.addr, align 8
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef zeroext i1 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9__is_longEv(%"class.std::__1::basic_string"* noundef nonnull align 8 dereferenceable(24) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::basic_string"*, align 8
  store %"class.std::__1::basic_string"* %this, %"class.std::__1::basic_string"** %this.addr, align 8
  %this1 = load %"class.std::__1::basic_string"*, %"class.std::__1::basic_string"** %this.addr, align 8
  %__r_ = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %this1, i32 0, i32 0
  %call = call noundef nonnull align 8 dereferenceable(24) %"struct.std::__1::basic_string<char>::__rep"* @_ZNKSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstEv(%"class.std::__1::__compressed_pair"* noundef nonnull align 8 dereferenceable(24) %__r_) #12
  %0 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__rep", %"struct.std::__1::basic_string<char>::__rep"* %call, i32 0, i32 0
  %__s = bitcast %union.anon* %0 to %"struct.std::__1::basic_string<char>::__short"*
  %1 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__short", %"struct.std::__1::basic_string<char>::__short"* %__s, i32 0, i32 1
  %__size_ = getelementptr inbounds %struct.anon, %struct.anon* %1, i32 0, i32 0
  %2 = load i8, i8* %__size_, align 1
  %conv = zext i8 %2 to i64
  %and = and i64 %conv, 128
  %tobool = icmp ne i64 %and, 0
  ret i1 %tobool
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define linkonce_odr void @_ZNSt3__111char_traitsIcE6assignERcRKc(i8* noundef nonnull align 1 dereferenceable(1) %__c1, i8* noundef nonnull align 1 dereferenceable(1) %__c2) #2 align 2 {
entry:
  %__c1.addr = alloca i8*, align 8
  %__c2.addr = alloca i8*, align 8
  store i8* %__c1, i8** %__c1.addr, align 8
  store i8* %__c2, i8** %__c2.addr, align 8
  %0 = load i8*, i8** %__c2.addr, align 8
  %1 = load i8, i8* %0, align 1
  %2 = load i8*, i8** %__c1.addr, align 8
  store i8 %1, i8* %2, align 1
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef i8* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__get_long_pointerEv(%"class.std::__1::basic_string"* noundef nonnull align 8 dereferenceable(24) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::basic_string"*, align 8
  store %"class.std::__1::basic_string"* %this, %"class.std::__1::basic_string"** %this.addr, align 8
  %this1 = load %"class.std::__1::basic_string"*, %"class.std::__1::basic_string"** %this.addr, align 8
  %__r_ = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %this1, i32 0, i32 0
  %call = call noundef nonnull align 8 dereferenceable(24) %"struct.std::__1::basic_string<char>::__rep"* @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstEv(%"class.std::__1::__compressed_pair"* noundef nonnull align 8 dereferenceable(24) %__r_) #12
  %0 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__rep", %"struct.std::__1::basic_string<char>::__rep"* %call, i32 0, i32 0
  %__l = bitcast %union.anon* %0 to %"struct.std::__1::basic_string<char>::__long"*
  %__data_ = getelementptr inbounds %"struct.std::__1::basic_string<char>::__long", %"struct.std::__1::basic_string<char>::__long"* %__l, i32 0, i32 0
  %1 = load i8*, i8** %__data_, align 8
  ret i8* %1
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE15__set_long_sizeEm(%"class.std::__1::basic_string"* noundef nonnull align 8 dereferenceable(24) %this, i64 noundef %__s) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::basic_string"*, align 8
  %__s.addr = alloca i64, align 8
  store %"class.std::__1::basic_string"* %this, %"class.std::__1::basic_string"** %this.addr, align 8
  store i64 %__s, i64* %__s.addr, align 8
  %this1 = load %"class.std::__1::basic_string"*, %"class.std::__1::basic_string"** %this.addr, align 8
  %0 = load i64, i64* %__s.addr, align 8
  %__r_ = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %this1, i32 0, i32 0
  %call = call noundef nonnull align 8 dereferenceable(24) %"struct.std::__1::basic_string<char>::__rep"* @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstEv(%"class.std::__1::__compressed_pair"* noundef nonnull align 8 dereferenceable(24) %__r_) #12
  %1 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__rep", %"struct.std::__1::basic_string<char>::__rep"* %call, i32 0, i32 0
  %__l = bitcast %union.anon* %1 to %"struct.std::__1::basic_string<char>::__long"*
  %__size_ = getelementptr inbounds %"struct.std::__1::basic_string<char>::__long", %"struct.std::__1::basic_string<char>::__long"* %__l, i32 0, i32 1
  store i64 %0, i64* %__size_, align 8
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef i8* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE19__get_short_pointerEv(%"class.std::__1::basic_string"* noundef nonnull align 8 dereferenceable(24) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::basic_string"*, align 8
  store %"class.std::__1::basic_string"* %this, %"class.std::__1::basic_string"** %this.addr, align 8
  %this1 = load %"class.std::__1::basic_string"*, %"class.std::__1::basic_string"** %this.addr, align 8
  %__r_ = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %this1, i32 0, i32 0
  %call = call noundef nonnull align 8 dereferenceable(24) %"struct.std::__1::basic_string<char>::__rep"* @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstEv(%"class.std::__1::__compressed_pair"* noundef nonnull align 8 dereferenceable(24) %__r_) #12
  %0 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__rep", %"struct.std::__1::basic_string<char>::__rep"* %call, i32 0, i32 0
  %__s = bitcast %union.anon* %0 to %"struct.std::__1::basic_string<char>::__short"*
  %__data_ = getelementptr inbounds %"struct.std::__1::basic_string<char>::__short", %"struct.std::__1::basic_string<char>::__short"* %__s, i32 0, i32 0
  %arrayidx = getelementptr inbounds [23 x i8], [23 x i8]* %__data_, i64 0, i64 0
  %call2 = call noundef i8* @_ZNSt3__114pointer_traitsIPcE10pointer_toERc(i8* noundef nonnull align 1 dereferenceable(1) %arrayidx) #12
  ret i8* %call2
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE16__set_short_sizeEm(%"class.std::__1::basic_string"* noundef nonnull align 8 dereferenceable(24) %this, i64 noundef %__s) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::basic_string"*, align 8
  %__s.addr = alloca i64, align 8
  store %"class.std::__1::basic_string"* %this, %"class.std::__1::basic_string"** %this.addr, align 8
  store i64 %__s, i64* %__s.addr, align 8
  %this1 = load %"class.std::__1::basic_string"*, %"class.std::__1::basic_string"** %this.addr, align 8
  %0 = load i64, i64* %__s.addr, align 8
  %conv = trunc i64 %0 to i8
  %__r_ = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %this1, i32 0, i32 0
  %call = call noundef nonnull align 8 dereferenceable(24) %"struct.std::__1::basic_string<char>::__rep"* @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstEv(%"class.std::__1::__compressed_pair"* noundef nonnull align 8 dereferenceable(24) %__r_) #12
  %1 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__rep", %"struct.std::__1::basic_string<char>::__rep"* %call, i32 0, i32 0
  %__s2 = bitcast %union.anon* %1 to %"struct.std::__1::basic_string<char>::__short"*
  %2 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__short", %"struct.std::__1::basic_string<char>::__short"* %__s2, i32 0, i32 1
  %__size_ = getelementptr inbounds %struct.anon, %struct.anon* %2, i32 0, i32 0
  store i8 %conv, i8* %__size_, align 1
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef nonnull align 8 dereferenceable(24) %"struct.std::__1::basic_string<char>::__rep"* @_ZNKSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstEv(%"class.std::__1::__compressed_pair"* noundef nonnull align 8 dereferenceable(24) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::__compressed_pair"*, align 8
  store %"class.std::__1::__compressed_pair"* %this, %"class.std::__1::__compressed_pair"** %this.addr, align 8
  %this1 = load %"class.std::__1::__compressed_pair"*, %"class.std::__1::__compressed_pair"** %this.addr, align 8
  %0 = bitcast %"class.std::__1::__compressed_pair"* %this1 to %"struct.std::__1::__compressed_pair_elem"*
  %call = call noundef nonnull align 8 dereferenceable(24) %"struct.std::__1::basic_string<char>::__rep"* @_ZNKSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EE5__getEv(%"struct.std::__1::__compressed_pair_elem"* noundef nonnull align 8 dereferenceable(24) %0) #12
  ret %"struct.std::__1::basic_string<char>::__rep"* %call
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef nonnull align 8 dereferenceable(24) %"struct.std::__1::basic_string<char>::__rep"* @_ZNKSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EE5__getEv(%"struct.std::__1::__compressed_pair_elem"* noundef nonnull align 8 dereferenceable(24) %this) #2 align 2 {
entry:
  %this.addr = alloca %"struct.std::__1::__compressed_pair_elem"*, align 8
  store %"struct.std::__1::__compressed_pair_elem"* %this, %"struct.std::__1::__compressed_pair_elem"** %this.addr, align 8
  %this1 = load %"struct.std::__1::__compressed_pair_elem"*, %"struct.std::__1::__compressed_pair_elem"** %this.addr, align 8
  %__value_ = getelementptr inbounds %"struct.std::__1::__compressed_pair_elem", %"struct.std::__1::__compressed_pair_elem"* %this1, i32 0, i32 0
  ret %"struct.std::__1::basic_string<char>::__rep"* %__value_
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef i8* @_ZNSt3__114pointer_traitsIPcE10pointer_toERc(i8* noundef nonnull align 1 dereferenceable(1) %__r) #2 align 2 {
entry:
  %__r.addr = alloca i8*, align 8
  store i8* %__r, i8** %__r.addr, align 8
  %0 = load i8*, i8** %__r.addr, align 8
  %call = call noundef i8* @_ZNSt3__1L9addressofIcEEPT_RS1_(i8* noundef nonnull align 1 dereferenceable(1) %0) #12
  ret i8* %call
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef i8* @_ZNSt3__1L9addressofIcEEPT_RS1_(i8* noundef nonnull align 1 dereferenceable(1) %__x) #2 {
entry:
  %__x.addr = alloca i8*, align 8
  store i8* %__x, i8** %__x.addr, align 8
  %0 = load i8*, i8** %__x.addr, align 8
  ret i8* %0
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef i64 @_ZNSt3__116allocator_traitsINS_9allocatorIcEEE8max_sizeIS2_vEEmRKS2_(%"class.std::__1::allocator"* noundef nonnull align 1 dereferenceable(1) %__a) #2 align 2 {
entry:
  %__a.addr = alloca %"class.std::__1::allocator"*, align 8
  store %"class.std::__1::allocator"* %__a, %"class.std::__1::allocator"** %__a.addr, align 8
  %0 = load %"class.std::__1::allocator"*, %"class.std::__1::allocator"** %__a.addr, align 8
  %call = call noundef i64 @_ZNKSt3__19allocatorIcE8max_sizeEv(%"class.std::__1::allocator"* noundef nonnull align 1 dereferenceable(1) %0) #12
  ret i64 %call
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef nonnull align 1 dereferenceable(1) %"class.std::__1::allocator"* @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7__allocEv(%"class.std::__1::basic_string"* noundef nonnull align 8 dereferenceable(24) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::basic_string"*, align 8
  store %"class.std::__1::basic_string"* %this, %"class.std::__1::basic_string"** %this.addr, align 8
  %this1 = load %"class.std::__1::basic_string"*, %"class.std::__1::basic_string"** %this.addr, align 8
  %__r_ = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %this1, i32 0, i32 0
  %call = call noundef nonnull align 1 dereferenceable(1) %"class.std::__1::allocator"* @_ZNKSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E6secondEv(%"class.std::__1::__compressed_pair"* noundef nonnull align 8 dereferenceable(24) %__r_) #12
  ret %"class.std::__1::allocator"* %call
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef i64 @_ZNKSt3__19allocatorIcE8max_sizeEv(%"class.std::__1::allocator"* noundef nonnull align 1 dereferenceable(1) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::allocator"*, align 8
  store %"class.std::__1::allocator"* %this, %"class.std::__1::allocator"** %this.addr, align 8
  %this1 = load %"class.std::__1::allocator"*, %"class.std::__1::allocator"** %this.addr, align 8
  ret i64 -1
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef nonnull align 1 dereferenceable(1) %"class.std::__1::allocator"* @_ZNKSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E6secondEv(%"class.std::__1::__compressed_pair"* noundef nonnull align 8 dereferenceable(24) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::__compressed_pair"*, align 8
  store %"class.std::__1::__compressed_pair"* %this, %"class.std::__1::__compressed_pair"** %this.addr, align 8
  %this1 = load %"class.std::__1::__compressed_pair"*, %"class.std::__1::__compressed_pair"** %this.addr, align 8
  %0 = bitcast %"class.std::__1::__compressed_pair"* %this1 to %"struct.std::__1::__compressed_pair_elem.0"*
  %call = call noundef nonnull align 1 dereferenceable(1) %"class.std::__1::allocator"* @_ZNKSt3__122__compressed_pair_elemINS_9allocatorIcEELi1ELb1EE5__getEv(%"struct.std::__1::__compressed_pair_elem.0"* noundef nonnull align 1 dereferenceable(1) %0) #12
  ret %"class.std::__1::allocator"* %call
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef nonnull align 1 dereferenceable(1) %"class.std::__1::allocator"* @_ZNKSt3__122__compressed_pair_elemINS_9allocatorIcEELi1ELb1EE5__getEv(%"struct.std::__1::__compressed_pair_elem.0"* noundef nonnull align 1 dereferenceable(1) %this) #2 align 2 {
entry:
  %this.addr = alloca %"struct.std::__1::__compressed_pair_elem.0"*, align 8
  store %"struct.std::__1::__compressed_pair_elem.0"* %this, %"struct.std::__1::__compressed_pair_elem.0"** %this.addr, align 8
  %this1 = load %"struct.std::__1::__compressed_pair_elem.0"*, %"struct.std::__1::__compressed_pair_elem.0"** %this.addr, align 8
  %0 = bitcast %"struct.std::__1::__compressed_pair_elem.0"* %this1 to %"class.std::__1::allocator"*
  ret %"class.std::__1::allocator"* %0
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef i64 @_ZNSt3__123__libcpp_numeric_limitsIlLb1EE3maxEv() #2 align 2 {
entry:
  ret i64 9223372036854775807
}

declare noundef %"class.std::__1::locale::facet"* @_ZNKSt3__16locale9use_facetERNS0_2idE(%"class.std::__1::locale"* noundef nonnull align 8 dereferenceable(8), %"class.std::__1::locale::id"* noundef nonnull align 8 dereferenceable(12)) #3

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef i8* @_ZNKSt3__18ios_base5rdbufEv(%"class.std::__1::ios_base"* noundef nonnull align 8 dereferenceable(136) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::ios_base"*, align 8
  store %"class.std::__1::ios_base"* %this, %"class.std::__1::ios_base"** %this.addr, align 8
  %this1 = load %"class.std::__1::ios_base"*, %"class.std::__1::ios_base"** %this.addr, align 8
  %__rdbuf_ = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %this1, i32 0, i32 6
  %0 = load i8*, i8** %__rdbuf_, align 8
  ret i8* %0
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define linkonce_odr noundef i32 @_ZNSt3__111char_traitsIcE11to_int_typeEc(i8 noundef signext %__c) #2 align 2 {
entry:
  %__c.addr = alloca i8, align 1
  store i8 %__c, i8* %__c.addr, align 1
  %0 = load i8, i8* %__c.addr, align 1
  %conv = zext i8 %0 to i32
  ret i32 %conv
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define linkonce_odr noundef i32 @_Z7isasciii(i32 noundef %_c) #2 {
entry:
  %_c.addr = alloca i32, align 4
  store i32 %_c, i32* %_c.addr, align 4
  %0 = load i32, i32* %_c.addr, align 4
  %and = and i32 %0, -128
  %cmp = icmp eq i32 %and, 0
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef i32 @_ZNKSt3__18ios_base10exceptionsEv(%"class.std::__1::ios_base"* noundef nonnull align 8 dereferenceable(136) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::ios_base"*, align 8
  store %"class.std::__1::ios_base"* %this, %"class.std::__1::ios_base"** %this.addr, align 8
  %this1 = load %"class.std::__1::ios_base"*, %"class.std::__1::ios_base"** %this.addr, align 8
  %__exceptions_ = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %this1, i32 0, i32 5
  %0 = load i32, i32* %__exceptions_, align 4
  ret i32 %0
}

; Function Attrs: mustprogress noinline optnone ssp uwtable
define internal void @_ZNSt3__18ios_base8setstateEj(%"class.std::__1::ios_base"* noundef nonnull align 8 dereferenceable(136) %this, i32 noundef %__state) #0 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::ios_base"*, align 8
  %__state.addr = alloca i32, align 4
  store %"class.std::__1::ios_base"* %this, %"class.std::__1::ios_base"** %this.addr, align 8
  store i32 %__state, i32* %__state.addr, align 4
  %this1 = load %"class.std::__1::ios_base"*, %"class.std::__1::ios_base"** %this.addr, align 8
  %__rdstate_ = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %this1, i32 0, i32 4
  %0 = load i32, i32* %__rdstate_, align 8
  %1 = load i32, i32* %__state.addr, align 4
  %or = or i32 %0, %1
  call void @_ZNSt3__18ios_base5clearEj(%"class.std::__1::ios_base"* noundef nonnull align 8 dereferenceable(136) %this1, i32 noundef %or)
  ret void
}

declare void @_ZNSt3__18ios_base5clearEj(%"class.std::__1::ios_base"* noundef nonnull align 8 dereferenceable(136), i32 noundef) #3

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef i8* @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataEv(%"class.std::__1::basic_string"* noundef nonnull align 8 dereferenceable(24) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::basic_string"*, align 8
  store %"class.std::__1::basic_string"* %this, %"class.std::__1::basic_string"** %this.addr, align 8
  %this1 = load %"class.std::__1::basic_string"*, %"class.std::__1::basic_string"** %this.addr, align 8
  %call = call noundef i8* @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13__get_pointerEv(%"class.std::__1::basic_string"* noundef nonnull align 8 dereferenceable(24) %this1) #12
  %call2 = call noundef i8* @_ZNSt3__1L12__to_addressIKcEEPT_S3_(i8* noundef %call) #12
  ret i8* %call2
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef i8* @_ZNSt3__1L12__to_addressIKcEEPT_S3_(i8* noundef %__p) #2 {
entry:
  %__p.addr = alloca i8*, align 8
  store i8* %__p, i8** %__p.addr, align 8
  %0 = load i8*, i8** %__p.addr, align 8
  ret i8* %0
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef i8* @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13__get_pointerEv(%"class.std::__1::basic_string"* noundef nonnull align 8 dereferenceable(24) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::basic_string"*, align 8
  store %"class.std::__1::basic_string"* %this, %"class.std::__1::basic_string"** %this.addr, align 8
  %this1 = load %"class.std::__1::basic_string"*, %"class.std::__1::basic_string"** %this.addr, align 8
  %call = call noundef zeroext i1 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9__is_longEv(%"class.std::__1::basic_string"* noundef nonnull align 8 dereferenceable(24) %this1) #12
  br i1 %call, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %call2 = call noundef i8* @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__get_long_pointerEv(%"class.std::__1::basic_string"* noundef nonnull align 8 dereferenceable(24) %this1) #12
  br label %cond.end

cond.false:                                       ; preds = %entry
  %call3 = call noundef i8* @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE19__get_short_pointerEv(%"class.std::__1::basic_string"* noundef nonnull align 8 dereferenceable(24) %this1) #12
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call2, %cond.true ], [ %call3, %cond.false ]
  ret i8* %cond
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef i8* @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__get_long_pointerEv(%"class.std::__1::basic_string"* noundef nonnull align 8 dereferenceable(24) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::basic_string"*, align 8
  store %"class.std::__1::basic_string"* %this, %"class.std::__1::basic_string"** %this.addr, align 8
  %this1 = load %"class.std::__1::basic_string"*, %"class.std::__1::basic_string"** %this.addr, align 8
  %__r_ = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %this1, i32 0, i32 0
  %call = call noundef nonnull align 8 dereferenceable(24) %"struct.std::__1::basic_string<char>::__rep"* @_ZNKSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstEv(%"class.std::__1::__compressed_pair"* noundef nonnull align 8 dereferenceable(24) %__r_) #12
  %0 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__rep", %"struct.std::__1::basic_string<char>::__rep"* %call, i32 0, i32 0
  %__l = bitcast %union.anon* %0 to %"struct.std::__1::basic_string<char>::__long"*
  %__data_ = getelementptr inbounds %"struct.std::__1::basic_string<char>::__long", %"struct.std::__1::basic_string<char>::__long"* %__l, i32 0, i32 0
  %1 = load i8*, i8** %__data_, align 8
  ret i8* %1
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef i8* @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE19__get_short_pointerEv(%"class.std::__1::basic_string"* noundef nonnull align 8 dereferenceable(24) %this) #2 align 2 {
entry:
  %this.addr = alloca %"class.std::__1::basic_string"*, align 8
  store %"class.std::__1::basic_string"* %this, %"class.std::__1::basic_string"** %this.addr, align 8
  %this1 = load %"class.std::__1::basic_string"*, %"class.std::__1::basic_string"** %this.addr, align 8
  %__r_ = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %this1, i32 0, i32 0
  %call = call noundef nonnull align 8 dereferenceable(24) %"struct.std::__1::basic_string<char>::__rep"* @_ZNKSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstEv(%"class.std::__1::__compressed_pair"* noundef nonnull align 8 dereferenceable(24) %__r_) #12
  %0 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__rep", %"struct.std::__1::basic_string<char>::__rep"* %call, i32 0, i32 0
  %__s = bitcast %union.anon* %0 to %"struct.std::__1::basic_string<char>::__short"*
  %__data_ = getelementptr inbounds %"struct.std::__1::basic_string<char>::__short", %"struct.std::__1::basic_string<char>::__short"* %__s, i32 0, i32 0
  %arrayidx = getelementptr inbounds [23 x i8], [23 x i8]* %__data_, i64 0, i64 0
  %call2 = call noundef i8* @_ZNSt3__114pointer_traitsIPKcE10pointer_toERS1_(i8* noundef nonnull align 1 dereferenceable(1) %arrayidx) #12
  ret i8* %call2
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef i8* @_ZNSt3__114pointer_traitsIPKcE10pointer_toERS1_(i8* noundef nonnull align 1 dereferenceable(1) %__r) #2 align 2 {
entry:
  %__r.addr = alloca i8*, align 8
  store i8* %__r, i8** %__r.addr, align 8
  %0 = load i8*, i8** %__r.addr, align 8
  %call = call noundef i8* @_ZNSt3__1L9addressofIKcEEPT_RS2_(i8* noundef nonnull align 1 dereferenceable(1) %0) #12
  ret i8* %call
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable
define internal noundef i8* @_ZNSt3__1L9addressofIKcEEPT_RS2_(i8* noundef nonnull align 1 dereferenceable(1) %__x) #2 {
entry:
  %__x.addr = alloca i8*, align 8
  store i8* %__x, i8** %__x.addr, align 8
  %0 = load i8*, i8** %__x.addr, align 8
  ret i8* %0
}

attributes #0 = { mustprogress noinline optnone ssp uwtable "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.5a,+zcm,+zcz" }
attributes #1 = { convergent nofree nosync nounwind readnone willreturn }
attributes #2 = { mustprogress noinline nounwind optnone ssp uwtable "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.5a,+zcm,+zcz" }
attributes #3 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.5a,+zcm,+zcz" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { cold "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.5a,+zcm,+zcz" }
attributes #6 = { mustprogress noinline norecurse optnone ssp uwtable "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.5a,+zcm,+zcz" }
attributes #7 = { noinline nounwind optnone ssp uwtable "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.5a,+zcm,+zcz" }
attributes #8 = { nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.5a,+zcm,+zcz" }
attributes #9 = { noinline optnone ssp uwtable "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.5a,+zcm,+zcz" }
attributes #10 = { noinline noreturn nounwind }
attributes #11 = { cold }
attributes #12 = { nounwind }
attributes #13 = { noreturn }
attributes #14 = { noreturn nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 13, i32 1]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 1, !"branch-target-enforcement", i32 0}
!3 = !{i32 1, !"sign-return-address", i32 0}
!4 = !{i32 1, !"sign-return-address-all", i32 0}
!5 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
!6 = !{i32 7, !"PIC Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 1}
!8 = !{i32 7, !"frame-pointer", i32 1}
!9 = !{!"clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !11}
!13 = distinct !{!13, !11}
!14 = distinct !{!14, !11}
