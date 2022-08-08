from tkinter import *
import tkinter.ttk as ttk
from tkinter import filedialog
import tkinter.messagebox as msgbox
from PIL import Image
import os
import pandas as pd
import os


root = Tk()
root.title("저작도구")
root.resizable(False,False)

# 파일추가
def add_file():
    files = filedialog.askopenfilenames(title="이미지 파일 선택",
                                        filetypes=(("PNG파일","*.png"),("CSV파일","*.csv"),("모든파일","*.*")),
                                        initialdir="C:/")
    
    for file in files:
        list_file.insert(END, file)
#선택삭제
def del_file():
    for idx in reversed(list_file.curselection()):
        list_file.delete(idx)
        
# 저장경로(폴더)
def save_path():
    forder_selected = filedialog.askdirectory()
    if forder_selected is None:
        return

    txt_save_path.delete(0,END)
    txt_save_path.insert(0,forder_selected)
    

#이미지통합함수
def merge_image():
    print("가로넓이: ", cmb_width.get())
    print("간격: ", cmb_space.get()) 
    print("포맷: ", cmb_format.get())
    
    #가로넓이
    img_width = cmb_width.get()
    if img_width == "원본유지":
        img_width = -1
    else:
        img_width = int(img_width)
        
    #간격
    img_space = cmb_space.get()
    if img_space == "좁게":
        img_space = 30
    elif img_space == "보통":
        img_space = 60
    elif img_space == "넓게":
        img_space = 90
    else:
        img_space = 0
    
    
    #포맷
    img_format = cmb_format.get().lower() 
    images_list = [Image.open(x) for x in list_file.get(0,END)]
    
    # 이미지 사이즈를 리스트에 넣어 하나씩 처리
    image_size = [] 
    if img_width > -1:
        image_size = [(int(img_width),int(img_width * x.size[1]/x.size[0]))for x in images_list]
    else:
        image_size = [(x.size[0], x.size[1]) for x in images_list]
    
    widths, heights = zip(*(image_size))
    max_width, total_height = max(widths), sum(heights)
    # 스케치북 준비
    result_image = Image.new("RGB",(max_width, total_height),(255,255,255)) #배경흰색
    y_offset = 0 # y위치정보

    for idx, img in enumerate(images_list):
        result_image.paste(img,(0,y_offset))
        y_offset += img.size[1] 
        
        #프로그레스바 퍼센트 정보
        progress = (idx + 1) / len(images_list) * 100
        p_bar.set(progress)
        progress_bar.update()
        
    dest_path = os.path.join(txt_save_path.get(),"finish.png")
    result_image.save(dest_path)
    msgbox.showinfo("complete","작업완료")




# 시작
def start():   
    # 파일목록 확인
    if list_file.size() == 0:
        msgbox.showwarning("경고","이미지파일을 추가하세요")
        return
    
    #저장경로 확인
    if len(txt_save_path.get()) == 0:
        msgbox.showwarning("경고","저장경로를 선택하세요")
        return
    
    #이미지 통합작업
    merge_image()

def merge_csv():
   
    df = pd.DataFrame()
    csv_list = [x for x in list_file.get(0,END)]
    csv_format = cmb_format.get().lower() 
    
    for i in csv_list:
        data = pd.read_csv(i, header=None)
        df = pd.concat([df,data], axis=0,ignore_index=True)
        merge_data = df
    
    
    
    #포맷
    for idx,csv in enumerate(csv_list):
        
        #프로그레스바 퍼센트 정보
        progress = (idx + 1) / len(csv_list) * 100
        p_bar.set(progress)
        progress_bar.update()
            
    dest_path = os.path.join(txt_save_path.get(),"finish.csv")
    merge_data.to_csv(dest_path, index=False)
    msgbox.showinfo("complete","작업완료")
    
def split_csv():
   
    df = pd.DataFrame()
    csv_list = [x for x in list_file.get(0,END)]
    csv_format = cmb_format.get().lower()     
    a = 0

    for i in csv_list:
        data = pd.read_csv(i, header=None)
        for row in range(data.shape[0]):
            a+=1
            dfs = data.loc[[row],:]
            dest_path = os.path.join(txt_save_path.get(),'_'+ str(a)+'.csv')
            dfs.to_csv(dest_path,header=None, index=False)
    
    
    
    #포맷
        for idx in range(data.shape[0]):
            
            #프로그레스바 퍼센트 정보
            progress = (idx + 1) / len(data.shape[0]) * 100
            p_bar.set(progress)
            progress_bar.update()
            
    msgbox.showinfo("complete","작업완료")

