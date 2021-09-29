function varargout = Interfaz2(varargin)
% INTERFAZ2 MATLAB code for Interfaz2.fig
%      INTERFAZ2, by itself, creates a new INTERFAZ2 or raises the existing
%      singleton*.
%
%      H = INTERFAZ2 returns the handle to a new INTERFAZ2 or the handle to
%      the existing singleton*.
%
%      INTERFAZ2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERFAZ2.M with the given input arguments.
%
%      INTERFAZ2('Property','Value',...) creates a new INTERFAZ2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Interfaz2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Interfaz2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Interfaz2

% Last Modified by GUIDE v2.5 25-Sep-2021 03:30:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Interfaz2_OpeningFcn, ...
                   'gui_OutputFcn',  @Interfaz2_OutputFcn, ...
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


% --- Executes just before Interfaz2 is made visible.
function Interfaz2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Interfaz2 (see VARARGIN)

% Choose default command line output for Interfaz2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Interfaz2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Interfaz2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in GuardarV2.
function GuardarV2_Callback(hObject, eventdata, handles)
% hObject    handle to GuardarV2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


global area_trabajo
    folder='C:\Users\edgar\Documents\MATLAB\proyectoFinal3\fotos\Data';
    nombre=get(handles.Editname,'String');
    
    
   if isempty(nombre)
       msj=questdlg('ingrese un nombre de usuario','Mesaje','OK','OK');
       if strcmp(msj,'OK')
       return;
       end
   end
    
   
   nombre=char(nombre);%concatena cadena horizontal
    name=strcat(nombre,'.jpg')
    imwrite(area_trabajo,fullfile(folder,name));
    msj=questdlg('se guardo correctamente','Mensaje','OK','OK');
    close(Interfaz2);
        Interfaz1;


function Editname_Callback(hObject, eventdata, handles)
% hObject    handle to Editname (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Editname as text
%        str2double(get(hObject,'String')) returns contents of Editname as a double


% --- Executes during object creation, after setting all properties.
function Editname_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Editname (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EditCod_Callback(hObject, eventdata, handles)
% hObject    handle to EditCod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditCod as text
%        str2double(get(hObject,'String')) returns contents of EditCod as a double


% --- Executes during object creation, after setting all properties.
function EditCod_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditCod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in EncenderCamV2.
function EncenderCamV2_Callback(hObject, eventdata, handles)
% hObject    handle to EncenderCamV2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global vid
set(handles.EncenderCamV2,'visible','off');
set(handles.ApagarCamV2,'visible','on');

set(handles.Pcam1V2,'visible','on');
axes(handles.Pcam1V2);
%se activa la camara en este caso mi camara web usb
%se especifica la camara que se usara en este caso la 2
vid=videoinput('winvideo',2)
%se convierte a rgb
vid.ReturnedColorSpace='rgb';
vidRes = get(vid,'VideoResolution');
nBands = get(vid,'NumberOfBands');
hImage = image(zeros(vidRes(2),vidRes(1),nBands));
preview(vid,hImage);


% --- Executes on button press in ApagarCamV2.
function ApagarCamV2_Callback(hObject, eventdata, handles)
% hObject    handle to ApagarCamV2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
closepreview;
fondo=imread('fondo.png');
axes(handles.Pcam1V2);
imshow(fondo);

% --- Executes on button press in CapturarV2.
function CapturarV2_Callback(hObject, eventdata, handles)
% hObject    handle to CapturarV2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global vid
global BBOX2
global area_trabajo
set(handles.Pcam2V2,'Visible','On');%activar pantalla
set(handles.GuardarV2,'Visible','On');%guardar
set(handles.text2,'Visible','On');
set(handles.Editname,'Visible','On');%nombre


    foto=getsnapshot(vid);%capturar
    imagen_gray=rgb2gray(foto);
    facedetector=vision.CascadeObjectDetector();%barrido en toda la imagen
    BBOX2=step(facedetector,foto);%encuentra el rostro
    recorte=imcrop(imagen_gray,BBOX2(1,:));
    area_trabajo=imresize(recorte,[64 48]);
    axes(handles.Pcam2V2);%procesar
    imshow(foto)%muestra la imagen
    rectangle('position',BBOX2(1,:),'edgecolor','r','linewidth',2);

% --- Executes on button press in AbrirImagenV2.
function AbrirImagenV2_Callback(hObject, eventdata, handles)
% hObject    handle to AbrirImagenV2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in CancelarV2.
function CancelarV2_Callback(hObject, eventdata, handles)
% hObject    handle to CancelarV2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(Interfaz2);
Interfaz1;
