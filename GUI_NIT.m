function varargout = GUI_NIT(varargin)
% GUI_NIT MATLAB code for GUI_NIT.fig
%      GUI_NIT, by itself, creates a new GUI_NIT or raises the existing
%      singleton*.
%
%      H = GUI_NIT returns the handle to a new GUI_NIT or the handle to
%      the existing singleton*.
%
%      GUI_NIT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_NIT.M with the given input arguments.
%
%      GUI_NIT('Property','Value',...) creates a new GUI_NIT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_NIT_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_NIT_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_NIT

% Last Modified by GUIDE v2.5 17-Nov-2017 14:54:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_NIT_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_NIT_OutputFcn, ...
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


% --- Executes just before GUI_NIT is made visible.
function GUI_NIT_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_NIT (see VARARGIN)

% Choose default command line output for GUI_NIT
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_NIT wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_NIT_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in BROWSE.
function BROWSE_Callback(hObject, eventdata, handles)
% hObject    handle to BROWSE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile('*.mp4', 'Pick an video');

    if isequal(filename,0) | isequal(pathname,0)
        
       warndlg('Video is not selected');
       
    else
       
      global c;
      c=strcat(pathname,filename);
        disp(c);
        motiontest(c);
        

% Update handles structure
guidata(hObject, handles);

    end


    
% --- Executes on button press in track.
function track_Callback(hObject, eventdata, handles)
% hObject    handle to track (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
global c;
singleObject(c);
% handles    structure with handles and user data (see GUIDATA)
% --- Executes on button press in EXIT.


function EXIT_Callback(hObject, eventdata, handles)
% hObject    handle to EXIT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all;


% --- Executes on button press in load_image.

function load_image_Callback(hObject, eventdata, handles)
% hObject    handle to load_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile({' *.jpg';'*png';'*bmp';'Pick an image'});
 %global c_image;  
    if isequal(filename,0) | isequal(pathname,0)
        
       warndlg('Image is not selected');
       
    else
       global c_image; 
      c_image=strcat(pathname,filename);     
      imshow(c_image);
      disp(c_image)
    
    end

% --- Executes on button press in detect_people.
function detect_people_Callback(hObject, eventdata, handles)
% hObject    handle to detect_people (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global c_image;
detectPeople(c_image);

% --- Executes on button press in detect_ball.
function detect_ball_Callback(hObject, eventdata, handles)
global c_image;
detectBalls(c_image);
% hObject    handle to detect_ball (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