# csv merge 시작
def csv_start():   
    # 파일목록 확인
    if list_file.size() == 0:
        msgbox.showwarning("경고","CSV파일을 추가하세요")
        return
    
    #저장경로 확인
    if len(txt_save_path.get()) == 0:
        msgbox.showwarning("경고","저장경로를 선택하세요")
        return
    
    #이미지 통합작업
    merge_csv()

def split_start():   
    # 파일목록 확인
    if list_file.size() == 0:
        msgbox.showwarning("경고","CSV파일을 추가하세요")
        return
    
    #저장경로 확인
    if len(txt_save_path.get()) == 0:
        msgbox.showwarning("경고","저장경로를 선택하세요")
        return
    
    #csv 분할작업
    split_csv()
    
    
            
#Frame(파일 추가 선택 삭제)
file_frame = Frame(root)
file_frame.pack(fill="x", padx=5, pady=5)

btn_add_file = Button(file_frame,padx=5,pady=5,width=12,text="파일추가", command=add_file)
btn_add_file.pack(side="left")

btn_del_file = Button(file_frame,padx=5,pady=5,width=12, text="선택삭제", command=del_file)
btn_del_file.pack(side="right")

# 리스트프레임
list_frame = Frame(root)
list_frame.pack(fill="both",padx=5, pady=5)

scrollbar = Scrollbar(list_frame)
scrollbar.pack(side="right",fill="y")

list_file = Listbox(list_frame, selectmode="extended", height=15, yscrollcommand=scrollbar.set)
list_file.pack(side="left", fill="both", expand=True)
scrollbar.config(command=list_file.yview)


#저장경로 프레임
path_frame = LabelFrame(root, text="저장경로")
path_frame.pack(fill="x",padx=5, pady=5, ipady=5)

txt_save_path = Entry(path_frame)
txt_save_path.pack(side="left",fill="x",expand=True, padx=5, pady=5,ipady=4) # ipady 높이변경

btn_save_path = Button(path_frame, text="찾아보기", width=10,command=save_path)
btn_save_path.pack(side="right",padx=5, pady=5) 

# 옵션 프레임

frame_option = LabelFrame(root, text="옵션")
frame_option.pack(padx=5, pady=5,ipady=5)

#가로넓이 레이블
label_width = Label(frame_option, text="가로넓이", width=8)
label_width.pack(side="left",padx=5, pady=5)
#가로넓이 콤보
opt_width = ["원본유지","1024","800","640"]
cmb_width = ttk.Combobox(frame_option, state="readonly", values=opt_width)
cmb_width.current(0)
cmb_width.pack(side="left",padx=5, pady=5)

#간격
#간격옵션 레이블
label_space = Label(frame_option, text="간격", width=8)
label_space.pack(side="left",padx=5, pady=5)
# 간격옵션 콤보
opt_space = ["없음","좁게","보통","넓게"]
cmb_space = ttk.Combobox(frame_option, state="readonly", values=opt_space)
cmb_space.current(0)
cmb_space.pack(side="left",padx=5, pady=5)

#파일포맷 옵션 레이블
label_format = Label(frame_option, text="포맷", width=8)
label_format.pack(side="left",padx=5, pady=5)
#파일포맷 옵션 콤보
opt_format = ["CSV","PNG","JPG","BMP"]
cmb_format = ttk.Combobox(frame_option, state="readonly", values=opt_format)
cmb_format.current(0)
cmb_format.pack(side="left",padx=5, pady=5)

#진행상황 Progress bar
frame_progress = LabelFrame(root, text="진행상황")
frame_progress.pack(fill="x",padx=5, pady=5,ipady=5)
p_bar = DoubleVar()
progress_bar = ttk.Progressbar(frame_progress, maximum=100, variable=p_bar)
progress_bar.pack(fill="x",padx=5, pady=5)

#실행 프레임
frame_run = Frame(root)
frame_run.pack(fill="x",padx=5, pady=5)

btn_close = Button(frame_run, padx=5, pady=5, text="닫기", width=12, command=root)
btn_close.pack(side="right",padx=5, pady=5)

btn_start = Button(frame_run, padx=5, pady=5, text="시작", width=12, command=start)
btn_start.pack(side="right",padx=5, pady=5)

csv_start = Button(frame_run, padx=5, pady=5, text="CSV병합", width=12, command=csv_start)
csv_start.pack(side="right", padx=5, pady=5)

csv_start = Button(frame_run, padx=5, pady=5, text="CSV행분할", width=12, command=split_start)
csv_start.pack(side="right", padx=5, pady=5)
root.mainloop()