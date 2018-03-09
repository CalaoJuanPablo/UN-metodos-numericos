function varargout = laboratorio1(varargin)
% LABORATORIO1 M-file for laboratorio1.fig
%      LABORATORIO1, by itself, creates a new LABORATORIO1 or raises the existing
%      singleton*.
%
%      H = LABORATORIO1 returns the handle to a new LABORATORIO1 or the handle to
%      the existing singleton*.
%
%      LABORATORIO1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LABORATORIO1.M with the given input arguments.
%
%      LABORATORIO1('Property','Value',...) creates a new LABORATORIO1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before laboratorio1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to laboratorio1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help laboratorio1

% Last Modified by GUIDE v2.5 26-Oct-2013 20:48:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @laboratorio1_OpeningFcn, ...
                   'gui_OutputFcn',  @laboratorio1_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before laboratorio1 is made visible.
function laboratorio1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to laboratorio1 (see VARARGIN)

% Choose default command line output for laboratorio1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes laboratorio1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = laboratorio1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
x=str2num(get(handles.edit1,'String'));
fx=str2num(get(handles.edit2,'String'));
xinterp=str2num(get(handles.edit3,'String'));
yinterp=lagrange(x,fx,xinterp);
set(handles.edit4,'String',num2str(yinterp));



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
x=str2num(get(handles.edit5,'String'));
y=str2num(get(handles.edit6,'String'));
xajus=x.^(-1);
yajus=y;
N=length(x);
ex=sum(xajus);
ex2=sum(xajus.^2);
b1=sum(yajus);
b2=sum(yajus.*xajus);
M=[N ex;ex ex2];
b=[b1 b2];
b=b';
coef=inv(M)*b;
pol='y=';
pol=strcat(pol,num2str(coef(2)),'*1/x + ',num2str(coef(1)));
xg=x(1):0.1:x(N);
yg=coef(1) + coef(2).*xg.^(-1);
set(handles.edit7,'String',pol);
figure(1)
plot(xg,yg);




function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
x=str2num(get(handles.edit5,'String'));
y=str2num(get(handles.edit6,'String'));
xajus=x.*y;
yajus=y;
N=length(x);
ex=sum(xajus);
ex2=sum(xajus.^2);
b1=sum(yajus);
b2=sum(yajus.*xajus);
M=[N ex;ex ex2];
b=[b1 b2];
b=b';
coef=inv(M)*b;
C=-1/coef(2);
D=C*coef(1);
pol='y=';
pol=strcat(pol,num2str(D),'/(x+',num2str(C),')');
xg=x(1):0.1:x(N);
yg=(D./C)./(1 + xg./C);
set(handles.edit9,'String',pol);
figure(2)
plot(xg,yg);




function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
x=str2num(get(handles.edit5,'String'));
y=str2num(get(handles.edit6,'String'));
xajus=x;
yajus=y.^(-1);
N=length(x);
ex=sum(xajus);
ex2=sum(xajus.^2);
b1=sum(yajus);
b2=sum(yajus.*xajus);
M=[N ex;ex ex2];
b=[b1 b2];
b=b';
coef=inv(M)*b;
pol='y=';
pol=strcat(pol,'1/(',num2str(coef(2)),'*x + ',num2str(coef(1)),')');
xg=x(1):0.1:x(N);
yg=(coef(1) + coef(2).*xg).^(-1);
set(handles.edit10,'String',pol);
figure(3)
plot(xg,yg);




