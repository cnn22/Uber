from kivy.app import App
from kivy.uix.screenmanager import Screen, SlideTransition

class Connected(Screen):
    def disconnect(self):
        self.manager.transition = SlideTransition(direction="right")
        self.manager.current = 'login'
        self.manager.get_screen('login').resetForm()

    def gotoAlterMenu(self):
        self.transition = SlideTransition(direction="right")
        self.manager.current = 'alterMenu'
        self.manager.get_screen('alterMenu')
