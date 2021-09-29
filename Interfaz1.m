function varargout = Interfaz1(varargin)
% INTERFAZ1 MATLAB code for Interfaz1.fig
%      INTERFAZ1, by itself, creates a new INTERFAZ1 or raises the existing
%      singleton*.
%
%      H = INTERFAZ1 returns the handle to a new INTERFAZ1 or the handle to
%      the existing singleton*.
%
%      INTERFAZ1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERFAZ1.M with the given input arguments.
%
%      INTERFAZ1('Property','Value',...) creates a new INTERFAZ1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Interfaz1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Interfaz1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Interfaz1

% Last Modified by GUIDE v2.5 25-Sep-2021 22:20:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Interfaz1_OpeningFcn, ...
                   'gui_OutputFcn',  @Interfaz1_OutputFcn, ...
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


% --- Executes just before Interfaz1 is made visible.
function Interfaz1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Interfaz1 (see VARARGIN)

% Choose default command line output for Interfaz1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Interfaz1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Interfaz1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in SalirV1.
function SalirV1_Callback(hObject, eventdata, handles)
% hObject    handle to SalirV1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(Interfaz1);

% --- Executes on button press in LimpiarV1.
function LimpiarV1_Callback(hObject, eventdata, handles)
% hObject    handle to LimpiarV1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
logo=imread('fondo.png');
%

%
axes(handles.Pcam2V1);
imshow(logo);
set(handles.Pcam2V1,'Visible','Off');%pantalla
set(handles.ListOpcV1,'Visible','Off');%opciones de imagen
set(handles.ProcesarV1,'Visible','Off');%procesar imagen
set(handles.text_score,'String','');
set(handles.LimpiarV1,'visible','Off');
set(handles.EncenderCamV1,'visible','off');
set(handles.ApagarCamV1,'visible','On');

