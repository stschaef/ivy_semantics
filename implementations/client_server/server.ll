; ModuleID = 'server.cpp'
source_filename = "server.cpp"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx13.0.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }
%struct.sockaddr_in = type { i8, i8, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.hostent = type { i8*, i8**, i32, i32, i8** }
%struct.sockaddr = type { i8, i8, [14 x i8] }

@__stderrp = external global %struct.__sFILE*, align 8
@.str = private unnamed_addr constant [18 x i8] c"%s: unknown host\0A\00", align 1
@.str.1 = private unnamed_addr constant [29 x i8] c"Error getting port of socket\00", align 1
@SEMAPHORE = global i8 1, align 1
@connected = global i32 -1, align 4
@.str.2 = private unnamed_addr constant [15 x i8] c"Connected to: \00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.4 = private unnamed_addr constant [5 x i8] c"none\00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.6 = private unnamed_addr constant [19 x i8] c"New connection %d\0A\00", align 1
@.str.7 = private unnamed_addr constant [29 x i8] c"Error reading stream message\00", align 1
@.str.8 = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str.9 = private unnamed_addr constant [21 x i8] c"Client %d says '%s'\0A\00", align 1
@.str.10 = private unnamed_addr constant [8 x i8] c"connect\00", align 1
@.str.11 = private unnamed_addr constant [24 x i8] c"Client %d is connected\0A\00", align 1
@.str.12 = private unnamed_addr constant [49 x i8] c"Server already connected. Client %d is rejected\0A\00", align 1
@.str.13 = private unnamed_addr constant [11 x i8] c"disconnect\00", align 1
@.str.14 = private unnamed_addr constant [27 x i8] c"Client %d is disconnected\0A\00", align 1
@.str.15 = private unnamed_addr constant [47 x i8] c"Client %d is not connected. Disconnect failed\0A\00", align 1
@.str.16 = private unnamed_addr constant [28 x i8] c"Error opening stream socket\00", align 1
@.str.17 = private unnamed_addr constant [29 x i8] c"Error setting socket options\00", align 1
@.str.18 = private unnamed_addr constant [28 x i8] c"Error binding stream socket\00", align 1
@.str.19 = private unnamed_addr constant [32 x i8] c"Server listening on port %d...\0A\00", align 1
@.str.20 = private unnamed_addr constant [27 x i8] c"Error accepting connection\00", align 1
@.str.21 = private unnamed_addr constant [26 x i8] c"Usage: ./server port_num\0A\00", align 1

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
  call void @perror(i8* noundef getelementptr inbounds ([29 x i8], [29 x i8]* @.str.1, i64 0, i64 0)) #8
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
define void @_Z17print_connectionsv() #0 {
entry:
  %call = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0))
  %0 = load i32, i32* @connected, align 4
  %cmp = icmp ne i32 %0, -1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i32, i32* @connected, align 4
  %call1 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i32 noundef %1)
  br label %if.end

if.else:                                          ; preds = %entry
  %call2 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4, i64 0, i64 0))
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call3 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i64 0, i64 0))
  ret void
}

declare i32 @printf(i8* noundef, ...) #3

; Function Attrs: mustprogress noinline optnone ssp uwtable
define noundef i32 @_Z17handle_connectioni(i32 noundef %connectionfd) #0 {
entry:
  %retval = alloca i32, align 4
  %connectionfd.addr = alloca i32, align 4
  %msg = alloca [257 x i8], align 1
  %recvd = alloca i64, align 8
  %rval = alloca i64, align 8
  %command = alloca i8*, align 8
  %client_id = alloca i32, align 4
  store i32 %connectionfd, i32* %connectionfd.addr, align 4
  %0 = load i32, i32* %connectionfd.addr, align 4
  %call = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([19 x i8], [19 x i8]* @.str.6, i64 0, i64 0), i32 noundef %0)
  %arraydecay = getelementptr inbounds [257 x i8], [257 x i8]* %msg, i64 0, i64 0
  call void @llvm.memset.p0i8.i64(i8* align 1 %arraydecay, i8 0, i64 257, i1 false)
  store i64 0, i64* %recvd, align 8
  br label %do.body

