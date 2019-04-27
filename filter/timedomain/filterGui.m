function varargout = filterGui(varargin)
% FILTERGUI MATLAB code for filterGui.fig
%      FILTERGUI, by itself, creates a new FILTERGUI or raises the existing
%      singleton*.
%
%      H = FILTERGUI returns the handle to a new FILTERGUI or the handle to
%      the existing singleton*.
%
%      FILTERGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FILTERGUI.M with the given input arguments.
%
%      FILTERGUI('Property','Value',...) creates a new FILTERGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before filterGui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to filterGui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help filterGui

% Last Modified by GUIDE v2.5 27-Apr-2019 18:09:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @filterGui_OpeningFcn, ...
                   'gui_OutputFcn',  @filterGui_OutputFcn, ...
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


% --- Executes just before filterGui is made visible.
function filterGui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to filterGui (see VARARGIN)

% Choose default command line output for filterGui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes filterGui wait for user response (see UIRESUME)
% uiwait(handles.figure1);

%Delaration of GLOBAL VARIABLES
global Ctler;
Ctler = struct('freqMatrix', [], ...
               'chooseDomain', 1, ...
               'freqParameter', [1 1 1 1 1 1 1 1 1 1], ...
               'chooseStyle', [], ...
               'isPause', [0], ...
               'isExit', 0, ...
               'isChanged', [1]);
%

% --- Outputs from this function are returned to the command line.
function varargout = filterGui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider_playTime_Callback(hObject, eventdata, handles)
% hObject    handle to slider_playTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider_playTime_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_playTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



