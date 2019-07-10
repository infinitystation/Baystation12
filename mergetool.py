import tkinter as tk
from tkinter import ttk
from os import system as sy

class Main(tk.Frame):
	update_mode = 0

	def __init__(self, root):
		super().__init__(root)
		self.init_main()

	def init_main(self):
		toolbar = tk.Frame(bg = '#d7d8e0', bd = 2)
		toolbar.pack(side=tk.BOTTOM, fill = tk.X)

		label_description = tk.Label(self, text='Remote Repo name:')
		label_description.place(x=20, y=50)
		label_description.pack()

		self.entry_repo_name = ttk.Entry(self)
		self.entry_repo_name.place(x=200, y=50)
		self.entry_repo_name.pack()

		label_select = tk.Label(self, text='Remote Repo Link:')
		label_select.place(x=50, y=80)
		label_select.pack()

		self.entry_repo_link = ttk.Entry(self)
		self.entry_repo_link.place(x=200, y=80)
		self.entry_repo_link.pack()
		self.entry_repo_link

		label_rem_branch = tk.Label(self, text = 'Remote Repo Branch:')
		label_rem_branch.place(x=50, y=110)
		label_rem_branch.pack()

		self.entry_remote_branch = ttk.Entry(self)
		self.entry_remote_branch.place(x = 200, y = 110)
		self.entry_remote_branch.pack()

		label_sum = tk.Label(self, text = 'Local Repo Branch:')
		label_sum.place(x = 50, y = 140)
		label_sum.pack()

		self.entry_curent_branch = ttk.Entry(self)
		self.entry_curent_branch.place(x = 200, y = 140)
		self.entry_curent_branch.pack()

		btn_update_mode = tk.Button(toolbar,
			text='TOGGLE UPDATE MODE',
			command = self.git_update_mode,
			bg = '#aa00ff', 
			bd = 2,
			compound = tk.BOTTOM
		)
		btn_update_mode.pack(side = tk.BOTTOM)

		btn_merge = tk.Button(toolbar,
			text='GO!',
			command = self.git_merge,
			bg = '#00ff00', 
			bd = 2,
			compound = tk.BOTTOM
		)
		btn_merge.pack(side = tk.RIGHT)

		btn_end = tk.Button(toolbar,
			text='End',
			command = root.destroy,
			bg = '#ff0000', 
			bd = 2,
			compound = tk.BOTTOM
		)
		btn_end.pack(side = tk.LEFT)

	def git_update_mode(self):
		self.update_mode = not self.update_mode 
		if(self.update_mode):
			print("Update Mode Enabled.")
			label_update_mode_warn = tk.Label(self, text = '''Update Mode Enabled.''')
			label_update_mode_warn.pack()
		else:
			print("Update Mode Disabled.")
			label_update_mode_warn_dis = tk.Label(self, text = '''Update Mode Disabled.''')
			label_update_mode_warn_dis.pack()

	def git_merge(self):
		label_warn_start_merge = tk.Label(self, text = "Merge Started, check terminal.")
		label_warn_start_merge.pack()
		if(self.update_mode): print("Update Mode Enabled. Starting Updating.")
		print("Starting Proccess")

		reponame = self.entry_repo_name.get()
		repolink = self.entry_repo_link.get()
		remotebranch = self.entry_remote_branch.get()
		curbranch = self.entry_curent_branch.get()
		if(repolink):
			print('''Fetching...
					''')
			sy("git fetch " + self.entry_repo_link.get())
		else:
			print('''
Error: Undefined repository link.''')

			label_warn = tk.Label(self, text='''Enter repository link.
''')
			label_warn.pack(side = tk.LEFT)
			label_warn_start_merge.destroy()
			return
		if(reponame):
			sy("git remote add " + reponame + " " + repolink)
			print("")
			print("Avalible now repositories:")
			print("______________________________")
			sy("git remote")
			print("______________________________")
		else:
			print('''Error: Undefined repository name.''')

			label_warn_1 = tk.Label(self, text='''Enter repository name.
''')
			label_warn_1.pack()
			label_warn.destroy()
			label_warn_start_merge.destroy()
			return

		if(remotebranch and curbranch):
			print("Checkouting to " + curbranch + '''
______________________________''')
			sy("git checkout " + curbranch)
			print('''
______________________________''')
			
			if(not self.update_mode):
				print("Merging from " + reponame + "/" + remotebranch + " to " + curbranch)
				print("______________________________")
				sy("git merge " + reponame + "/" + remotebranch)
				print("______________________________")
				print("Merge Successful, now resolve conflicts if they exists.")
				label_end_merge = tk.Label(self, text = '''Merge Successful, now resolve conflicts if they exists.
''')
				label_end_merge.pack()
			else:
				print("Pulling from " + reponame + "/" + remotebranch + " to " + curbranch)
				print("______________________________")
				sy("git pull --rebase " + reponame + " " + remotebranch)
				print("______________________________")
				print("Update Completed.")
				label_end_pull = tk.Label(self, text = '''Update Successful.
''')
				label_end_pull.pack()

		else:
			print("Error: Enter remote branch and local branch to merge.")
			label_warn_2 = tk.Label(self, text='''Enter remote branch and local branch names.
''')
			label_warn_2.pack()
			return
		if(label_warn_start_merge): label_warn_start_merge.destroy()


if __name__ == "__main__":
	sy("@echo off")

	root = tk.Tk()
	app = Main(root)
	app.pack()
	root.title("Merge Tool")
	root.geometry("450x450+300+200")
	root.resizable(False, False)
	root.mainloop()