do.body:                                          ; preds = %do.cond, %entry
  %1 = load i32, i32* %connectionfd.addr, align 4
  %arraydecay1 = getelementptr inbounds [257 x i8], [257 x i8]* %msg, i64 0, i64 0
  %2 = load i64, i64* %recvd, align 8
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay1, i64 %2
  %3 = load i64, i64* %recvd, align 8
  %sub = sub i64 256, %3
  %call2 = call i64 @"\01_recv"(i32 noundef %1, i8* noundef %add.ptr, i64 noundef %sub, i32 noundef 0)
  store i64 %call2, i64* %rval, align 8
  %4 = load i64, i64* %rval, align 8
  %cmp = icmp eq i64 %4, -1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  call void @perror(i8* noundef getelementptr inbounds ([29 x i8], [29 x i8]* @.str.7, i64 0, i64 0)) #8
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %do.body
  %5 = load i64, i64* %rval, align 8
  %6 = load i64, i64* %recvd, align 8
  %add = add i64 %6, %5
  store i64 %add, i64* %recvd, align 8
  br label %do.cond

do.cond:                                          ; preds = %if.end
  %7 = load i64, i64* %rval, align 8
  %cmp3 = icmp sgt i64 %7, 0
  br i1 %cmp3, label %do.body, label %do.end, !llvm.loop !10

do.end:                                           ; preds = %do.cond
  %arraydecay4 = getelementptr inbounds [257 x i8], [257 x i8]* %msg, i64 0, i64 0
  %call5 = call i8* @strtok(i8* noundef %arraydecay4, i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8, i64 0, i64 0))
  store i8* %call5, i8** %command, align 8
  %call6 = call i8* @strtok(i8* noundef null, i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8, i64 0, i64 0))
  %call7 = call i32 @atoi(i8* noundef %call6)
  store i32 %call7, i32* %client_id, align 4
  %8 = load i32, i32* %client_id, align 4
  %9 = load i8*, i8** %command, align 8
  %call8 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.9, i64 0, i64 0), i32 noundef %8, i8* noundef %9)
  %10 = load i8*, i8** %command, align 8
  %call9 = call i32 @strcmp(i8* noundef %10, i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.10, i64 0, i64 0))
  %cmp10 = icmp eq i32 %call9, 0
  br i1 %cmp10, label %if.then11, label %if.end16

if.then11:                                        ; preds = %do.end
  %11 = load i8, i8* @SEMAPHORE, align 1
  %tobool = trunc i8 %11 to i1
  br i1 %tobool, label %if.then12, label %if.else

if.then12:                                        ; preds = %if.then11
  %12 = load i32, i32* %client_id, align 4
  %call13 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([24 x i8], [24 x i8]* @.str.11, i64 0, i64 0), i32 noundef %12)
  store i8 0, i8* @SEMAPHORE, align 1
  %13 = load i32, i32* %client_id, align 4
  store i32 %13, i32* @connected, align 4
  br label %if.end15

if.else:                                          ; preds = %if.then11
  %14 = load i32, i32* %client_id, align 4
  %call14 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([49 x i8], [49 x i8]* @.str.12, i64 0, i64 0), i32 noundef %14)
  br label %if.end15

if.end15:                                         ; preds = %if.else, %if.then12
  br label %if.end16

if.end16:                                         ; preds = %if.end15, %do.end
  %15 = load i8*, i8** %command, align 8
  %call17 = call i32 @strcmp(i8* noundef %15, i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.13, i64 0, i64 0))
  %cmp18 = icmp eq i32 %call17, 0
  br i1 %cmp18, label %if.then19, label %if.end26

if.then19:                                        ; preds = %if.end16
  %16 = load i32, i32* @connected, align 4
  %17 = load i32, i32* %client_id, align 4
  %cmp20 = icmp eq i32 %16, %17
  br i1 %cmp20, label %if.then21, label %if.else23

