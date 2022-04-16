from tkinter import *
fenetre = Tk()
fenetre.title("table de multuplication")

def table():
	n=int(a.get())
	for i in range(1,11):
		x = i * n
		label=Label(fenetre,text=str(n)+" x "+str(i)+"="+str(x))
		label.grid(row=i+1,column=1)
fenetre.geometry("400x400")
labelmsg = Label(fenetre,text = "donnez un nombre")
labelmsg.grid(row=0 , column=0)

a = Entry(fenetre)
a.grid(row = 0 , column = 1)

btn = Button(fenetre,text = "afficher",command=table)
btn.grid(row = 1 , column = 1)






fenetre.mainloop()