function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
x=str2num(get(handles.edit5,'String'));
y=str2num(get(handles.edit6,'String'));
xajus=x.^(-1);
yajus=y.^(-1);
N=length(x);
ex=sum(xajus);
ex2=sum(xajus.^2);
b1=sum(yajus);
b2=sum(yajus.*xajus);
M=[N ex;ex ex2];
b=[b1 b2];
b=b';
coef=inv(M)*b;
pol='y=';
pol=strcat(pol,'x/(',num2str(coef(2)),'*x + ',num2str(coef(1)),')');xg=x(1):0.1:x(N);
yg=(coef(1) + coef(2).*xg).^(-1);
set(handles.edit11,'String',pol);
figure(5)
plot(xg,yg);



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
x=str2num(get(handles.edit5,'String'));
y=str2num(get(handles.edit6,'String'));
xajus=log(x);
yajus=y;
N=length(x);
ex=sum(xajus);
ex2=sum(xajus.^2);
b1=sum(yajus);
b2=sum(yajus.*xajus);
M=[N ex;ex ex2];
b=[b1 b2];
b=b';
coef=inv(M)*b;
pol='y=';
pol=strcat(pol,num2str(coef(2)),'*ln(x) + ',num2str(coef(1)));
xg=x(1):0.1:x(N);
yg=coef(1) + coef(2).*log(xg);
set(handles.edit12,'String',pol);
figure(4)
plot(xg,yg);




function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
x=str2num(get(handles.edit5,'String'));
y=str2num(get(handles.edit6,'String'));
xajus=x;
yajus=log(y);
N=length(x);
ex=sum(xajus);
ex2=sum(xajus.^2);
b1=sum(yajus);
b2=sum(yajus.*xajus);
M=[N ex;ex ex2];
b=[b1 b2];
b=b';
coef=inv(M)*b;
A=coef(2);
C=exp(coef(1));
pol='y=';
pol=strcat(pol,num2str(C),'*exp(',num2str(A), '*x)');
xg=x(1):0.1:x(N);
yg=coef(1) + coef(2).*log(xg);
set(handles.edit13,'String',pol);
figure(6)
plot(xg,yg)




function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
x=str2num(get(handles.edit5,'String'));
y=str2num(get(handles.edit6,'String'));
xajus=log(x);
yajus=log(y);
N=length(x);
ex=sum(xajus);
ex2=sum(xajus.^2);
b1=sum(yajus);
b2=sum(yajus.*xajus);
M=[N ex;ex ex2];
b=[b1 b2];
b=b';
coef=inv(M)*b;
A=coef(2);
C=exp(coef(1));
pol='y=';
pol=strcat(pol,num2str(C),'*exp(',num2str(A), '*x)');
xg=x(1):0.1:x(N);
yg=coef(1) + coef(2).*log(xg);
set(handles.edit14,'String',pol);
figure(7)
plot(xg,yg)


function edit15_Callback(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit15 as text
%        str2double(get(hObject,'String')) returns contents of edit15 as a double


% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit16_Callback(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit16 as text
%        str2double(get(hObject,'String')) returns contents of edit16 as a double


% --- Executes during object creation, after setting all properties.
function edit16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
x=str2num(get(handles.edit5,'String'));
y=str2num(get(handles.edit6,'String'));
xajus=x;
yajus=y.^(-1/2);
N=length(x);
ex=sum(xajus);
ex2=sum(xajus.^2);
b1=sum(yajus);
b2=sum(yajus.*xajus);
M=[N ex;ex ex2];
b=[b1 b2];
b=b';
coef=inv(M)*b;
A=coef(2);
B=coef(1);
pol='y=';
pol=strcat(pol,'(',num2str(A),'*x + ',num2str(B), ')');
xg=x(1):0.1:x(N);
yg=coef(1) + coef(2).*log(xg);
set(handles.edit15,'String',pol);
figure(8)
plot(xg,yg)


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
x=str2num(get(handles.edit5,'String'));
y=str2num(get(handles.edit6,'String'));
xajus=-x;
yajus=log(y./x);
N=length(x);
ex=sum(xajus);
ex2=sum(xajus.^2);
b1=sum(yajus);
b2=sum(yajus.*xajus);
M=[N ex;ex ex2];
b=[b1 b2];
b=b';
coef=inv(M)*b;
D=coef(2);
C=exp(coef(1));
pol='y=';
pol=strcat(pol,num2str(C),'*x*exp(',num2str(D), '*x)');
xg=x(1):0.1:x(N);
yg=coef(1) + coef(2).*log(xg);
set(handles.edit16,'String',pol);
figure(9)
plot(xg,yg)