if.then21:                                        ; preds = %if.then19
  store i32 -1, i32* @connected, align 4
  store i8 1, i8* @SEMAPHORE, align 1
  %18 = load i32, i32* %client_id, align 4
  %call22 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([27 x i8], [27 x i8]* @.str.14, i64 0, i64 0), i32 noundef %18)
  br label %if.end25

if.else23:                                        ; preds = %if.then19
  %19 = load i32, i32* %client_id, align 4
  %call24 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([47 x i8], [47 x i8]* @.str.15, i64 0, i64 0), i32 noundef %19)
  br label %if.end25

if.end25:                                         ; preds = %if.else23, %if.then21
  br label %if.end26

if.end26:                                         ; preds = %if.end25, %if.end16
  call void @_Z17print_connectionsv()
  %20 = load i32, i32* %connectionfd.addr, align 4
  %call27 = call i32 @"\01_close"(i32 noundef %20)
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end26, %if.then
  %21 = load i32, i32* %retval, align 4
  ret i32 %21
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #6

declare i64 @"\01_recv"(i32 noundef, i8* noundef, i64 noundef, i32 noundef) #3

declare i8* @strtok(i8* noundef, i8* noundef) #3

declare i32 @atoi(i8* noundef) #3

declare i32 @strcmp(i8* noundef, i8* noundef) #3

declare i32 @"\01_close"(i32 noundef) #3

; Function Attrs: mustprogress noinline optnone ssp uwtable
define noundef i32 @_Z10run_serverii(i32 noundef %port, i32 noundef %queue_size) #0 {
entry:
  %retval = alloca i32, align 4
  %port.addr = alloca i32, align 4
  %queue_size.addr = alloca i32, align 4
  %sockfd = alloca i32, align 4
  %yesval = alloca i32, align 4
  %addr = alloca %struct.sockaddr_in, align 4
  %connectionfd = alloca i32, align 4
  store i32 %port, i32* %port.addr, align 4
  store i32 %queue_size, i32* %queue_size.addr, align 4
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 0)
  store i32 %call, i32* %sockfd, align 4
  %0 = load i32, i32* %sockfd, align 4
  %cmp = icmp eq i32 %0, -1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @perror(i8* noundef getelementptr inbounds ([28 x i8], [28 x i8]* @.str.16, i64 0, i64 0)) #8
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  store i32 1, i32* %yesval, align 4
  %1 = load i32, i32* %sockfd, align 4
  %2 = bitcast i32* %yesval to i8*
  %call1 = call i32 @setsockopt(i32 noundef %1, i32 noundef 65535, i32 noundef 4, i8* noundef %2, i32 noundef 4)
  %cmp2 = icmp eq i32 %call1, -1
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  call void @perror(i8* noundef getelementptr inbounds ([29 x i8], [29 x i8]* @.str.17, i64 0, i64 0)) #8
  store i32 -1, i32* %retval, align 4
  br label %return

if.end4:                                          ; preds = %if.end
  %3 = load i32, i32* %port.addr, align 4
  %call5 = call noundef i32 @_Z20make_server_sockaddrP11sockaddr_ini(%struct.sockaddr_in* noundef %addr, i32 noundef %3)
  %cmp6 = icmp eq i32 %call5, -1
  br i1 %cmp6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end4
  store i32 -1, i32* %retval, align 4
  br label %return

if.end8:                                          ; preds = %if.end4
  %4 = load i32, i32* %sockfd, align 4
  %5 = bitcast %struct.sockaddr_in* %addr to %struct.sockaddr*
  %call9 = call i32 @"\01_bind"(i32 noundef %4, %struct.sockaddr* noundef %5, i32 noundef 16)
  %cmp10 = icmp eq i32 %call9, -1
  br i1 %cmp10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end8
  call void @perror(i8* noundef getelementptr inbounds ([28 x i8], [28 x i8]* @.str.18, i64 0, i64 0)) #8
  store i32 -1, i32* %retval, align 4
  br label %return