% --- Executes on button press in ProcesarV1.
function ProcesarV1_Callback(hObject, eventdata, handles)
% % hObject    handle to ProcesarV1 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% global BBOX
% set(handles.LimpiarV1,'Visible','On');
% foto=imread('C:\Users\edgar\Documents\MATLAB\proyectofinal3\fotos\imagen_in.jpg');
%     imagen_gray=rgb2gray(foto);
%     facedetector=vision.CascadeObjectDetector();
%     BBOX=step(facedetector,foto);
%     recorte=imcrop(imagen_gray,BBOX(1,:));
%     area_trabajo=imresize(recorte,[64 48]);
%     axes(handles.Pcam2V1);
%     imshow(area_trabajo);
%     folder='C:\Users\edgar\Documents\MATLAB\proyectofinal3\fotos';
%     imwrite(area_trabajo,fullfile(folder,'area_trabajo.jpg'));
%     
%  %se inicia el procesamiento PCA-- analiis de componentes principales
%  %cambiar el tamaño de las imagenes cambiamos a escala de grises
%  input_dir='C:\Users\edgar\Documents\MATLAB\proyectofinal3\fotos';
%  image_dimensiones=[64 48];
%  filenames=dir(fullfile(input_dir,'*,jpg'));%lista y lee las imagenes que hay en la carpeta, genera un specifico archivo
%  
%  %elementos de una matriz y definimos la matriz
%  num_images=numel(filenames); %retorna el numero de elementos en una matriz
%  images=[]; %se crea una matriz
%  
%  %la matriz de la imagen se pasa a un vector
%  for n=1:num_images %para cada imagen que este en la carpeta
%        filename=fullfile(inputdir,filenames(n).name);%se selecciona la imagen
%        img1=imread(filename); %se lee la imagen
%        img1=im2double(img1); %doble presicion reescalar los datos 
%        img = imresize(img1,[64 48]);%NaN; retorna una imagen que escala el tamaño de recorte
%        img=img(:,:,1);
%        
%        if n==1
%            images=zeros(prod(image_dimensiones),num_images);
%        end
%       images(:,n)=img(:); %se guarda en un vector la imagen correspondiente
%  end
%  
%  %hallamos el promedio de las imagenes 
%  mean_face=mean(images,2); %obtiene media o promedio de los vectores
%  rep=repmat(mean_face,1,num_images); %devuelve una vector de n copias
%  
%  %normalizamos
%  normalizar=images-rep;%sustrae la informacion  mas importante transeferencia de imagen
% %hallamos la matriz de covarianza************
% %calculamos los vectores propios de la matriz de covarianza**************
% [evectors,~,~]=pca(images');%calcula los eigenvectors, score puntuacion de componentes prin.
% num_eigenvectors=30;%se limita a 20 el numero de los eigenvectors
% evectors=evectors(:,1:num_eigenvectors);
% 
% features=evectors'*normalizar;%se proyectan las imagenes dentro
%  %de un subespacio para generar matriz de media
%  
%  input_work=imread('C:\Users\edgar\Documents\MATLAB\proyectofinal3\fotos\area_trabajo.jpg');
%  input_work=imresize(input_work,[64 48]);% se adapta el area de trabajo con la que se va a trabajar
%  input_work=im2double(input_work);%se realiza la comparacion
%  
%  %calcular la similitud con cada imagen de la carpeta
%  %en base a la distancia euclidiana inversa
%  
%  features_vec=evectors'*(input_work(:)-mean_face);%vector carasteristico
%  similarity_score=arrayfun(@(n)1/(norm(features(:,n)-features_vec)),1:num_images);%similitud score 
%  %encuentra la imagen con mayor similitud
%  [match_score,match_1x]=max(similarity_score);%devuelve los elementos mas grandes de la matriz
%  similarity_score*100
%  match_score*100
%  
%  %condiciones para la imagen
%  if match_score>=0.5 
%      foto_gan=filenames(match_1x).name;
%      foto_win=imread(foto_gan);
%      foto_win=imresize(foto_win,image_dimensiones);
%      axes(handles.Pcam1V1);
%      imshow(foto_win);
%      
%      texto=sprintf('La mayor semejanza es con la imagen %s de la base de datos con un score %s',foto_gan,match_score);
%      set(handles.text_score,'String',texto);
%      set(handles.text_score,'Visible','On');
%      
%      %en el caso de que no este registrado incognito
%  else
%      foto_=imread('incognito.jpg');
%      axes(handles.Pcam1V1);
%      imshow(foto_);
%      texto=sprintf('la semejanza es minima,esta persona no esta registrada');
%      set(handles.text_score,'String',texto);
%      set(handles.text_score,'Visible','On');
%  end
    % hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global BBOX

foto=imread('C:\Users\edgar\Documents\MATLAB\proyectofinal3\fotos\imagen_in.jpg');
    imagen_gray=rgb2gray(foto);
    facedetector=vision.CascadeObjectDetector();
    BBOX=step(facedetector,foto);
    recorte=imcrop(imagen_gray,BBOX(1,:));
    work_area=imresize(recorte,[64 48]);
    axes(handles.Pcam1V1);
    imshow(work_area);
    folder='C:\Users\edgar\Documents\MATLAB\proyectofinal3\fotos';
    imwrite(work_area,fullfile(folder,'area_trabajo.jpg'));

%aqui se viene lo chido...
input_dir='C:\Users\edgar\Documents\MATLAB\proyectofinal3\fotos\Data';
image_dimensiones=[64,48];%se estandarizan medidas
filenames=dir(fullfile(input_dir,'*.jpg'));%lista y lee las imagenes que hay en la carpeta

%ELEMENTOS DE UNA MATRIZ Y DEFINIMOS LA MATRIZ
num_images=numel(filenames)		%retorna el numero de elementos de una matriz
images=[];				%crear matriz
%la matriz de la imagen se pasa a un vector
for n=1:num_images		%imagenes en la carpeta
	filename=fullfile(input_dir,filenames(n).name);%se selecciona la imagen
	img1=imread(filename);	%se lee la imagen
%img2=rgb2gray(img)
	img1=im2double(img1);	%doble precision reescalar los datos
	img=imresize(img1,[64 48]); %retorna una imagen que es scala veces el tamanio de recorte
	img=img(:,:,1);
%///////////////////////
	if n==1
		images=zeros(prod(image_dimensiones),num_images);%se establece el vector que contiene los valores
		end 
	images(:,n)=img(:);  %se guarda en un vector la imagen correspondiente
end

%hallamos el promedio de las imagenes******************************
mean_face=mean(images,2); 	%obtiene media o promedio de los vectores
rep=repmat(mean_face,1,num_images);	%devuelve un vector de n copias

%normalizamos******
normalizar=images-rep;	%sustrae la informacion mas importatne 

%hallamos la matriz de covarianza************
%calculamos los vectores propios de la matriz de covarianza**************
[evectors,~,~]=pca(images');%calcula los eigenvectors, score puntuacion de componentes prin.
num_eigenvectors=30;%se limita a 20 el numero de los eigenvectors
evectors=evectors(:,1:num_eigenvectors);

features=evectors'*normalizar;%se proyectan las imagenes dentro
%de un subespacio para generar (vectores caracteristicos)matriz de media 0

input_work=imread('C:\Users\edgar\Documents\MATLAB\proyectofinal3\fotos\area_trabajo.jpg');%input_work=imread9'area_trabajo.jpg');
input_work=imresize(input_work,[64 48]) ;%se adapta el area de trabajo con la que se va a trabajar
input_work=im2double(input_work);

%calcular la similaridadde la entrada con cada imagen de la carpeta***********
%en base a ala distancia euclidiana inversa***********************************

feature_vec=evectors'*(input_work(:)-mean_face);%vector caracteristico
similarity_score=arrayfun(@(n)1/(norm(features(:,n)-feature_vec)),1:num_images);
%encuentra la imagen con mayor similitud
[match_score,match_1x]=max(similarity_score);%devuelve los elementos mas grandes de la matriz
%match_score=match_score/100
similarity_score*100;

match=match_score*100

%condiciones para la imagen***************************************************
if match>=18 %mayor a 0.5
    foto_gan=filenames(match_1x).name;
    
    
    
    %---------------------------------------------
    
    texto=sprintf('Rostro Reconocido con una similitud de %s a la foto %s',match, foto_gan );
    set(handles.text_score,'String',texto);
    set(handles.text_score,'Visible','on');
    %de lo contrario
else
    
    
    texto=sprintf('Rostro desconocido');
	set(handles.text_score,'String',texto);
	set(handles.text_score,'Visible','on'); 
    
end 

% --- Executes on selection change in ListOpcV1.
function ListOpcV1_Callback(hObject, eventdata, handles)
% hObject    handle to ListOpcV1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global BBOX
value = get(handles.ListOpcV1,'Value')
switch value
    case 2 %original
        foto=imread('C:\Users\edgar\Documents\MATLAB\proyectofinal3\fotos\imagen_in.jpg');
        axes(handles.Pcam2V1);
        imshow(foto);
    case 3 %escala de grises
        foto=imread('C:\Users\edgar\Documents\MATLAB\proyectofinal3\fotos\imagen_in.jpg');
        imagen_gray=rgb2gray(foto);
        axes(handles.Pcam2V1);
        imshow(imagen_gray);
    case 4 %negativo
        foto=imread('C:\Users\edgar\Documents\MATLAB\proyectofinal3\fotos\imagen_in.jpg');
        imagen_gray=rgb2gray(foto);
        g= imadjust(imagen_gray,[0 1],[1 0]);
        axes(handles.Pcam2V1);
        imshow(g);
    case 5 %binarizacion
        foto=imread('C:\Users\edgar\Documents\MATLAB\proyectofinal3\fotos\imagen_in.jpg');
        imagen_gray=rgb2gray(foto);
        umb=graythresh(imagen_gray);
        bw=im2bw(imagen_gray,umb);
        axes(handles.Pcam2V1);
        imshow(bw);
    case 6 %area de trabajo
        foto=imread('C:\Users\edgar\Documents\MATLAB\proyectofinal3\fotos\imagen_in.jpg');
        imagen_gray=rgb2gray(foto);
        recorte = imcrop(imagen_gray,BBOX(1,:));
        area_trabajo=imresize(recorte,[64 48]);
        axes(handles.Pcam2V1);
        imshow(area_trabajo);
        folder='C:\Users\edgar\Documents\MATLAB\proyectofinal3\fotos';
        imwrite(area_trabajo,fullfile(folder,'area_trabajo.jpg'));
    case 7 %ecualizacion
        foto=imread('C:\Users\edgar\Documents\MATLAB\proyectofinal3\fotos\imagen_in.jpg');
        imagen_gray=rgb2gray(foto);
        imagen_bn=histeq(imagen_gray,256);
        axes(handles.Pcam2V1);
        imshow(imagen_bn);
end

% Hints: contents = cellstr(get(hObject,'String')) returns ListOpcV1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ListOpcV1


% --- Executes during object creation, after setting all properties.
function ListOpcV1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ListOpcV1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to text_score (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text_score as text
%        str2double(get(hObject,'String')) returns contents of text_score as a double


% --- Executes during object creation, after setting all properties.
function text_score_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_score (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in EncenderCamV1.
function EncenderCamV1_Callback(hObject, eventdata, handles)
% hObject    handle to EncenderCamV1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%coloco visible el axe 2
%set(handles.TexCam,'visible','on');
%set(handles.ApagarCam,'visible','on');
global vid
set(handles.EncenderCamV1,'visible','off');
set(handles.ApagarCamV1,'visible','on');

axes(handles.Pcam1V1);
%se activa la camara en este caso mi camara web usb
%se especifica la camara que se usara en este caso la 2
vid=videoinput('winvideo',2)
%se convierte a rgb
vid.ReturnedColorSpace='rgb';
vidRes = get(vid,'VideoResolution');
nBands = get(vid,'NumberOfBands');
hImage = image(zeros(vidRes(2),vidRes(1),nBands));
preview(vid,hImage);


% --- Executes on button press in CrearUsuarioV1.
function CrearUsuarioV1_Callback(hObject, eventdata, handles)
% hObject    handle to CrearUsuarioV1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(Interfaz1);
Interfaz2;

% --- Executes on button press in CapturarV1.
function CapturarV1_Callback(hObject, eventdata, handles)
% hObject    handle to CapturarV1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global vid
global BBOX
set(handles.Pcam2V1,'Visible','On');%pantalla
set(handles.ListOpcV1,'Visible','On');%opciones de imagen
set(handles.LimpiarV1,'Visible','On');%limpiar
set(handles.ProcesarV1,'Visible','On');%procesar imagen
    foto=getsnapshot(vid);%capturar
    facedetector=vision.CascadeObjectDetector();%barrido en toda la imagen
    BBOX=step(facedetector,foto);%encuentra el rostro
    axes(handles.Pcam2V1);%procesar
    imshow(foto)%muestra la imagen
        if isempty(BBOX)
           msj=questdlg('No se encuentra ningun rostro','Mesaje','OK','OK');
                    logo=imread('fondo.png');
                    axes(handles.Pcam2V1);
                    imshow(logo);
                    set(handles.Pcam2V1,'Visible','Off');%pantalla
                    set(handles.ListOpcV1,'Visible','Off');%opciones de imagen
                    set(handles.ProcesarV1,'Visible','Off');%procesar imagen
                    set(handles.text_score,'String','');
                    set(handles.LimpiarV1,'visible','Off');
                    set(handles.EncenderCamV1,'visible','Off');
                    set(handles.ApagarCamV1,'visible','On');
           if strcmp(msj,'OK')
               
           return;
           end
        end
    rectangle('position',BBOX(1,:),'edgecolor','r','linewidth',2);
    folder='C:\Users\edgar\Documents\MATLAB\proyectofinal3\fotos';
    imwrite(foto,fullfile(folder,'imagen_in.jpg'));
%foto = insertObjectAnnotation(foto,'rectangle',B,'Rostro');
%rectangle('position',BBOX(1,:),'edgecolor','b','linewidth',2);

% --- Executes on button press in ApagarCamV1.
function ApagarCamV1_Callback(hObject, eventdata, handles)
% hObject    handle to ApagarCamV1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.EncenderCamV1,'visible','on');
set(handles.ApagarCamV1,'visible','off');
closepreview;
fondo=imread('fondo.png');
axes(handles.Pcam1V1);
imshow(fondo);