% --- Executes on button press in pushbutton_nextSong.
function pushbutton_nextSong_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_nextSong (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton_preSong.
function pushbutton_preSong_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_preSong (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on slider movement.
function slider_31Hz_Callback(hObject, eventdata, handles)
% hObject    handle to slider_31Hz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global Ctler;
temp = get(hObject, 'Value');
Ctler.freqParameter(1) = 6 * temp
Ctler.isChanged = 1;
%testRealtimeEuqalizer(Ctler.freqParameter, Ctler.isPause, Ctler.isExit);



% --- Executes during object creation, after setting all properties.
function slider_31Hz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_31Hz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.

%Initialize position to 'center'
set(hObject, 'Value', 0.5);

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_62Hz_Callback(hObject, eventdata, handles)
% hObject    handle to slider_62Hz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global Ctler;
temp = get(hObject, 'Value');
Ctler.freqParameter(2) = 6 * temp
Ctler.isChanged = 1;
%testRealtimeEuqalizer(Ctler.freqParameter, Ctler.isPause, Ctler.isExit);


% --- Executes during object creation, after setting all properties.
function slider_62Hz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_62Hz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
set(hObject, 'Value', 0.5);


% --- Executes on slider movement.
function slider_125Hz_Callback(hObject, eventdata, handles)
% hObject    handle to slider_125Hz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global Ctler;
temp = get(hObject, 'Value');
Ctler.freqParameter(3) = 6 * temp
Ctler.isChanged = 1;
%testRealtimeEuqalizer(Ctler.freqParameter, Ctler.isPause, Ctler.isExit);


% --- Executes during object creation, after setting all properties.
function slider_125Hz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_125Hz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
%Initialize position to 'center'
set(hObject, 'Value', 0.5);


% --- Executes on slider movement.
function slider_250Hz_Callback(hObject, eventdata, handles)
% hObject    handle to slider_250Hz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global Ctler;
temp = get(hObject, 'Value');
Ctler.freqParameter(4) = 6 * temp
Ctler.isChanged = 1;
%testRealtimeEuqalizer(Ctler.freqParameter, Ctler.isPause, Ctler.isExit);


% --- Executes during object creation, after setting all properties.
function slider_250Hz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_250Hz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
set(hObject, 'Value', 0.5);


% --- Executes on slider movement.
function slider_500Hz_Callback(hObject, eventdata, handles)
% hObject    handle to slider_500Hz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global Ctler;
temp = get(hObject, 'Value');
Ctler.freqParameter(5) = 6 * temp
Ctler.isChanged = 1;
%testRealtimeEuqalizer(Ctler.freqParameter, Ctler.isPause, Ctler.isExit);


% --- Executes during object creation, after setting all properties.
function slider_500Hz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_500Hz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
%Initialize position to 'center'
set(hObject, 'Value', 0.5);


% --- Executes on slider movement.
function slider_1kHz_Callback(hObject, eventdata, handles)
% hObject    handle to slider_1kHz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global Ctler;
temp = get(hObject, 'Value');
Ctler.freqParameter(6) = 6 * temp
Ctler.isChanged = 1;
%testRealtimeEuqalizer(Ctler.freqParameter, Ctler.isPause, Ctler.isExit);


% --- Executes during object creation, after setting all properties.
function slider_1kHz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_1kHz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
set(hObject, 'Value', 0.5);


% --- Executes on slider movement.
function slider_2kHz_Callback(hObject, eventdata, handles)
% hObject    handle to slider_2kHz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global Ctler;
temp = get(hObject, 'Value');
Ctler.freqParameter(7) = 6 * temp
Ctler.isChanged = 1;
%testRealtimeEuqalizer(Ctler.freqParameter, Ctler.isPause, Ctler.isExit);


% --- Executes during object creation, after setting all properties.
function slider_2kHz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_2kHz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
%Initialize position to 'center'
set(hObject, 'Value', 0.5);


% --- Executes on slider movement.
function slider_4kHz_Callback(hObject, eventdata, handles)
% hObject    handle to slider_4kHz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global Ctler;
temp = get(hObject, 'Value');
Ctler.freqParameter(8) = 6 * temp
Ctler.isChanged = 1;
%testRealtimeEuqalizer(Ctler.freqParameter, Ctler.isPause, Ctler.isExit);


% --- Executes during object creation, after setting all properties.
function slider_4kHz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_4kHz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
set(hObject, 'Value', 0.5);


% --- Executes on slider movement.
function slider_8kHz_Callback(hObject, eventdata, handles)
% hObject    handle to slider_8kHz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global Ctler;
temp = get(hObject, 'Value');
Ctler.freqParameter(9) = 6 * temp
Ctler.isChanged = 1;
%testRealtimeEuqalizer(Ctler.freqParameter, Ctler.isPause, Ctler.isExit);


% --- Executes during object creation, after setting all properties.
function slider_8kHz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_8kHz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
%Initialize position to 'center'
set(hObject, 'Value', 0.5);


% --- Executes on slider movement.
function slider_16kHz_Callback(hObject, eventdata, handles)
% hObject    handle to slider_16kHz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global Ctler;
temp = get(hObject, 'Value');
Ctler.freqParameter(10) = 6 * temp
Ctler.freqParameter(11) = 1
Ctler.isChanged = 1;
%testRealtimeEuqalizer(Ctler.freqParameter, Ctler.isPause, Ctler.isExit);


% --- Executes during object creation, after setting all properties.
function slider_16kHz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_16kHz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
%Initialize position to 'center'
set(hObject, 'Value', 0.5);


% --- Executes on button press in radiobutton_3D_surround.
function radiobutton_3D_surround_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_3D_surround (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_3D_surround
global Ctler;


% --- Executes on button press in radiobutton_EletricSound.
function radiobutton_EletricSound_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_EletricSound (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_EletricSound
global Ctler;


% --- Executes on button press in radiobutton_recorder.
function radiobutton_recorder_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_recorder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_recorder
global Ctler;
recorder_on = get(hObject, 'Value')





% --- Executes on button press in radiobutton_freq_domain.
function radiobutton_freq_domain_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_freq_domain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_freq_domain
global Ctler;
if get(hObject, 'Value') == 1
    Ctler.chooseDomain = 1
else
    Ctler.chooseDomain = 0
end


% --- Executes on button press in radiobutton_playOrPause.
function radiobutton_playOrPause_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_playOrPause (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_playOrPause
global Ctler;
Ctler.isPause = ~get(hObject, 'Value')
%testRealtimeEuqalizer(Ctler.freqParameter, Ctler.isPause, Ctler.isExit);


% --- Executes on button press in pushbutton_start.
function pushbutton_start_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Ctler;
Ctler.isPause = 0;
Ctler.isChanged = 1;
RealtimeEuqalizer();


% --- Executes on button press in pushbutton_stop.
function pushbutton_stop_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Ctler;
Ctler.isExit = 1;
Ctler.isChanged = 1;
RealtimeEuqalizer();
Ctler.isExit = 0;