if.end12:                                         ; preds = %if.end8
  %6 = load i32, i32* %sockfd, align 4
  %call13 = call noundef i32 @_Z15get_port_numberi(i32 noundef %6)
  store i32 %call13, i32* %port.addr, align 4
  %7 = load i32, i32* %port.addr, align 4
  %call14 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.19, i64 0, i64 0), i32 noundef %7)
  %8 = load i32, i32* %sockfd, align 4
  %9 = load i32, i32* %queue_size.addr, align 4
  %call15 = call i32 @"\01_listen"(i32 noundef %8, i32 noundef %9)
  br label %while.body

while.body:                                       ; preds = %if.end12, %if.end23
  %10 = load i32, i32* %sockfd, align 4
  %call16 = call i32 @"\01_accept"(i32 noundef %10, %struct.sockaddr* noundef null, i32* noundef null)
  store i32 %call16, i32* %connectionfd, align 4
  %11 = load i32, i32* %connectionfd, align 4
  %cmp17 = icmp eq i32 %11, -1
  br i1 %cmp17, label %if.then18, label %if.end19

if.then18:                                        ; preds = %while.body
  call void @perror(i8* noundef getelementptr inbounds ([27 x i8], [27 x i8]* @.str.20, i64 0, i64 0)) #8
  store i32 -1, i32* %retval, align 4
  br label %return

if.end19:                                         ; preds = %while.body
  %12 = load i32, i32* %connectionfd, align 4
  %call20 = call noundef i32 @_Z17handle_connectioni(i32 noundef %12)
  %cmp21 = icmp eq i32 %call20, -1
  br i1 %cmp21, label %if.then22, label %if.end23

if.then22:                                        ; preds = %if.end19
  store i32 -1, i32* %retval, align 4
  br label %return

if.end23:                                         ; preds = %if.end19
  br label %while.body, !llvm.loop !12

return:                                           ; preds = %if.then22, %if.then18, %if.then11, %if.then7, %if.then3, %if.then
  %13 = load i32, i32* %retval, align 4
  ret i32 %13
}

declare i32 @socket(i32 noundef, i32 noundef, i32 noundef) #3

declare i32 @setsockopt(i32 noundef, i32 noundef, i32 noundef, i8* noundef, i32 noundef) #3

declare i32 @"\01_bind"(i32 noundef, %struct.sockaddr* noundef, i32 noundef) #3

declare i32 @"\01_listen"(i32 noundef, i32 noundef) #3

declare i32 @"\01_accept"(i32 noundef, %struct.sockaddr* noundef, i32* noundef) #3

; Function Attrs: mustprogress noinline norecurse optnone ssp uwtable
define noundef i32 @main(i32 noundef %argc, i8** noundef %argv) #7 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %port = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %0 = load i32, i32* %argc.addr, align 4
  %cmp = icmp ne i32 %0, 2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([26 x i8], [26 x i8]* @.str.21, i64 0, i64 0))
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i8**, i8*** %argv.addr, align 8
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 1
  %2 = load i8*, i8** %arrayidx, align 8
  %call1 = call i32 @atoi(i8* noundef %2)
  store i32 %call1, i32* %port, align 4
  %3 = load i32, i32* %port, align 4
  %call2 = call noundef i32 @_Z10run_serverii(i32 noundef %3, i32 noundef 10)
  %cmp3 = icmp eq i32 %call2, -1
  br i1 %cmp3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  store i32 1, i32* %retval, align 4
  br label %return

if.end5:                                          ; preds = %if.end
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end5, %if.then4, %if.then
  %4 = load i32, i32* %retval, align 4
  ret i32 %4
}

attributes #0 = { mustprogress noinline optnone ssp uwtable "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.5a,+zcm,+zcz" }
attributes #1 = { convergent nofree nosync nounwind readnone willreturn }
attributes #2 = { mustprogress noinline nounwind optnone ssp uwtable "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.5a,+zcm,+zcz" }
attributes #3 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.5a,+zcm,+zcz" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { cold "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.5a,+zcm,+zcz" }
attributes #6 = { argmemonly nofree nounwind willreturn writeonly }
attributes #7 = { mustprogress noinline norecurse optnone ssp uwtable "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+v8.5a,+zcm,+zcz" }
attributes #8 = { cold }

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
