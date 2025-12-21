from kivy.app import App
from kivy.uix.screenmanager import ScreenManager, Screen
from kivy.uix.button import Button
from kivy.uix.floatlayout import FloatLayout
from kivy.uix.label import Label
from kivy.uix.image import Image, AsyncImage
from kivy.config import Config
from kivy.uix.textinput import TextInput
from kivy.core.window import Window
from kivy.uix.spinner import Spinner
from kivy.uix.scrollview import ScrollView
from kivy.uix.gridlayout import GridLayout
from kivy.uix.popup import Popup
from kivy.uix.boxlayout import BoxLayout
from kivy.graphics import Color, Rectangle
import psycopg2
from datetime import datetime
import urllib.parse
def подключиться_к_бд():
    try:
        connection = psycopg2.connect(**DB_CONFIG)
        return connection
    except Exception as e:
        print(f"Ошибка подключения к БД: {e}")
        return None


DB_CONFIG = {
    'host': '5.183.188.132',
    'database': '2025_psql_vldm',
    'user': '2025_psql_v_usr2',
    'password': 'x4MFD0xYKJW7Lnb9',
    'port': '5432'
}


class БазоваяКнопка(Button):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.size_hint = (None, None)
        self.size = (200, 100)
        self.background_normal = 'Кнопка1.png'
        self.background_down = 'Кнопка2.png'
        self.color = (0, 0, 0, 1)
        self.font_name = "couriercyrps_bold.ttf"
class КнопкаПодбора(БазоваяКнопка):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.text = 'Подбор'
class КнопкаФильмы(БазоваяКнопка):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.text = 'Фильмы'
class КнопкаРежиссеры(БазоваяКнопка):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.text = 'Режиссёры'
class КнопкаАктеры(БазоваяКнопка):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.text = 'Актёры'
class КнопкаСтатистика(БазоваяКнопка):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.text = 'Статистика'
class КнопкаПрофиль(БазоваяКнопка):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.text = 'Профиль'
def создать_панель_навигации(экран, позиция_y=0.9):
    layout = FloatLayout()
    кнопки = [
        КнопкаПодбора(pos_hint={'center_x': 0.1, 'y': позиция_y}),
        КнопкаФильмы(pos_hint={'center_x': 0.2, 'y': позиция_y}),
        КнопкаРежиссеры(pos_hint={'center_x': 0.3, 'y': позиция_y}),
        КнопкаАктеры(pos_hint={'center_x': 0.4, 'y': позиция_y}),
        КнопкаСтатистика(pos_hint={'center_x': 0.5, 'y': позиция_y}),
        КнопкаПрофиль(pos_hint={'center_x': 0.6, 'y': позиция_y})
    ]
    for кнопка in кнопки:
        if isinstance(кнопка, КнопкаФильмы):
            кнопка.bind(on_press=экран.перейти_к_поиску)
        elif isinstance(кнопка, КнопкаАктеры):
            кнопка.bind(on_press=экран.перейти_к_поиску)
        elif isinstance(кнопка, КнопкаРежиссеры):
            кнопка.bind(on_press=экран.перейти_к_поиску)
        elif isinstance(кнопка, КнопкаПодбора):
            кнопка.bind(on_press=экран.вернуться_к_подбору)
        elif isinstance(кнопка, КнопкаСтатистика):
            кнопка.bind(on_press=экран.показать_статистику)
        elif isinstance(кнопка, КнопкаПрофиль):
            кнопка.bind(on_press=экран.показать_профиль)
        layout.add_widget(кнопка)
    return layout
class ОкноАвторизации(Screen):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        background = Image(source='фон.png', fit_mode='fill')
        layout = FloatLayout()
        self.поле_ввода_никнейма = TextInput(
            size_hint=(None, None),
            size=(400, 50),
            pos_hint={'center_x': 0.5, 'center_y': 0.6},
            multiline=False,
            hint_text='Введите никнейм',
            hint_text_color=(0, 0, 0, 1),
            font_size=24,
            background_color=(0, 0, 0, 0),
            foreground_color=(0, 0, 0, 1),
            font_name="couriercyrps_bold.ttf"
        )
        layout.add_widget(self.поле_ввода_никнейма)
        self.поле_ввода_пароля = TextInput(
            size_hint=(None, None),
            size=(400, 50),
            pos_hint={'center_x': 0.5, 'center_y': 0.5},
            multiline=False,
            hint_text='Введите пароль',
            password=True,
            hint_text_color=(0, 0, 0, 1),
            font_size=24,
            background_color=(0, 0, 0, 0),
            foreground_color=(0, 0, 0, 1),
            font_name="couriercyrps_bold.ttf"
        )
        layout.add_widget(self.поле_ввода_пароля)
        self.статус_метка = Label(
            text='',
            size_hint=(None, None),
            size=(400, 50),
            pos_hint={'center_x': 0.5, 'center_y': 0.4},
            font_size=20, color=(1, 0, 0, 1),
            font_name="couriercyrps_bold.ttf"
        )
        layout.add_widget(self.статус_метка)
        кнопка_входа = Button(
            text='Войти',
            size_hint_y=None,
            size_hint_x=None,
            size=(200, 100),
            pos_hint={'center_x': 0.5, 'y': 0.01},
            background_normal='Кнопка1.png',
            background_down='Кнопка2.png',
            color=(0, 0, 0, 1),
            font_name="couriercyrps_bold.ttf"
        )
        кнопка_входа.bind(on_press=self.обработать_авторизацию)
        layout.add_widget(кнопка_входа)
        self.add_widget(background)
        self.add_widget(layout)

    def обработать_авторизацию(self, instance):
        никнейм = self.поле_ввода_никнейма.text.strip()
        пароль = self.поле_ввода_пароля.text.strip()
        if not никнейм or not пароль:
            self.статус_метка.text = 'Введите никнейм и пароль!'
            return
        try:
            connection = подключиться_к_бд()
            if connection is None:
                self.статус_метка.text = 'Ошибка подключения к БД'
                return
            cursor = connection.cursor()
            cursor.execute("SELECT id_user, role FROM users WHERE nickname = %s", (никнейм,))
            пользователь = cursor.fetchone()
            if пользователь:
                cursor.execute("SELECT id_user FROM users WHERE nickname = %s AND password = %s", (никнейм, пароль))
                проверка_пароля = cursor.fetchone()
                if проверка_пароля:
                    self.сохранить_данные_пользователя(пользователь[0], никнейм, пользователь[1])
                    self.перейти_в_окно_подбора(instance)
                else:
                    self.статус_метка.text = 'Неверный пароль!'
            else:
                cursor.execute(
                    "INSERT INTO users (nickname, password, role, prof_pic_link) VALUES (%s, %s, %s, %s) RETURNING id_user",
                    (никнейм, пароль, 'user', '')
                )
                новый_id = cursor.fetchone()[0]
                connection.commit()
                self.сохранить_данные_пользователя(новый_id, никнейм, 'user')
                self.статус_метка.text = 'Новый пользователь создан!'
                self.перейти_в_окно_подбора(instance)
            cursor.close()
            connection.close()
        except Exception as e:
            self.статус_метка.text = f'Ошибка: {str(e)}'
            print(f"Ошибка авторизации: {e}")
    def сохранить_данные_пользователя(self, id_пользователя, никнейм, роль):
        app = App.get_running_app()
        app.текущий_пользователь = {
            'id': id_пользователя,
            'nickname': никнейм,
            'role': роль
        }
    def перейти_в_окно_подбора(self, instance):
        self.manager.current = 'main_menu'
class ОкноПодбора(Screen):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        background = Image(source='фон.png', fit_mode='fill')
        self.layout = FloatLayout()
        панель_навигации = создать_панель_навигации(self)
        self.layout.add_widget(панель_навигации)
        жанры_из_бд = self.загрузить_жанры_из_бд()
        self.список_жанров = Spinner(
            text='Выберите жанр',
            values=жанры_из_бд,
            size_hint=(None, None),
            size=(300, 50),
            pos_hint={'center_x': 0.2, 'center_y': 0.8},
            font_size=24,
            background_color=(0, 0, 0, 0),
            font_name="couriercyrps_bold.ttf",
            background_normal='',
            color=(0, 0, 0, 1)
        )
        self.layout.add_widget(self.список_жанров)
        self.длительность = Spinner(
            text='Выберите длительность',
            values=('До 90 минут', '90-120 минут', '120-150 минут', 'Более 150 минут'),
            size_hint=(None, None),
            size=(300, 50),
            pos_hint={'center_x': 0.2, 'center_y': 0.7},
            font_size=24,
            background_color=(0, 0, 0, 0),
            font_name="couriercyrps_bold.ttf",
            background_normal='',
            color=(0, 0, 0, 1)
        )
        self.layout.add_widget(self.длительность)
        настроения_из_бд = self.загрузить_настроения_из_бд()
        self.настроение = Spinner(
            text='Выберите настроение',
            values=настроения_из_бд,
            size_hint=(None, None),
            size=(300, 50),
            pos_hint={'center_x': 0.2, 'center_y': 0.6},
            font_size=24,
            background_color=(0, 0, 0, 0),
            font_name="couriercyrps_bold.ttf",
            background_normal='',
            color=(0, 0, 0, 1)
        )
        self.layout.add_widget(self.настроение)
        self.период_выхода = Spinner(
            text='Выберите период выхода фильма',
            values=('2020-2026', '2010-2019', '2000-2009', 'До 2000'),
            size_hint=(None, None),
            size=(300, 50),
            pos_hint={'center_x': 0.2, 'center_y': 0.5},
            font_size=24,
            background_color=(0, 0, 0, 0),
            font_name="couriercyrps_bold.ttf",
            background_normal='',
            color=(0, 0, 0, 1)
        )
        self.layout.add_widget(self.период_выхода)
        рейтинги_из_бд = self.загрузить_рейтинги_из_бд()
        self.возрастной_рейтинг = Spinner(
            text='Выберите возрастной рейтинг',
            values=рейтинги_из_бд,
            size_hint=(None, None),
            size=(300, 50),
            pos_hint={'center_x': 0.2, 'center_y': 0.4},
            font_size=24,
            background_color=(0, 0, 0, 0),
            font_name="couriercyrps_bold.ttf",
            background_normal='',
            color=(0, 0, 0, 1)
        )
        self.layout.add_widget(self.возрастной_рейтинг)
        кнопка_найти = Button(
            text='Найти',
            size_hint_y=None,
            size_hint_x=None,
            size=(200, 100),
            pos_hint={'center_x': 0.2, 'y': 0.01},
            background_normal='Кнопка1.png',
            background_down='Кнопка2.png',
            color=(0, 0, 0, 1),
            font_name="couriercyrps_bold.ttf"
        )
        кнопка_найти.bind(on_press=self.найти_фильм)
        self.layout.add_widget(кнопка_найти)
        self.метка_сообщения = Label(
            text='',
            size_hint=(None, None),
            size=(500, 50),
            pos_hint={'center_x': 0.7, 'center_y': 0.5},
            font_size=20,
            color=(1, 0, 0, 1),
            font_name="couriercyrps_bold.ttf"
        )
        self.layout.add_widget(self.метка_сообщения)
        self.кнопка_фильма = None
        self.add_widget(background)
        self.add_widget(self.layout)
    def on_enter(self):
        self.очистить_поля()
    def очистить_поля(self):
        self.список_жанров.text = 'Выберите жанр'
        self.длительность.text = 'Выберите длительность'
        self.настроение.text = 'Выберите настроение'
        self.период_выхода.text = 'Выберите период выхода фильма'
        self.возрастной_рейтинг.text = 'Выберите возрастной рейтинг'
        self.метка_сообщения.text = ''
        if self.кнопка_фильма:
            self.layout.remove_widget(self.кнопка_фильма)
            self.кнопка_фильма = None
    def загрузить_жанры_из_бд(self):
        try:
            conn = подключиться_к_бд()
            if not conn:
                return ['Драма', 'Комедия', 'Ужасы']
            cur = conn.cursor()
            cur.execute("SELECT DISTINCT name_ru FROM genres WHERE name_ru IS NOT NULL ORDER BY name_ru")
            жанры = [row[0] for row in cur.fetchall()]
            cur.close()
            conn.close()
            if жанры:
                return жанры
            else:
                return ['Драма', 'Комедия', 'Ужасы']
        except Exception as e:
            print(f"Ошибка загрузки жанров: {e}")
            return ['Драма', 'Комедия', 'Ужасы']
    def загрузить_настроения_из_бд(self):
        try:
            conn = подключиться_к_бд()
            if not conn:
                return ['драматический', 'комедийный', 'ужасы']
            cur = conn.cursor()
            cur.execute("SELECT DISTINCT mood FROM movies WHERE mood IS NOT NULL ORDER BY mood")
            настроения = [row[0] for row in cur.fetchall()]
            cur.close()
            conn.close()
            if настроения:
                return настроения
            else:
                return ['драматический', 'комедийный', 'ужасы']
        except Exception as e:
            print(f"Ошибка загрузки настроений: {e}")
            return ['драматический', 'комедийный', 'ужасы']
    def загрузить_рейтинги_из_бд(self):
        try:
            conn = подключиться_к_бд()
            if not conn:
                return ['PG', 'PG-13', 'R']
            cur = conn.cursor()
            cur.execute("SELECT DISTINCT age_rating FROM movies WHERE age_rating IS NOT NULL ORDER BY age_rating")
            рейтинги = [row[0] for row in cur.fetchall()]
            cur.close()
            conn.close()
            if рейтинги:
                return рейтинги
            else:
                return ['PG', 'PG-13', 'R']
        except Exception as e:
            print(f"Ошибка загрузки рейтингов: {e}")
            return ['PG', 'PG-13', 'R']
    def найти_фильм(self, instance):
        жанр = self.список_жанров.text
        настроение = self.настроение.text
        рейтинг = self.возрастной_рейтинг.text
        if жанр == 'Выберите жанр' or настроение == 'Выберите настроение' or рейтинг == 'Выберите возрастной рейтинг':
            self.метка_сообщения.text = 'Заполните все поля для поиска'
            return
        длительность = self.длительность.text
        if 'До 90' in длительность:
            min_len, max_len = 0, 90
        elif '90-120' in длительность:
            min_len, max_len = 90, 120
        elif '120-150' in длительность:
            min_len, max_len = 120, 150
        else:
            min_len, max_len = 150, 300
        период = self.период_выхода.text
        if '2020-2026' in период:
            min_year, max_year = 2020, 2026
        elif '2010-2019' in период:
            min_year, max_year = 2010, 2019
        elif '2000-2009' in период:
            min_year, max_year = 2000, 2009
        else:
            min_year, max_year = 1800, 1999
        try:
            conn = подключиться_к_бд()
            if not conn:
                self.метка_сообщения.text = 'Ошибка подключения к базе данных'
                return
            cur = conn.cursor()
            cur.execute("""
                SELECT m.id_movie, m.rus_title
                FROM movies m
                JOIN genre_movies gm ON m.id_movie = gm.id_movie
                JOIN genres g ON gm.id_genre = g.id_genre
                WHERE g.name_ru = %s
                  AND m.mood = %s
                  AND m.age_rating = %s
                  AND m.length BETWEEN %s AND %s
                  AND EXTRACT(YEAR FROM m.release_date) BETWEEN %s AND %s
                ORDER BY RANDOM()
                LIMIT 1
            """, (жанр, настроение, рейтинг, min_len, max_len, min_year, max_year))
            фильм = cur.fetchone()
            cur.close()
            conn.close()
            if not фильм:
                self.метка_сообщения.text = 'Фильм не найден. Попробуйте изменить критерии поиска.'
                if self.кнопка_фильма:
                    self.layout.remove_widget(self.кнопка_фильма)
                    self.кнопка_фильма = None
                return
            id_film, название = фильм
            if self.кнопка_фильма:
                self.layout.remove_widget(self.кнопка_фильма)
            self.кнопка_фильма = Button(
                text=название,
                size_hint=(None, None),
                size=(500, 50),
                pos_hint={'center_x': 0.7, 'center_y': 0.7},
                font_size=24,
                background_color=(0, 0, 0, 0),
                background_normal='', background_down='',
                color=(0, 0, 0, 1),
                font_name="couriercyrps_bold.ttf"
            )
            self.кнопка_фильма.bind(on_press=lambda x: self.открыть_профиль_фильма(id_film))
            self.layout.add_widget(self.кнопка_фильма)
            self.метка_сообщения.text = ''
            app = App.get_running_app()
            if app.текущий_пользователь:
                try:
                    conn2 = подключиться_к_бд()
                    cur2 = conn2.cursor()
                    cur2.execute("""
                        INSERT INTO favourite_movies (id_movie, id_user)
                        VALUES (%s, %s)
                        ON CONFLICT DO NOTHING
                    """, (id_film, app.текущий_пользователь['id']))
                    conn2.commit()
                    cur2.close()
                    conn2.close()
                except Exception as e:
                    print(f"Ошибка добавления в избранное: {e}")
        except Exception as e:
            print(f"Ошибка в найти_фильм: {e}")
            self.метка_сообщения.text = f'Ошибка поиска: {str(e)}'
    def открыть_профиль_фильма(self, id_film):
        app = App.get_running_app()
        app.выбранный_фильм_id = id_film
        профиль_фильма = self.manager.get_screen('профиль_фильма')
        профиль_фильма.загрузить_данные_фильма(id_film)
        self.manager.current = 'профиль_фильма'
    def перейти_к_поиску(self, instance):
        тип_поиска = instance.text
        self.manager.get_screen('поиск').установить_режим_поиска(тип_поиска)
        self.manager.current = 'поиск'
    def вернуться_к_подбору(self, instance):
        self.manager.current = 'main_menu'
    def показать_статистику(self, instance):
        self.manager.current = 'статистика'
    def показать_профиль(self, instance):
        self.manager.current = 'профиль'
class ОкноПоиска(Screen):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        background = Image(source='фон.png', fit_mode='fill')
        layout = FloatLayout()
        панель_навигации = создать_панель_навигации(self)
        layout.add_widget(панель_навигации)
        self.поле_поиска = TextInput(
            size_hint=(None, None),
            size=(400, 50),
            pos_hint={'center_x': 0.5, 'center_y': 0.75},
            hint_text='Введите запрос для поиска',
            hint_text_color=(0, 0, 0, 1),
            font_size=20,
            background_color=(0, 0, 0, 0),
            foreground_color=(0, 0, 0, 1),
            font_name="couriercyrps_bold.ttf"
        )
        layout.add_widget(self.поле_поиска)
        кнопка_найти = Button(
            text='Найти', size_hint=(None, None),
            size=(200, 100),
            pos_hint={'center_x': 0.5, 'center_y': 0.08},
            background_normal='Кнопка1.png',
            background_down='Кнопка2.png',
            color=(0, 0, 0, 1),
            font_name="couriercyrps_bold.ttf"
        )
        кнопка_найти.bind(on_press=self.выполнить_поиск)
        layout.add_widget(кнопка_найти)
        scroll = ScrollView(
            size_hint=(None, None), size=(800, 350),
            pos_hint={'center_x': 0.5, 'center_y': 0.4},
            do_scroll_x=False, do_scroll_y=True
        )
        self.грид_результатов = GridLayout(cols=1, size_hint_y=None, spacing=5)
        self.грид_результатов.bind(minimum_height=self.грид_результатов.setter('height'))
        scroll.add_widget(self.грид_результатов)
        layout.add_widget(scroll)
        self.текущий_режим = None
        self.add_widget(background)
        self.add_widget(layout)
    def установить_режим_поиска(self, режим):
        self.текущий_режим = режим
        if режим == 'Фильмы':
            self.поле_поиска.hint_text = 'Введите название фильма'
        elif режим == 'Актёры':
            self.поле_поиска.hint_text = 'Введите имя актёра'
        elif режим == 'Режиссёры':
            self.поле_поиска.hint_text = 'Введите имя режиссёра'
        self.поле_поиска.text = ''
        self.грид_результатов.clear_widgets()
    def выполнить_поиск(self, instance):
        if not self.текущий_режим:
            return
        запрос = self.поле_поиска.text.strip()
        if not запрос:
            return
        self.грид_результатов.clear_widgets()
        try:
            conn = подключиться_к_бд()
            if not conn:
                return
            cur = conn.cursor()
            if self.текущий_режим == 'Фильмы':
                cur.execute("""
                    SELECT id_movie, rus_title 
                    FROM movies 
                    WHERE LOWER(rus_title) LIKE LOWER(%s) 
                       OR LOWER(orig_title) LIKE LOWER(%s)
                    ORDER BY rus_title
                    LIMIT 20
                """, (f'%{запрос}%', f'%{запрос}%'))
                фильмы = cur.fetchall()
                if not фильмы:
                    метка = Label(
                        text=f'Фильмы по запросу "{запрос}" не найдены',
                        size_hint_y=None,
                        height=40,
                        font_size=18,
                        color=(0, 0, 0, 1),
                        font_name="couriercyrps_bold.ttf"
                    )
                    self.грид_результатов.add_widget(метка)
                else:
                    for id_фильма, название in фильмы:
                        кнопка_фильма = Button(
                            text=название,
                            size_hint_y=None,
                            height=40,
                            font_size=16,
                            color=(0, 0, 0, 1),
                            background_color=(0.9, 0.9, 0.9, 1),
                            font_name="couriercyrps_bold.ttf"
                        )
                        кнопка_фильма.bind(on_press=lambda x, id_film=id_фильма: self.открыть_профиль_фильма(id_film))
                        self.грид_результатов.add_widget(кнопка_фильма)
            elif self.текущий_режим == 'Актёры':
                cur.execute("""
                    SELECT id_actor, first_name, second_name 
                    FROM actors 
                    WHERE LOWER(first_name) LIKE LOWER(%s) 
                       OR LOWER(second_name) LIKE LOWER(%s)
                       OR LOWER(first_name || ' ' || second_name) LIKE LOWER(%s)
                    ORDER BY first_name, second_name
                    LIMIT 20
                """, (f'%{запрос}%', f'%{запрос}%', f'%{запрос}%'))
                актеры = cur.fetchall()
                if not актеры:
                    метка = Label(
                        text=f'Актёры по запросу "{запрос}" не найдены',
                        size_hint_y=None,
                        height=40,
                        font_size=18,
                        color=(1, 0, 0, 1),
                        font_name="couriercyrps_bold.ttf"
                    )
                    self.грид_результатов.add_widget(метка)
                else:
                    for id_актера, имя, фамилия in актеры:
                        полное_имя = f"{имя} {фамилия}" if фамилия else имя
                        кнопка_актера = Button(
                            text=полное_имя,
                            size_hint_y=None,
                            height=40,
                            font_size=16,
                            color=(0, 0, 0, 1),
                            background_color=(0.9, 0.9, 0.9, 1),
                            font_name="couriercyrps_bold.ttf"
                        )
                        кнопка_актера.bind(on_press=lambda x, id_actor=id_актера: self.открыть_профиль_актера(id_actor))
                        self.грид_результатов.add_widget(кнопка_актера)
            elif self.текущий_режим == 'Режиссёры':
                cur.execute("""
                    SELECT id_director, first_name, second_name 
                    FROM directors 
                    WHERE LOWER(first_name) LIKE LOWER(%s) 
                       OR LOWER(second_name) LIKE LOWER(%s)
                       OR LOWER(first_name || ' ' || second_name) LIKE LOWER(%s)
                    ORDER BY first_name, second_name
                    LIMIT 20
                """, (f'%{запрос}%', f'%{запрос}%', f'%{запрос}%'))
                режиссеры = cur.fetchall()
                if not режиссеры:
                    метка = Label(
                        text=f'Режиссёры по запросу "{запрос}" не найдены',
                        size_hint_y=None,
                        height=40,
                        font_size=18,
                        color=(1, 0, 0, 1),
                        font_name="couriercyrps_bold.ttf"
                    )
                    self.грид_результатов.add_widget(метка)
                else:
                    for id_режиссера, имя, фамилия in режиссеры:
                        if фамилия:
                            полное_имя = f"{имя} {фамилия}"
                        else:
                            полное_имя = f"{имя}"
                        кнопка_режиссера = Button(
                            text=полное_имя,
                            size_hint_y=None,
                            height=40,
                            font_size=16,
                            color=(0, 0, 0, 1),
                            background_color=(0.9, 0.9, 0.9, 1),
                            font_name="couriercyrps_bold.ttf"
                        )
                        кнопка_режиссера.bind(
                            on_press=lambda x, id_director=id_режиссера: self.открыть_профиль_режиссера(id_director))
                        self.грид_результатов.add_widget(кнопка_режиссера)
            cur.close()
            conn.close()
        except Exception as e:
            print(f"Ошибка поиска: {e}")
            метка = Label(
                text=f'Ошибка при поиске: {str(e)}',
                size_hint_y=None,
                height=40,
                font_size=18,
                color=(1, 0, 0, 1),
                font_name="couriercyrps_bold.ttf"
            )
            self.грид_результатов.add_widget(метка)
    def открыть_профиль_фильма(self, id_film):
        app = App.get_running_app()
        app.выбранный_фильм_id = id_film
        профиль_фильма = self.manager.get_screen('профиль_фильма')
        профиль_фильма.загрузить_данные_фильма(id_film)
        self.manager.current = 'профиль_фильма'
    def открыть_профиль_актера(self, id_actor):
        app = App.get_running_app()
        app.выбранный_актер_id = id_actor
        профиль_актера = self.manager.get_screen('профиль_актера')
        профиль_актера.загрузить_данные_актера(id_actor)
        self.manager.current = 'профиль_актера'
    def открыть_профиль_режиссера(self, id_director):
        app = App.get_running_app()
        app.выбранный_режиссер_id = id_director
        профиль_режиссера = self.manager.get_screen('профиль_режиссера')
        профиль_режиссера.загрузить_данные_режиссера(id_director)
        self.manager.current = 'профиль_режиссера'
    def перейти_к_поиску(self, instance):
        тип_поиска = instance.text
        self.установить_режим_поиска(тип_поиска)
    def вернуться_к_подбору(self, instance):
        self.manager.current = 'main_menu'
    def показать_статистику(self, instance):
        self.manager.current = 'статистика'
    def показать_профиль(self, instance):
        self.manager.current = 'профиль'
class ОкноПрофиля(Screen):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        background = Image(source='фон.png', fit_mode='fill')
        self.layout = FloatLayout()
        панель_навигации = создать_панель_навигации(self)
        self.layout.add_widget(панель_навигации)
        self.изображение_фото = AsyncImage(
            source='',
            size_hint=(None, None),
            size=(200, 280),
            pos_hint={'center_x': 0.11, 'center_y': 0.67},
            allow_stretch=True,
            keep_ratio=True,
            color=(0, 0, 0, 0)
        )
        self.layout.add_widget(self.изображение_фото)
        self.кнопка_фото = Button(
            text='',
            size_hint=(None, None),
            size=(200, 280),
            pos_hint={'center_x': 0.11, 'center_y': 0.67},
            background_color=(0, 0, 0, 0),
            color=(1, 1, 1, 0.8),
            font_size=16
        )
        self.кнопка_фото.bind(on_press=self.добавить_фото)
        self.layout.add_widget(self.кнопка_фото)
        self.никнейм = TextInput(
            size_hint=(None, None),
            size=(400, 50),
            pos_hint={'center_x': 0.3, 'center_y': 0.77},
            hint_text='Никнейм',
            hint_text_color=(0, 0, 0, 1),
            font_size=20,
            background_color=(0, 0, 0, 0),
            foreground_color=(0, 0, 0, 1),
            font_name="couriercyrps_bold.ttf"
        )
        self.layout.add_widget(self.никнейм)
        self.пароль = TextInput(
            size_hint=(None, None),
            size=(400, 50),
            pos_hint={'center_x': 0.3, 'center_y': 0.72},
            hint_text='Пароль',
            hint_text_color=(0, 0, 0, 1),
            font_size=20,
            background_color=(0, 0, 0, 0),
            foreground_color=(0, 0, 0, 1),
            font_name="couriercyrps_bold.ttf"
        )
        self.layout.add_widget(self.пароль)
        self.роль = TextInput(
            size_hint=(None, None), size=(400, 50),
            pos_hint={'center_x': 0.3, 'center_y': 0.67},
            hint_text='роль',
            hint_text_color=(0, 0, 0, 1),
            font_size=20,
            background_color=(0, 0, 0, 0),
            foreground_color=(0, 0, 0, 1),
            font_name="couriercyrps_bold.ttf"
        )
        self.layout.add_widget(self.роль)
        self.кнопка_жанры = Button(
            text='Жанры',
            size_hint=(None, None),
            size=(200, 100),
            pos_hint={'center_x': 0.74, 'center_y': 0.77},
            background_color=(0, 0, 0, 0),
            color=(0, 0, 0, 1),
            font_size=20,
            font_name="couriercyrps_bold.ttf"
        )
        self.кнопка_жанры.bind(on_press=self.перейти_в_окно_жанров)
        self.layout.add_widget(self.кнопка_жанры)
        self.поиск_пользователя = TextInput(
            size_hint=(None, None),
            size=(200, 100),
            pos_hint={'center_x': 0.9, 'center_y': 0.73},
            hint_text='Введите никнейм',
            hint_text_color=(0, 0, 0, 1),
            font_size=20,
            background_color=(0, 0, 0, 0),
            foreground_color=(0, 0, 0, 1),
            font_name="couriercyrps_bold.ttf"
        )
        self.layout.add_widget(self.поиск_пользователя)
        self.найти_пользователя = Button(
            text='Найти пользователя',
            size_hint=(None, None),
            size=(200, 100),
            pos_hint={'center_x': 0.9, 'center_y': 0.71},
            background_color=(0, 0, 0, 0),
            color=(0, 0, 0, 1),
            font_size=20,
            font_name="couriercyrps_bold.ttf"
        )
        self.layout.add_widget(self.найти_пользователя)
        self.найти_пользователя.bind(on_press=self.блок_пол)
        self.добавить_фильм = Button(
            text='Добавить фильм',
            ize_hint=(None, None),
            size=(200, 100),
            pos_hint={'center_x': 0.9, 'center_y': 0.66},
            background_color=(0, 0, 0, 0),
            color=(0, 0, 0, 1),
            font_size=20,
            font_name="couriercyrps_bold.ttf"
        )
        self.добавить_фильм.bind(on_press=self.перейти_в_окно_добавления_фильма)
        self.layout.add_widget(self.добавить_фильм)
        self.добавить_режиссёра = Button(
            text='Добавить режиссёра',
            size_hint=(None, None),
            size=(200, 100),
            pos_hint={'center_x': 0.9, 'center_y': 0.61},
            background_color=(0, 0, 0, 0),
            color=(0, 0, 0, 1),
            font_size=20,
            font_name="couriercyrps_bold.ttf"
        )
        self.добавить_режиссёра.bind(on_press=self.перейти_в_окно_добавления_режиссёров)
        self.layout.add_widget(self.добавить_режиссёра)
        self.добавить_актёра = Button(
            text='Добавить актёра',
            size_hint=(None, None),
            size=(200, 100),
            pos_hint={'center_x': 0.9, 'center_y': 0.56},
            background_color=(0, 0, 0, 0),
            color=(0, 0, 0, 1),
            font_size=20,
            font_name="couriercyrps_bold.ttf"
        )
        self.добавить_актёра.bind(on_press=self.перейти_в_окно_добавления_актёров)
        self.layout.add_widget(self.добавить_актёра)
        self.add_widget(background)
        self.add_widget(self.layout)
    def on_enter(self):
        self.поиск_пользователя.text = ''
        self.обновить_видимость_элементов()
        self.загрузить_фото_пользователя()
    def загрузить_фото_пользователя(self):
        app = App.get_running_app()
        if not app.текущий_пользователь:
            return
        try:
            conn = подключиться_к_бд()
            if not conn:
                return
            cur = conn.cursor()
            cur.execute("SELECT prof_pic_link FROM users WHERE id_user = %s",(app.текущий_пользователь['id'],))
            результат = cur.fetchone()
            cur.close()
            conn.close()
            if результат and результат[0]:
                self.изображение_фото.source = результат[0]
                self.кнопка_фото.opacity = 0.3
            else:
                self.изображение_фото.source = ''
                self.кнопка_фото.opacity = 0.7
        except Exception as e:
            print(f"Ошибка загрузки фото пользователя: {e}")
    def обновить_видимость_элементов(self):
        app = App.get_running_app()
        if app.текущий_пользователь:
            роль = app.текущий_пользователь.get('role', 'user')
            self.никнейм.text = app.текущий_пользователь.get('nickname', '')
            self.роль.text = роль
            видимость = (роль == 'admin')
            for btn in [self.кнопка_жанры, self.поиск_пользователя, self.найти_пользователя,self.добавить_фильм, self.добавить_режиссёра, self.добавить_актёра]:
                btn.opacity = 1 if видимость else 0
                btn.disabled = not видимость
    def перейти_в_окно_жанров(self, instance):
        self.manager.current = 'жанры'
    def перейти_в_окно_добавления_актёров(self, instance):
        self.manager.current = 'добавить_актёра'
    def перейти_в_окно_добавления_режиссёров(self, instance):
        self.manager.current = 'добавить_режиссёра'
    def перейти_к_поиску(self, instance):
        тип_поиска = instance.text
        self.manager.get_screen('поиск').установить_режим_поиска(тип_поиска)
        self.manager.current = 'поиск'
    def вернуться_к_подбору(self, instance):
        self.manager.current = 'main_menu'
    def показать_статистику(self, instance):
        self.manager.current = 'статистика'
    def блок_пол(self, instance):
        никнейм = self.поиск_пользователя.text.strip()
        if not никнейм:
            popup = Popup(title='Ошибка', content=Label(text='Введите никнейм'), size_hint=(0.6, 0.4))
            popup.open()
            return
        try:
            conn = подключиться_к_бд()
            cur = conn.cursor()
            cur.execute("SELECT id_user, nickname, role FROM users WHERE nickname = %s", (никнейм,))
            результат = cur.fetchone()
            cur.close()
            conn.close()
            if результат:
                App.get_running_app().целевой_пользователь = {
                    'id': результат[0], 'nickname': результат[1], 'role': результат[2]
                }
                self.manager.current = 'блокировка_пользователя'
            else:
                popup = Popup(title='Не найден', content=Label(text='Пользователь не найден'), size_hint=(0.6, 0.4))
                popup.open()
        except Exception as e:
            popup = Popup(title='Ошибка', content=Label(text=str(e)), size_hint=(0.6, 0.4))
            popup.open()
    def показать_профиль(self, instance):
        pass
    def перейти_в_окно_добавления_фильма(self, instance):
        self.manager.current = 'добавить_фильм'
    def добавить_фото(self, instance):
        content = BoxLayout(orientation='vertical', padding=10, spacing=10)
        предустановки = BoxLayout(orientation='horizontal', size_hint_y=None, height=40)
        def использовать_стандартное():
            стандартная_ссылка = 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Circle-icons-profile.svg/768px-Circle-icons-profile.svg.png'
            self.сохранить_фото_в_бд(стандартная_ссылка)
            popup.dismiss()
            self.показать_сообщение('Стандартное фото установлено')
        btn_стандартное = Button(text='Стандартное фото', size_hint_x=0.5)
        btn_стандартное.bind(on_press=lambda x: использовать_стандартное())
        предустановки.add_widget(btn_стандартное)
        content.add_widget(предустановки)
        поле_ссылки = TextInput(
            hint_text='Или введите прямую ссылку на изображение (jpg, png)',
            size_hint_y=None,
            height=40,
            multiline=False
        )
        content.add_widget(поле_ссылки)
        btn_layout = BoxLayout(spacing=10, size_hint_y=None, height=40)
        btn_save = Button(text='Использовать ссылку', size_hint_x=0.5)
        btn_cancel = Button(text='Отмена', size_hint_x=0.5)
        def сохранить_ссылочное_фото(instance):
            ссылка = поле_ссылки.text.strip()
            if ссылка:
                try:
                    ссылка.encode('ascii')
                    self.сохранить_фото_в_бд(ссылка)
                    popup.dismiss()
                    self.показать_сообщение('Фото добавлено')
                except UnicodeEncodeError:
                    self.показать_сообщение('Используйте ссылки только на английском языке')
            else:
                self.показать_сообщение('Введите ссылку')
        btn_save.bind(on_press=сохранить_ссылочное_фото)
        btn_cancel.bind(on_press=lambda x: popup.dismiss())
        btn_layout.add_widget(btn_save)
        btn_layout.add_widget(btn_cancel)
        content.add_widget(btn_layout)
        popup = Popup(
            title='Выберите фото профиля',
            content=content,
            size_hint=(0.8, 0.5)
        )
        popup.open()
    def сохранить_фото_в_бд(self, ссылка):
        app = App.get_running_app()
        if app.текущий_пользователь:
            try:
                conn = подключиться_к_бд()
                cur = conn.cursor()
                cur.execute("""
                    UPDATE users 
                    SET prof_pic_link = %s 
                    WHERE id_user = %s
                """, (ссылка, app.текущий_пользователь['id']))
                conn.commit()
                cur.close()
                conn.close()
                self.изображение_фото.source = ссылка
                self.кнопка_фото.opacity = 0.3
            except Exception as e:
                print(f"Ошибка сохранения фото: {e}")
                self.показать_сообщение(f'Ошибка: {str(e)}')
    def показать_сообщение(self, текст):
        popup = Popup(
            title='Сообщение',
            content=Label(text=текст),
            size_hint=(0.6, 0.4)
        )
        popup.open()
class ОкноСтатистики(Screen):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        background = Image(source='фон.png', fit_mode='fill')
        layout = FloatLayout()
        панель_навигации = создать_панель_навигации(self)
        layout.add_widget(панель_навигации)
        сформировать = Button(
            text='Сформировать',
            size_hint=(None, None),
            size=(200, 100),
            pos_hint={'center_x': 0.5, 'center_y': 0.05},
            background_normal='Кнопка1.png',
            background_down='Кнопка2.png',
            color=(0, 0, 0, 1),
            font_name="couriercyrps_bold.ttf"
        )
        сформировать.bind(on_press=self.сформировать_статистику)
        layout.add_widget(сформировать)
        scroll = ScrollView(
            size_hint=(None, None),
            size=(800, 400),
            pos_hint={'center_x': 0.5, 'center_y': 0.5},
            do_scroll_x=False,
            do_scroll_y=True
        )
        self.контейнер_статистики = GridLayout(cols=1, size_hint_y=None, spacing=10)
        self.контейнер_статистики.bind(minimum_height=self.контейнер_статистики.setter('height'))
        scroll.add_widget(self.контейнер_статистики)
        layout.add_widget(scroll)
        self.add_widget(background)
        self.add_widget(layout)
    def сформировать_статистику(self, instance=None):
        try:
            conn = подключиться_к_бд()
            if not conn:
                self.показать_ошибку("Ошибка подключения к базе данных")
                return
            cur = conn.cursor()
            cur.execute("""
                SELECT 
                    g.name_ru AS жанр,
                    COUNT(DISTINCT fm.id_favourite_movies) AS количество_добавлений
                FROM favourite_movies fm
                JOIN movies m ON fm.id_movie = m.id_movie
                JOIN genre_movies gm ON m.id_movie = gm.id_movie
                JOIN genres g ON gm.id_genre = g.id_genre
                WHERE g.name_ru IS NOT NULL
                GROUP BY g.name_ru
                ORDER BY количество_добавлений DESC
                LIMIT 10
            """)
            результаты = cur.fetchall()
            cur.close()
            conn.close()
            self.контейнер_статистики.clear_widgets()
            if not результаты:
                метка = Label(
                    text='Нет данных для отображения статистики',
                    size_hint_y=None,
                    height=50,
                    font_size=20,
                    color=(0, 0, 0, 1),
                    font_name="couriercyrps_bold.ttf"
                )
                self.контейнер_статистики.add_widget(метка)
            else:
                заголовок = Label(
                    text='ТОП самых популярных жанров\n',
                    size_hint_y=None,
                    height=60,
                    font_size=24,
                    bold=True,
                    color=(0, 0, 0, 1),
                    font_name="couriercyrps_bold.ttf"
                )
                self.контейнер_статистики.add_widget(заголовок)
                заголовки = BoxLayout(size_hint_y=None, height=40)
                заголовки.add_widget(Label(
                    text='№',
                    size_hint_x=0.2,
                    font_size=18,
                    bold=True,
                    color=(0, 0, 0, 1),
                    font_name="couriercyrps_bold.ttf"
                ))
                заголовки.add_widget(Label(
                    text='Жанр',
                    size_hint_x=0.6,
                    font_size=18,
                    bold=True,
                    color=(0, 0, 0, 1),
                    font_name="couriercyrps_bold.ttf"
                ))
                заголовки.add_widget(Label(
                    text='Добавлений',
                    size_hint_x=0.2,
                    font_size=18,
                    bold=True,
                    color=(0, 0, 0, 1),
                    font_name="couriercyrps_bold.ttf"
                ))
                self.контейнер_статистики.add_widget(заголовки)
                for i, (жанр, количество) in enumerate(результаты, 1):
                    строка = BoxLayout(size_hint_y=None, height=40)
                    строка.add_widget(Label(
                        text=str(i),
                        size_hint_x=0.2,
                        font_size=16,
                        color=(0, 0, 0, 1),
                        font_name="couriercyrps_bold.ttf"
                    ))
                    строка.add_widget(Label(
                        text=жанр,
                        size_hint_x=0.6,
                        font_size=16,
                        color=(0, 0, 0, 1),
                        font_name="couriercyrps_bold.ttf"
                    ))
                    строка.add_widget(Label(
                        text=str(количество),
                        size_hint_x=0.2,
                        font_size=16,
                        color=(0, 0, 0, 1),
                        font_name="couriercyrps_bold.ttf"
                    ))
                    self.контейнер_статистики.add_widget(строка)
                общее_количество = sum(количество for _, количество in результаты)
                итог = Label(
                    text=f'\nВсего добавлений в избранное: {общее_количество}',
                    size_hint_y=None,
                    height=50,
                    font_size=18,
                    color=(0, 0, 0, 1),
                    font_name="couriercyrps_bold.ttf"
                )
                self.контейнер_статистики.add_widget(итог)
        except Exception as e:
            print(f"Ошибка при формировании статистики: {e}")
            self.показать_ошибку(f"Ошибка: {str(e)}")
    def показать_ошибку(self, сообщение):
        self.контейнер_статистики.clear_widgets()
        метка = Label(
            text=сообщение,
            size_hint_y=None,
            height=50,
            font_size=18,
            color=(1, 0, 0, 1),
            font_name="couriercyrps_bold.ttf"
        )
        self.контейнер_статистики.add_widget(метка)
    def перейти_к_поиску(self, instance=None):
        if instance:
            тип_поиска = instance.text
            self.manager.get_screen('поиск').установить_режим_поиска(тип_поиска)
        self.manager.current = 'поиск'
    def вернуться_к_подбору(self, instance=None):
        self.manager.current = 'main_menu'
    def показать_статистику(self, instance=None):
        pass
    def показать_профиль(self, instance=None):
        self.manager.current = 'профиль'
class ОкноЖанров(Screen):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        background = Image(source='фон.png', fit_mode='fill')
        layout = FloatLayout()
        панель_навигации = создать_панель_навигации(self)
        layout.add_widget(панель_навигации)
        self.поле_жанра = TextInput(
            size_hint=(None, None),
            size=(300, 40),
            pos_hint={'x': 0.3, 'center_y': 0.79},
            hint_text='Выберите или введите жанр',
            font_name="couriercyrps_bold.ttf",
            background_color=(0, 0, 0, 0),
            foreground_color=(0, 0, 0, 1)
        )
        layout.add_widget(self.поле_жанра)
        self.кнопка_удалить = Button(
            text='Удалить',
            size_hint=(None, None),
            size=(300, 40),
            pos_hint={'x': 0.3, 'center_y': 0.74},
            font_name="couriercyrps_bold.ttf",
            background_color=(0, 0, 0, 0),
            color=(0, 0, 0, 1),
        )
        self.кнопка_удалить.bind(on_press=self.удалить_жанр)
        layout.add_widget(self.кнопка_удалить)
        self.кнопка_сохранить = Button(
            text='Сохранить',
            size_hint=(None, None),
            size=(300, 40),
            pos_hint={'x': 0.3, 'center_y': 0.69},
            font_name="couriercyrps_bold.ttf",
            background_color=(0, 0, 0, 0),
            color=(0, 0, 0, 1),
        )
        self.кнопка_сохранить.bind(on_press=self.сохранить_жанр)
        layout.add_widget(self.кнопка_сохранить)
        self.кнопка_добавить = Button(
            text='Добавить',
            size_hint=(None, None),
            size=(300, 40),
            pos_hint={'x': 0.3, 'center_y': 0.64},
            font_name="couriercyrps_bold.ttf",
            background_color=(0, 0, 0, 0),
            color=(0, 0, 0, 1),
        )
        self.кнопка_добавить.bind(on_press=self.добавить_жанр)
        layout.add_widget(self.кнопка_добавить)
        scroll = ScrollView(
            size_hint=(None, None),
            size=(400, 400),
            pos_hint={'center_x': 0.15, 'center_y': 0.6})
        self.список_жанров = GridLayout(cols=1, size_hint_y=None, spacing=5)
        self.список_жанров.bind(minimum_height=self.список_жанров.setter('height'))
        scroll.add_widget(self.список_жанров)
        layout.add_widget(scroll)
        self.add_widget(background)
        self.add_widget(layout)
        self.текущий_жанр_id = None
        self.загрузить_жанры()
    def загрузить_жанры(self):
        try:
            conn = подключиться_к_бд()
            if not conn:
                return
            cur = conn.cursor()
            cur.execute("SELECT id_genre, name_ru FROM genres ORDER BY name_ru")
            жанры = cur.fetchall()
            cur.close()
            conn.close()
            self.список_жанров.clear_widgets()
            for id_g, имя in жанры:
                строка = FloatLayout(size_hint_y=None, height=40)
                lbl = Label(
                    text=имя,
                    size_hint=(None, None),
                    size=(250, 40),
                    pos_hint={'x': 0, 'center_y': 0.5},
                    font_name="couriercyrps_bold.ttf",
                    color=(0, 0, 0, 1)
                )
                строка.add_widget(lbl)
                btn_select = Button(
                    text='Выбрать',
                    size_hint=(None, None),
                    background_color=(0, 0, 0, 0),
                    color=(0, 0, 0, 1),
                    size=(100, 40),
                    pos_hint={'right': 1, 'center_y': 0.5},
                    font_name="couriercyrps_bold.ttf"
                )
                btn_select.bind(on_press=lambda x, id=id_g, name=имя: self.выбрать_жанр(id, name))
                строка.add_widget(btn_select)
                self.список_жанров.add_widget(строка)
        except Exception as e:
            print(f"Ошибка загрузки жанров: {e}")
    def выбрать_жанр(self, id_g, имя):
        self.текущий_жанр_id = id_g
        self.поле_жанра.text = имя
    def удалить_жанр(self, instance):
        if not self.текущий_жанр_id:
            popup = Popup(title='Ошибка', content=Label(text='Выберите жанр для удаления'), size_hint=(0.6, 0.4))
            popup.open()
            return
        try:
            conn = подключиться_к_бд()
            cur = conn.cursor()
            cur.execute("DELETE FROM genre_movies WHERE id_genre = %s", (self.текущий_жанр_id,))
            cur.execute("DELETE FROM genres WHERE id_genre = %s", (self.текущий_жанр_id,))
            conn.commit()
            cur.close()
            conn.close()
            popup = Popup(title='Успех', content=Label(text='Жанр удалён'), size_hint=(0.6, 0.4))
            popup.open()
            self.текущий_жанр_id = None
            self.поле_жанра.text = ''
            self.загрузить_жанры()
        except Exception as e:
            popup = Popup(title='Ошибка', content=Label(text=str(e)), size_hint=(0.6, 0.4))
            popup.open()
    def сохранить_жанр(self, instance=None):
        новое_название = self.поле_жанра.text.strip()
        if not новое_название or not self.текущий_жанр_id:
            popup = Popup(title='Ошибка', content=Label(text='Введите название и выберите жанр'), size_hint=(0.6, 0.4))
            popup.open()
            return
        try:
            conn = подключиться_к_бд()
            cur = conn.cursor()
            cur.execute("UPDATE genres SET name_ru = %s WHERE id_genre = %s", (новое_название, self.текущий_жанр_id))
            conn.commit()
            cur.close()
            conn.close()
            popup = Popup(title='Успех', content=Label(text='Название жанра изменено'), size_hint=(0.6, 0.4))
            popup.open()
            self.загрузить_жанры()
        except Exception as e:
            popup = Popup(title='Ошибка', content=Label(text=str(e)), size_hint=(0.6, 0.4))
            popup.open()
    def добавить_жанр(self, instance):
        новое_название = self.поле_жанра.text.strip()
        if not новое_название:
            popup = Popup(title='Ошибка', content=Label(text='Введите название нового жанра'), size_hint=(0.6, 0.4))
            popup.open()
            return
        try:
            conn = подключиться_к_бд()
            cur = conn.cursor()
            cur.execute("INSERT INTO genres (name, name_ru) VALUES (%s, %s)", (новое_название, новое_название))
            conn.commit()
            cur.close()
            conn.close()
            popup = Popup(title='Успех', content=Label(text='Жанр добавлен'), size_hint=(0.6, 0.4))
            popup.open()
            self.поле_жанра.text = ''
            self.загрузить_жанры()
        except Exception as e:
            popup = Popup(title='Ошибка', content=Label(text=str(e)), size_hint=(0.6, 0.4))
            popup.open()
    def перейти_к_поиску(self, instance):
        тип_поиска = instance.text
        self.manager.get_screen('поиск').установить_режим_поиска(тип_поиска)
        self.manager.current = 'поиск'
    def вернуться_к_подбору(self, instance):
        self.manager.current = 'main_menu'
    def показать_статистику(self, instance):
        self.manager.current = 'статистика'
    def показать_профиль(self, instance):
        self.manager.current = 'профиль'
class ОкноБлокировкиПользователя(Screen):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        background = Image(source='фон.png', fit_mode='fill')
        layout = FloatLayout()
        панель_навигации = создать_панель_навигации(self)
        layout.add_widget(панель_навигации)
        self.изображение_фото = AsyncImage(
            source='',
            size_hint=(None, None),
            size=(150, 220),
            pos_hint={'center_x': 0.1, 'center_y': 0.7},
            allow_stretch=True,
            keep_ratio=True
        )
        layout.add_widget(self.изображение_фото)
        self.никнейм = TextInput(
            size_hint=(None, None),
            size=(300, 40),
            pos_hint={'x': 0.15, 'center_y': 0.8},
            hint_text='Никнейм',
            font_size=20,
            background_color=(0, 0, 0, 0),
            foreground_color=(0, 0, 0, 1),
            font_name="couriercyrps_bold.ttf",
            readonly=True
        )
        layout.add_widget(self.никнейм)
        self.пароль = TextInput(
            size_hint=(None, None),
            size=(300, 40),
            pos_hint={'x': 0.15, 'center_y': 0.75},
            hint_text='Пароль',
            font_size=20,
            background_color=(0, 0, 0, 0),
            foreground_color=(0, 0, 0, 1),
            font_name="couriercyrps_bold.ttf"
        )
        layout.add_widget(self.пароль)
        self.роль = Spinner(
            text='Выберите роль',
            values=['user', 'admin'],
            size_hint=(None, None),
            size=(300, 40),
            pos_hint={'x': 0.15, 'center_y': 0.7},
            font_size=20,
            background_color=(0, 0, 0, 0),
            color=(0, 0, 0, 1),
            font_name="couriercyrps_bold.ttf"
        )
        layout.add_widget(self.роль)
        self.кнопка_сохранить = Button(
            text='Сохранить изменения',
            size_hint=(None, None),
            size=(250, 40),
            pos_hint={'x': 0.15, 'center_y': 0.65},
            background_color=(0, 0, 0, 0),
            color=(0, 0, 0, 1),
            font_name="couriercyrps_bold.ttf"
        )
        self.кнопка_сохранить.bind(on_press=self.сохранить_изменения)
        layout.add_widget(self.кнопка_сохранить)
        self.кнопка_заблокировать = Button(
            text='Заблокировать',
            size_hint=(None, None),
            size=(250, 40),
            pos_hint={'x': 0.15, 'center_y': 0.6},
            background_color=(0, 0, 0, 0),
            color=(0, 0, 0, 1),
            font_name="couriercyrps_bold.ttf"
        )
        self.кнопка_заблокировать.bind(on_press=self.заблокировать_пользователя)
        layout.add_widget(self.кнопка_заблокировать)
        self.add_widget(background)
        self.add_widget(layout)
    def on_enter(self):
        app = App.get_running_app()
        if not hasattr(app, 'целевой_пользователь'):
            self.manager.current = 'профиль'
            return
        целевой = app.целевой_пользователь
        if not целевой or 'id' not in целевой:
            self.manager.current = 'профиль'
            return
        self.никнейм.text = целевой['nickname']
        self.пароль.text = ''
        self.роль.text = целевой['role']
        self.обновить_видимость_элементов()
        self.загрузить_фото_пользователя()
    def загрузить_фото_пользователя(self):
        app = App.get_running_app()
        if not hasattr(app, 'целевой_пользователь'):
            return
        целевой = app.целевой_пользователь
        if not целевой:
            return
        try:
            conn = подключиться_к_бд()
            if not conn:
                return
            cur = conn.cursor()
            cur.execute("SELECT prof_pic_link FROM users WHERE id_user = %s",
                        (целевой['id'],))
            результат = cur.fetchone()
            cur.close()
            conn.close()
            if результат and результат[0]:
                self.изображение_фото.source = результат[0]
                self.изображение_фото.reload()
            else:
                self.изображение_фото.source = ''
        except Exception as e:
            print(f"Ошибка загрузки фото пользователя: {e}")
    def обновить_видимость_элементов(self):
        app = App.get_running_app()
        целевой = app.целевой_пользователь
        текущий = app.текущий_пользователь
        if текущий.get('role') != 'admin':
            for widget in [self.пароль, self.роль, self.кнопка_сохранить, self.кнопка_заблокировать]:
                widget.disabled = True
            return
        self.пароль.disabled = False
        self.кнопка_сохранить.disabled = False
        if целевой['role'] == 'admin':
            self.роль.disabled = True
            self.кнопка_заблокировать.disabled = True
        else:
            self.роль.disabled = False
            self.кнопка_заблокировать.disabled = False
    def сохранить_изменения(self, instance):
        app = App.get_running_app()
        целевой = app.целевой_пользователь
        новая_роль = self.роль.text
        try:
            conn = подключиться_к_бд()
            cur = conn.cursor()
            if целевой['role'] != 'admin':
                cur.execute("UPDATE users SET role = %s WHERE id_user = %s", (новая_роль, целевой['id']))
            conn.commit()
            cur.close()
            conn.close()
            popup = Popup(title='Успех', content=Label(text='Изменения сохранены'), size_hint=(0.6, 0.4))
            popup.open()
            целевой['role'] = новая_роль
            self.обновить_видимость_элементов()
        except Exception as e:
            popup = Popup(title='Ошибка', content=Label(text=str(e)), size_hint=(0.6, 0.4))
            popup.open()
    def заблокировать_пользователя(self, instance):
        app = App.get_running_app()
        целевой = app.целевой_пользователь
        if целевой['role'] == 'admin':
            popup = Popup(title='Ошибка', content=Label(text='Нельзя заблокировать администратора'),size_hint=(0.6, 0.4))
            popup.open()
            return
        try:
            conn = подключиться_к_бд()
            cur = conn.cursor()
            cur.execute("DELETE FROM users WHERE id_user = %s", (целевой['id'],))
            conn.commit()
            cur.close()
            conn.close()
            popup = Popup(title='Успех', content=Label(text='Пользователь заблокирован'), size_hint=(0.6, 0.4))
            popup.open()
            self.manager.current = 'профиль'
        except Exception as e:
            popup = Popup(title='Ошибка', content=Label(text=str(e)), size_hint=(0.6, 0.4))
            popup.open()
    def перейти_к_поиску(self, instance):
        pass
    def вернуться_к_подбору(self, instance):
        self.manager.current = 'main_menu'
    def показать_статистику(self, instance):
        self.manager.current = 'статистика'
    def показать_профиль(self, instance):
        pass
class ОкноДобавленияФильма(Screen):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        background = Image(source='фон.png', fit_mode='fill')
        layout = FloatLayout()
        панель_навигации = создать_панель_навигации(self)
        layout.add_widget(панель_навигации)
        self.изображение_обложки = AsyncImage(
            source='',
            size_hint=(None, None),
            size=(200, 300),
            pos_hint={'center_x': 0.12, 'center_y': 0.68},
            allow_stretch=True,
            keep_ratio=True,
            color=(1, 1, 1, 0.9)
        )
        layout.add_widget(self.изображение_обложки)
        self.кнопка_обложки = Button(
            text='Добавить обложку',
            size_hint=(None, None),
            size=(200, 300),
            pos_hint={'center_x': 0.12, 'center_y': 0.68},
            background_color=(0, 0, 0, 0.3),
            color=(1, 1, 1, 0.8),
            font_size=16
        )
        self.кнопка_обложки.bind(on_press=self.добавить_обложку)
        layout.add_widget(self.кнопка_обложки)
        левая_колонка_x = 0.2
        текстовые_поля = [
            ("Название", 0.83),
            ("Оригинальное название", 0.78),
            ("Длительность (минуты)", 0.73),
            ("Дата выхода (ГГГГ-ММ-ДД)", 0.68),
        ]
        for hint, y in текстовые_поля:
            ti = TextInput(
                size_hint=(None, None),
                size=(300, 40),
                pos_hint={'x': левая_колонка_x, 'center_y': y},
                hint_text=hint,
                font_size=20,
                background_color=(0, 0, 0, 0),
                foreground_color=(0, 0, 0, 1),
                font_name="couriercyrps_bold.ttf"
            )
            layout.add_widget(ti)
            if hint == "Название":
                self.поле_название = ti
            elif hint == "Оригинальное название":
                self.поле_ориг_название = ti
            elif hint == "Длительность (минуты)":
                self.поле_длительность = ti
            elif hint == "Дата выхода (ГГГГ-ММ-ДД)":
                self.поле_дата_выхода = ti
        self.спиннер_рейтинг = Spinner(
            text='Выберите возрастной рейтинг',
            values=[],
            size_hint=(None, None),
            size=(300, 40),
            pos_hint={'x': левая_колонка_x, 'center_y': 0.63},
            font_size=20,
            background_color=(0, 0, 0, 0),
            color=(0, 0, 0, 1),
            font_name="couriercyrps_bold.ttf"
        )
        layout.add_widget(self.спиннер_рейтинг)
        self.спиннер_настроение = Spinner(
            text='Выберите настроение',
            values=[],
            size_hint=(None, None),
            size=(300, 40),
            pos_hint={'x': левая_колонка_x, 'center_y': 0.58},
            font_size=20,
            background_color=(0, 0, 0, 0),
            color=(0, 0, 0, 1),
            font_name="couriercyrps_bold.ttf"
        )
        layout.add_widget(self.спиннер_настроение)
        правая_колонка_x = 0.4
        layout.add_widget(Label(
            text='Режиссёры:',
            size_hint=(None, None),
            size=(200, 30),
            pos_hint={'x': правая_колонка_x, 'center_y': 0.83},
            font_size=20,
            color=(0, 0, 0, 1),
            font_name="couriercyrps_bold.ttf"
        ))
        box_выбор_реж = BoxLayout(
            size_hint=(None, None),
            size=(400, 40),
            pos_hint={'x': правая_колонка_x, 'center_y': 0.79})
        self.спиннер_режиссеры = Spinner(
            text='Выберите режиссёра',
            values=[],
            size_hint=(0.7, None),
            height=40,
            font_size=16,
            background_color=(0, 0, 0, 0),
            font_name="couriercyrps_bold.ttf",
            color=(0, 0, 0, 1)
        )
        box_выбор_реж.add_widget(self.спиннер_режиссеры)
        self.btn_add_dir = Button(
            text='+',
            size_hint=(0.1, None),
            height=40,
            background_color=(0, 0, 0, 0),
            color=(0, 0, 0, 1),
            font_size=24
        )
        self.btn_add_dir.bind(on_press=self.добавить_режиссера)
        box_выбор_реж.add_widget(self.btn_add_dir)
        self.btn_clear_dir = Button(
            text='Очистить всех',
            size_hint=(0.2, None),
            height=40,
            background_color=(0, 0, 0, 0),
            color=(0, 0, 0, 1),
            font_size=14
        )
        self.btn_clear_dir.bind(on_press=self.очистить_режиссеров)
        box_выбор_реж.add_widget(self.btn_clear_dir)
        layout.add_widget(box_выбор_реж)
        self.метка_добавлено_режиссеры = Label(
            text='Добавлено: ',
            size_hint=(None, None),
            size=(400, 30),
            pos_hint={'x': правая_колонка_x, 'center_y': 0.75},
            font_size=16,
            color=(0, 0, 0, 1),
            font_name="couriercyrps_bold.ttf",
            halign='left',
            text_size=(380, None)
        )
        layout.add_widget(self.метка_добавлено_режиссеры)
        layout.add_widget(Label(
            text='Актёры:',
            size_hint=(None, None),
            size=(200, 30),
            pos_hint={'x': правая_колонка_x, 'center_y': 0.71},
            font_size=20,
            color=(0, 0, 0, 1),
            font_name="couriercyrps_bold.ttf"
        ))
        box_выбор_акт = BoxLayout(
            size_hint=(None, None),
            size=(400, 40),
            pos_hint={'x': правая_колонка_x, 'center_y': 0.67})
        self.спиннер_актеры = Spinner(
            text='Выберите актёра',
            values=[],
            size_hint=(0.7, None),
            height=40,
            font_size=16,
            background_color=(0, 0, 0, 0),
            color=(0, 0, 0, 1),
            font_name="couriercyrps_bold.ttf"
        )
        box_выбор_акт.add_widget(self.спиннер_актеры)
        self.btn_add_act = Button(
            text='+',
            size_hint=(0.1, None),
            height=40,
            background_color=(0, 0, 0, 0),
            color=(0, 0, 0, 1),
            font_size=24
        )
        self.btn_add_act.bind(on_press=self.добавить_актера)
        box_выбор_акт.add_widget(self.btn_add_act)
        self.btn_clear_act = Button(
            text='Очистить всех',
            size_hint=(0.2, None),
            height=40,
            background_color=(0, 0, 0, 0),
            color=(0, 0, 0, 1),
            font_size=14
        )
        self.btn_clear_act.bind(on_press=self.очистить_актеров)
        box_выбор_акт.add_widget(self.btn_clear_act)
        layout.add_widget(box_выбор_акт)

        # Метка "Добавлено" для актёров
        self.метка_добавлено_актеры = Label(
            text='Добавлено: ',
            size_hint=(None, None), size=(400, 30),
            pos_hint={'x': правая_колонка_x, 'center_y': 0.63},
            font_size=16, color=(0, 0, 0, 1), font_name="couriercyrps_bold.ttf",
            halign='left', text_size=(380, None)
        )
        layout.add_widget(self.метка_добавлено_актеры)

        # --- ЖАНРЫ ---
        layout.add_widget(Label(
            text='Жанры:',
            size_hint=(None, None), size=(200, 30),
            pos_hint={'x': правая_колонка_x, 'center_y': 0.59},
            font_size=20, color=(0, 0, 0, 1), font_name="couriercyrps_bold.ttf"
        ))

        box_выбор_жанр = BoxLayout(
            size_hint=(None, None),
            size=(400, 40),
            pos_hint={'x': правая_колонка_x, 'center_y': 0.55})
        self.спиннер_жанры = Spinner(
            text='Выберите жанр', values=[],
            size_hint=(0.7, None), height=40,
            font_size=16, background_color=(0, 0, 0, 0),
            font_name="couriercyrps_bold.ttf",
            color=(0, 0, 0, 1)
        )
        box_выбор_жанр.add_widget(self.спиннер_жанры)

        self.btn_add_genre = Button(
            text='+', size_hint=(0.1, None), height=40,
            background_color=(0, 0, 0, 0), color=(0, 0, 0, 1), font_size=24,
            size=(100, 40)
        )
        self.btn_add_genre.bind(on_press=self.добавить_жанр)
        box_выбор_жанр.add_widget(self.btn_add_genre)

        self.btn_clear_genre = Button(
            text='Очистить всех', size_hint=(0.2, None), height=40,
            background_color=(0, 0, 0, 0), color=(0, 0, 0, 1), font_size=14
        )
        self.btn_clear_genre.bind(on_press=self.очистить_жанры)
        box_выбор_жанр.add_widget(self.btn_clear_genre)
        layout.add_widget(box_выбор_жанр)

        # Метка "Добавлено" для жанров
        self.метка_добавлено_жанры = Label(
            text='Добавлено: ',
            size_hint=(None, None), size=(400, 30),
            pos_hint={'x': правая_колонка_x, 'center_y': 0.51},
            font_size=16, color=(0, 0, 0, 1), font_name="couriercyrps_bold.ttf",
            halign='left', text_size=(380, None)
        )
        layout.add_widget(self.метка_добавлено_жанры)

        # Кнопка "Сохранить фильм"
        кнопка_сохранить = Button(
            text='Сохранить фильм', size_hint=(None, None), size=(300, 50),
            pos_hint={'center_x': 0.27, 'center_y': 0.53}, font_size=20,
            background_color=(0, 0, 0, 0), color=(0, 0, 0, 1),
            font_name="couriercyrps_bold.ttf"
        )
        кнопка_сохранить.bind(on_press=self.сохранить_фильм)
        layout.add_widget(кнопка_сохранить)

        self.add_widget(background)
        self.add_widget(layout)

        # Хранилища для выбранных элементов
        self.выбранные_режиссеры = []
        self.выбранные_актеры = []
        self.выбранные_жанры = []
        self.ссылка_обложки = ''

    def on_enter(self):
        # Загружаем данные при входе на экран
        self.загрузить_данные_из_бд()

    def загрузить_данные_из_бд(self):
        try:
            conn = подключиться_к_бд()
            if not conn:
                return

            cur = conn.cursor()

            # Загружаем режиссёров
            cur.execute("SELECT id_director, first_name, second_name FROM directors ORDER BY first_name, second_name")
            режиссеры = cur.fetchall()
            значения_режиссеров = ['Выберите режиссёра']

            for id_dir, имя, фамилия in режиссеры:
                полное_имя = f"{имя} {фамилия}".strip()
                значения_режиссеров.append(полное_имя)
            self.спиннер_режиссеры.values = значения_режиссеров

            # Загружаем актёров
            cur.execute("SELECT id_actor, first_name, second_name FROM actors ORDER BY first_name, second_name")
            актеры = cur.fetchall()
            значения_актеров = ['Выберите актёра']

            for id_act, имя, фамилия in актеры:
                полное_имя = f"{имя} {фамилия}".strip()
                значения_актеров.append(полное_имя)
            self.спиннер_актеры.values = значения_актеров

            # Загружаем жанры
            cur.execute("SELECT id_genre, name_ru FROM genres WHERE name_ru IS NOT NULL ORDER BY name_ru")
            жанры = cur.fetchall()
            значения_жанров = ['Выберите жанр']

            for id_genre, название in жанры:
                значения_жанров.append(название)
            self.спиннер_жанры.values = значения_жанров

            # Загружаем возрастные рейтинги из таблицы movies
            cur.execute("SELECT DISTINCT age_rating FROM movies WHERE age_rating IS NOT NULL ORDER BY age_rating")
            рейтинги = cur.fetchall()
            значения_рейтингов = ['Выберите возрастной рейтинг']

            for row in рейтинги:
                if row[0]:  # Проверяем, что значение не None
                    значения_рейтингов.append(row[0])
            self.спиннер_рейтинг.values = значения_рейтингов

            # Загружаем настроения из таблицы movies
            cur.execute("SELECT DISTINCT mood FROM movies WHERE mood IS NOT NULL ORDER BY mood")
            настроения = cur.fetchall()
            значения_настроений = ['Выберите настроение']

            for row in настроения:
                if row[0]:  # Проверяем, что значение не None
                    значения_настроений.append(row[0])
            self.спиннер_настроение.values = значения_настроений

            cur.close()
            conn.close()

        except Exception as e:
            print(f"Ошибка загрузки данных из БД: {e}")

    def добавить_режиссера(self, instance):
        выбранный = self.спиннер_режиссеры.text

        if выбранный != 'Выберите режиссёра' and выбранный not in self.выбранные_режиссеры:
            self.выбранные_режиссеры.append(выбранный)
            self.обновить_метку_добавлено()
            self.спиннер_режиссеры.text = 'Выберите режиссёра'

    def добавить_актера(self, instance):
        выбранный = self.спиннер_актеры.text

        if выбранный != 'Выберите актёра' and выбранный not in self.выбранные_актеры:
            self.выбранные_актеры.append(выбранный)
            self.обновить_метку_добавлено()
            self.спиннер_актеры.text = 'Выберите актёра'

    def добавить_жанр(self, instance):
        выбранный = self.спиннер_жанры.text

        if выбранный != 'Выберите жанр' and выбранный not in self.выбранные_жанры:
            self.выбранные_жанры.append(выбранный)
            self.обновить_метку_добавлено()
            self.спиннер_жанры.text = 'Выберите жанр'

    def очистить_режиссеров(self, instance):
        self.выбранные_режиссеры = []
        self.обновить_метку_добавлено()

    def очистить_актеров(self, instance):
        self.выбранные_актеры = []
        self.обновить_метку_добавлено()

    def очистить_жанры(self, instance):
        self.выбранные_жанры = []
        self.обновить_метку_добавлено()

    def обновить_метку_добавлено(self):
        # Обновляем метки для режиссёров
        if self.выбранные_режиссеры:
            self.метка_добавлено_режиссеры.text = f'Добавлено: {", ".join(self.выбранные_режиссеры[:3])}'
            if len(self.выбранные_режиссеры) > 3:
                self.метка_добавлено_режиссеры.text += f'... (ещё {len(self.выбранные_режиссеры) - 3})'
        else:
            self.метка_добавлено_режиссеры.text = 'Добавлено: '

        # Обновляем метки для актёров
        if self.выбранные_актеры:
            self.метка_добавлено_актеры.text = f'Добавлено: {", ".join(self.выбранные_актеры[:3])}'
            if len(self.выбранные_актеры) > 3:
                self.метка_добавлено_актеры.text += f'... (ещё {len(self.выбранные_актеры) - 3})'
        else:
            self.метка_добавлено_актеры.text = 'Добавлено: '

        # Обновляем метки для жанров
        if self.выбранные_жанры:
            self.метка_добавлено_жанры.text = f'Добавлено: {", ".join(self.выбранные_жанры)}'
        else:
            self.метка_добавлено_жанры.text = 'Добавлено: '

    def сохранить_фильм(self, instance):
        # Собираем данные
        название = self.поле_название.text.strip()
        ориг_название = self.поле_ориг_название.text.strip()
        длительность = self.поле_длительность.text.strip()
        дата_выхода = self.поле_дата_выхода.text.strip()
        рейтинг = self.спиннер_рейтинг.text if self.спиннер_рейтинг.text != 'Выберите возрастной рейтинг' else None
        настроение = self.спиннер_настроение.text if self.спиннер_настроение.text != 'Выберите настроение' else None

        # Проверяем обязательные поля с отладкой
        if not название:
            popup = Popup(title='Ошибка', content=Label(text='Введите название фильма'), size_hint=(0.6, 0.4))
            popup.open()
            return

        if not ориг_название:
            ориг_название = название

        if not длительность:
            popup = Popup(title='Ошибка', content=Label(text='Введите длительность'), size_hint=(0.6, 0.4))
            popup.open()
            return

        try:
            длительность_int = int(длительность)
        except ValueError:
            popup = Popup(title='Ошибка', content=Label(text='Длительность должна быть числом'), size_hint=(0.6, 0.4))
            popup.open()
            return

        # Проверяем дату
        if дата_выхода:
            try:
                datetime.strptime(дата_выхода, '%Y-%m-%d')
            except ValueError:
                popup = Popup(title='Ошибка', content=Label(text='Неверный формат даты (ГГГГ-ММ-ДД)'),
                              size_hint=(0.6, 0.4))
                popup.open()
                return
        else:
            дата_выхода = None

        try:
            conn = подключиться_к_бд()
            if not conn:
                popup = Popup(title='Ошибка', content=Label(text='Ошибка подключения к БД'), size_hint=(0.6, 0.4))
                popup.open()
                return

            cur = conn.cursor()

            # 1. Вставляем основной фильм
            cur.execute("""
                INSERT INTO movies (rus_title, orig_title, length, release_date, age_rating, mood, poster_url)
                VALUES (%s, %s, %s, %s, %s, %s, %s) RETURNING id_movie
            """, (
                название,
                ориг_название,
                длительность_int,
                дата_выхода,
                рейтинг,
                настроение,
                self.ссылка_обложки if self.ссылка_обложки else None
            ))

            id_фильма = cur.fetchone()[0]

            # 2. Добавляем режиссёров
            for полное_имя_режиссера in self.выбранные_режиссеры:
                # Разделяем имя на части
                parts = полное_имя_режиссера.split()

                if len(parts) == 1:
                    # Только имя (без фамилии)
                    cur.execute("SELECT id_director FROM directors WHERE first_name = %s",
                                (parts[0],))
                elif len(parts) == 2:
                    # Имя и фамилия
                    cur.execute("SELECT id_director FROM directors WHERE first_name = %s AND second_name = %s",
                                (parts[0], parts[1]))
                else:
                    # Имя и фамилия (возможно с отчеством или двойная фамилия)
                    # Берем первую часть как имя, остальное как фамилию
                    имя = parts[0]
                    фамилия = ' '.join(parts[1:])
                    cur.execute("SELECT id_director FROM directors WHERE first_name = %s AND second_name = %s",
                                (имя, фамилия))

                результат = cur.fetchone()
                if результат:
                    id_режиссера = результат[0]
                    cur.execute("INSERT INTO directing (id_movie, id_director) VALUES (%s, %s)",
                                (id_фильма, id_режиссера))

            # 3. Добавляем актёров
            for полное_имя_актера in self.выбранные_актеры:
                # Разделяем имя на части
                parts = полное_имя_актера.split()

                if len(parts) == 1:
                    # Только имя (без фамилии)
                    cur.execute("SELECT id_actor FROM actors WHERE first_name = %s",
                                (parts[0],))
                elif len(parts) == 2:
                    # Имя и фамилия
                    cur.execute("SELECT id_actor FROM actors WHERE first_name = %s AND second_name = %s",
                                (parts[0], parts[1]))
                else:
                    # Имя и фамилия (возможно с отчеством или двойная фамилия)
                    # Берем первую часть как имя, остальное как фамилию
                    имя = parts[0]
                    фамилия = ' '.join(parts[1:])
                    cur.execute("SELECT id_actor FROM actors WHERE first_name = %s AND second_name = %s",
                                (имя, фамилия))

                результат = cur.fetchone()
                if результат:
                    id_актера = результат[0]
                    cur.execute("INSERT INTO acting (id_movie, id_actor) VALUES (%s, %s)",
                                (id_фильма, id_актера))

            # 4. Добавляем жанры
            for название_жанра in self.выбранные_жанры:
                cur.execute("SELECT id_genre FROM genres WHERE name_ru = %s", (название_жанра,))
                результат = cur.fetchone()
                if результат:
                    id_жанра = результат[0]
                    cur.execute("INSERT INTO genre_movies (id_movie, id_genre) VALUES (%s, %s)",
                                (id_фильма, id_жанра))

            conn.commit()
            cur.close()
            conn.close()

            # Показываем успешное сообщение
            текст = f"Фильм '{название}' успешно добавлен в базу данных!\nID фильма: {id_фильма}"
            popup = Popup(
                title='Успех',
                content=Label(text=текст, font_size=18, font_name="couriercyrps_bold.ttf"),
                size_hint=(0.6, 0.4)
            )
            popup.open()

            # Очищаем поля после успешного добавления
            self.очистить_форму()

        except Exception as e:
            print(f"Ошибка сохранения фильма: {e}")
            popup = Popup(
                title='Ошибка',
                content=Label(text=f'Ошибка при сохранении: {str(e)}', font_size=16),
                size_hint=(0.6, 0.4)
            )
            popup.open()

    def очистить_форму(self):
        """Очищает все поля формы"""
        self.поле_название.text = ''
        self.поле_ориг_название.text = ''
        self.поле_длительность.text = ''
        self.поле_дата_выхода.text = ''
        self.спиннер_рейтинг.text = 'Выберите возрастной рейтинг'
        self.спиннер_настроение.text = 'Выберите настроение'
        self.выбранные_режиссеры = []
        self.выбранные_актеры = []
        self.выбранные_жанры = []
        self.ссылка_обложки = ''
        self.изображение_обложки.source = ''
        self.кнопка_обложки.opacity = 0.7
        self.обновить_метку_добавлено()
        self.спиннер_режиссеры.text = 'Выберите режиссёра'
        self.спиннер_актеры.text = 'Выберите актёра'
        self.спиннер_жанры.text = 'Выберите жанр'

    def добавить_обложку(self, instance):
        """Открывает всплывающее окно для добавления ссылки на обложку"""
        content = BoxLayout(orientation='vertical', padding=10, spacing=10)

        # Предустановленные варианты
        предустановки = BoxLayout(orientation='horizontal', size_hint_y=None, height=40)

        def использовать_стандартное():
            стандартная_ссылка = 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png'
            self.ссылка_обложки = стандартная_ссылка
            self.изображение_обложки.source = стандартная_ссылка
            self.кнопка_обложки.opacity = 0.3
            popup.dismiss()
            self.показать_сообщение('Стандартная обложка установлена')

        btn_стандартное = Button(text='Стандартная обложка', size_hint_x=0.5)
        btn_стандартное.bind(on_press=lambda x: использовать_стандартное())
        предустановки.add_widget(btn_стандартное)

        content.add_widget(предустановки)

        # Поле для ввода своей ссылки
        поле_ссылки = TextInput(
            hint_text='Или введите прямую ссылку на изображение (jpg, png)',
            size_hint_y=None,
            height=40,
            multiline=False
        )
        content.add_widget(поле_ссылки)

        btn_layout = BoxLayout(spacing=10, size_hint_y=None, height=40)
        btn_save = Button(text='Использовать ссылку', size_hint_x=0.5)
        btn_cancel = Button(text='Отмена', size_hint_x=0.5)

        def сохранить_ссылочную_обложку(instance):
            ссылка = поле_ссылки.text.strip()
            if ссылка:
                # Проверяем URL на наличие кириллицы
                try:
                    # Пробуем закодировать как ASCII
                    ссылка.encode('ascii')
                    # Если нет ошибки, значит URL ASCII-совместим
                    self.ссылка_обложки = ссылка
                    self.изображение_обложки.source = ссылка
                    self.кнопка_обложки.opacity = 0.3
                    popup.dismiss()
                    self.показать_сообщение('Обложка добавлена')
                except UnicodeEncodeError:
                    # URL содержит не-ASCII символы
                    self.показать_сообщение('Используйте ссылки только на английском языке')
            else:
                self.показать_сообщение('Введите ссылку')

        btn_save.bind(on_press=сохранить_ссылочную_обложку)
        btn_cancel.bind(on_press=lambda x: popup.dismiss())

        btn_layout.add_widget(btn_save)
        btn_layout.add_widget(btn_cancel)
        content.add_widget(btn_layout)

        popup = Popup(
            title='Добавить обложку фильма',
            content=content,
            size_hint=(0.8, 0.5)
        )
        popup.open()

    def показать_сообщение(self, текст):
        """Показывает всплывающее сообщение"""
        popup = Popup(
            title='Сообщение',
            content=Label(text=текст),
            size_hint=(0.6, 0.4)
        )
        popup.open()

    def перейти_к_поиску(self, instance):
        тип_поиска = instance.text
        self.manager.get_screen('поиск').установить_режим_поиска(тип_поиска)
        self.manager.current = 'поиск'

    def вернуться_к_подбору(self, instance):
        self.manager.current = 'main_menu'

    def показать_статистику(self, instance):
        self.manager.current = 'статистика'

    def показать_профиль(self, instance):
        self.manager.current = 'профиль'


class ОкноДобавленияАктёра(Screen):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        background = Image(source='фон.png', fit_mode='fill')
        layout = FloatLayout()
        панель_навигации = создать_панель_навигации(self)
        layout.add_widget(панель_навигации)

        # Асинхронное изображение для фото
        self.изображение_фото = AsyncImage(
            source='',
            size_hint=(None, None),
            size=(200, 300),
            pos_hint={'center_x': 0.12, 'center_y': 0.68},
            allow_stretch=True,
            keep_ratio=True,
            color=(1, 1, 1, 0.9)
        )
        layout.add_widget(self.изображение_фото)

        # Кнопка поверх изображения для добавления фото
        self.кнопка_фото = Button(
            text='Добавить фото',
            size_hint=(None, None),
            size=(200, 300),
            pos_hint={'center_x': 0.12, 'center_y': 0.68},
            background_color=(0, 0, 0, 0.3),
            color=(1, 1, 1, 0.8),
            font_size=16
        )
        self.кнопка_фото.bind(on_press=self.добавить_фото)
        layout.add_widget(self.кнопка_фото)

        левая_колонка_x = 0.2
        текстовые_поля = [
            ("Введите имя", 0.83),
            ("Введите фамилию", 0.78),
            ("Введите дату рождения (ГГГГ-ММ-ДД)", 0.7)

        ]

        for hint, y in текстовые_поля:
            ti = TextInput(
                size_hint=(None, None),
                size=(300, 40),
                pos_hint={'x': левая_колонка_x, 'center_y': y},
                hint_text=hint,
                font_size=20,
                background_color=(0, 0, 0, 0),
                foreground_color=(0, 0, 0, 1),
                font_name="couriercyrps_bold.ttf"
            )
            layout.add_widget(ti)

            if hint == "Введите имя":
                self.поле_имя = ti
            elif hint == "Введите фамилию":
                self.поле_фамилия = ti
            elif hint == "Введите дату рождения (ГГГГ-ММ-ДД)":
                self.поле_дата_рождения = ti

        self.поле_ввода_страны = TextInput(
            size_hint=(None, None),
            size=(300, 40),
            pos_hint={'x': 0.4, 'center_y': 0.7},
            hint_text='Введите страну',
            font_size=20,
            background_color=(0, 0, 0, 0),
            foreground_color=(0, 0, 0, 1),
            font_name="couriercyrps_bold.ttf"
        )
        layout.add_widget(self.поле_ввода_страны)

        правая_колонка_x = 0.4
        self.поле_дата_смерти = TextInput(
            size_hint=(None, None),
            size=(300, 40),
            pos_hint={'x': правая_колонка_x, 'center_y': 0.83},
            hint_text='Дата смерти (ГГГГ-ММ-ДД)',
            font_size=20,
            background_color=(0, 0, 0, 0),
            foreground_color=(0, 0, 0, 1),
            font_name="couriercyrps_bold.ttf"
        )
        layout.add_widget(self.поле_дата_смерти)

        # Фильмы
        layout.add_widget(Label(
            text='Фильмы:',
            size_hint=(None, None), size=(200, 30),
            pos_hint={'x': правая_колонка_x, 'center_y': 0.79},
            font_size=20, color=(0, 0, 0, 1), font_name="couriercyrps_bold.ttf"
        ))

        box_выбор_фильмов = BoxLayout(size_hint=(None, None), size=(400, 40),
                                      pos_hint={'x': правая_колонка_x, 'center_y': 0.76})

        self.спиннер_фильмы = Spinner(
            text='Выберите фильм', values=[],
            size_hint=(0.7, None), height=40,
            font_size=16, background_color=(0, 0, 0, 0),
            color=(0, 0, 0, 1), font_name="couriercyrps_bold.ttf"
        )
        box_выбор_фильмов.add_widget(self.спиннер_фильмы)

        self.btn_add_mov = Button(
            text='+', size_hint=(0.1, None), height=40,
            background_color=(0, 0, 0, 0), color=(0, 0, 0, 1), font_size=24
        )
        self.btn_add_mov.bind(on_press=self.добавить_фильм)
        box_выбор_фильмов.add_widget(self.btn_add_mov)

        self.btn_clear_mov = Button(
            text='Очистить всех', size_hint=(0.2, None), height=40,
            background_color=(0, 0, 0, 0), color=(0, 0, 0, 1), font_size=14
        )
        self.btn_clear_mov.bind(on_press=self.очистить_фильмы)
        box_выбор_фильмов.add_widget(self.btn_clear_mov)
        layout.add_widget(box_выбор_фильмов)

        self.метка_добавлено_фильмы = Label(
            text='Добавлено: ',
            size_hint=(None, None), size=(400, 30),
            pos_hint={'x': правая_колонка_x, 'center_y': 0.73},
            font_size=16, color=(0, 0, 0, 1), font_name="couriercyrps_bold.ttf",
            halign='left', text_size=(380, None)
        )
        layout.add_widget(self.метка_добавлено_фильмы)

        # Кнопка сохранения актера
        кнопка_сохранить = Button(
            text='Добавить актёра', size_hint=(None, None), size=(300, 50),
            pos_hint={'center_x': 0.25, 'center_y': 0.63}, font_size=20,
            background_color=(0, 0, 0, 0), color=(0, 0, 0, 1),
            font_name="couriercyrps_bold.ttf"
        )
        кнопка_сохранить.bind(on_press=self.сохранить_актера)
        layout.add_widget(кнопка_сохранить)

        self.add_widget(background)
        self.add_widget(layout)

        # Хранилище для выбранных фильмов
        self.выбранные_фильмы = []
        self.ссылка_фото = ''

    def on_enter(self):
        # Загружаем данные при входе на экран
        self.загрузить_данные_из_бд()

    def загрузить_данные_из_бд(self):
        try:
            conn = подключиться_к_бд()
            if not conn:
                return

            cur = conn.cursor()

            # Загружаем фильмы
            cur.execute("SELECT id_movie, rus_title FROM movies WHERE rus_title IS NOT NULL ORDER BY rus_title")
            фильмы = cur.fetchall()
            значения_фильмов = ['Выберите фильм']

            for id_movie, название in фильмы:
                значения_фильмов.append(название)
            self.спиннер_фильмы.values = значения_фильмов

            cur.close()
            conn.close()

        except Exception as e:
            print(f"Ошибка загрузки данных из БД: {e}")

    def добавить_фильм(self, instance):
        выбранный = self.спиннер_фильмы.text

        if выбранный != 'Выберите фильм' and выбранный not in self.выбранные_фильмы:
            self.выбранные_фильмы.append(выбранный)
            self.обновить_метку_добавлено()
            self.спиннер_фильмы.text = 'Выберите фильм'

    def очистить_фильмы(self, instance):
        self.выбранные_фильмы = []
        self.обновить_метку_добавлено()

    def обновить_метку_добавлено(self):
        # Обновляем метку для фильмов
        if self.выбранные_фильмы:
            self.метка_добавлено_фильмы.text = f'Добавлено: {", ".join(self.выбранные_фильмы[:3])}'
            if len(self.выбранные_фильмы) > 3:
                self.метка_добавлено_фильмы.text += f'... (ещё {len(self.выбранные_фильмы) - 3})'
        else:
            self.метка_добавлено_фильмы.text = 'Добавлено: '

    def сохранить_актера(self, instance):
        # Собираем данные
        имя = self.поле_имя.text.strip()
        фамилия = self.поле_фамилия.text.strip()
        дата_рождения = self.поле_дата_рождения.text.strip()
        дата_смерти = self.поле_дата_смерти.text.strip()
        страна = self.поле_ввода_страны.text.strip()

        # Проверяем обязательные поля
        if not имя:
            popup = Popup(title='Ошибка', content=Label(text='Введите имя актёра'), size_hint=(0.6, 0.4))
            popup.open()
            return

        # Проверяем формат даты рождения
        if дата_рождения:
            try:
                дата_рождения_obj = datetime.strptime(дата_рождения, '%Y-%m-%d').date()
                сегодня = datetime.now().date()
                if дата_рождения_obj > сегодня:
                    popup = Popup(title='Ошибка', content=Label(text='Дата рождения не может быть в будущем'),
                                  size_hint=(0.6, 0.4))
                    popup.open()
                    return
            except ValueError:
                popup = Popup(title='Ошибка', content=Label(text='Неверный формат даты рождения (ГГГГ-ММ-ДД)'),
                              size_hint=(0.6, 0.4))
                popup.open()
                return
        else:
            дата_рождения = None

        # Проверяем формат даты смерти (если указана)
        if дата_смерти:
            try:
                дата_смерти_obj = datetime.strptime(дата_смерти, '%Y-%m-%d').date()
                сегодня = datetime.now().date()
                if дата_смерти_obj > сегодня:
                    popup = Popup(title='Ошибка', content=Label(text='Дата смерти не может быть в будущем'),
                                  size_hint=(0.6, 0.4))
                    popup.open()
                    return

                if дата_рождения:
                    дата_рождения_obj = datetime.strptime(дата_рождения, '%Y-%m-%d').date()
                    if дата_смерти_obj < дата_рождения_obj:
                        popup = Popup(title='Ошибка',
                                      content=Label(text='Дата смерти не может быть раньше даты рождения'),
                                      size_hint=(0.6, 0.4))
                        popup.open()
                        return
            except ValueError:
                popup = Popup(title='Ошибка', content=Label(text='Неверный формат даты смерти (ГГГГ-ММ-ДД)'),
                              size_hint=(0.6, 0.4))
                popup.open()
                return
        else:
            дата_смерти = None

        try:
            conn = подключиться_к_бд()
            if not conn:
                popup = Popup(title='Ошибка', content=Label(text='Ошибка подключения к БД'), size_hint=(0.6, 0.4))
                popup.open()
                return

            cur = conn.cursor()

            # 1. Вставляем актера в БД
            cur.execute("""
                INSERT INTO actors (first_name, second_name, date_birth, date_death, actor_country, actor_photo)
                VALUES (%s, %s, %s, %s, %s, %s) RETURNING id_actor
            """, (
                имя,
                фамилия if фамилия else None,
                дата_рождения,
                дата_смерти,
                страна if страна else None,
                self.ссылка_фото if self.ссылка_фото else None
            ))

            id_актера = cur.fetchone()[0]

            # 2. Добавляем связь с фильмами (если выбраны)
            for название_фильма in self.выбранные_фильмы:
                # Ищем ID фильма по названию
                cur.execute("SELECT id_movie FROM movies WHERE rus_title = %s", (название_фильма,))
                результат = cur.fetchone()

                if результат:
                    id_фильма = результат[0]
                    cur.execute("INSERT INTO acting (id_movie, id_actor) VALUES (%s, %s)",
                                (id_фильма, id_актера))

            conn.commit()
            cur.close()
            conn.close()

            # Показываем успешное сообщение
            полное_имя = f"{имя} {фамилия}" if фамилия else имя
            текст = f"Актёр '{полное_имя}' успешно добавлен в базу данных!\nID актёра: {id_актера}"
            popup = Popup(
                title='Успех',
                content=Label(text=текст, font_size=18, font_name="couriercyrps_bold.ttf"),
                size_hint=(0.6, 0.4)
            )
            popup.open()

            # Очищаем поля после успешного добавления
            self.очистить_форму()

        except Exception as e:
            print(f"Ошибка сохранения актёра: {e}")
            popup = Popup(
                title='Ошибка',
                content=Label(text=f'Ошибка при сохранении: {str(e)}', font_size=16),
                size_hint=(0.6, 0.4)
            )
            popup.open()

    def очистить_форму(self):
        """Очищает все поля формы"""
        self.поле_имя.text = ''
        self.поле_фамилия.text = ''
        self.поле_дата_рождения.text = ''
        self.поле_дата_смерти.text = ''
        self.поле_ввода_страны.text = ''
        self.выбранные_фильмы = []
        self.ссылка_фото = ''
        self.изображение_фото.source = ''
        self.кнопка_фото.opacity = 0.7
        self.обновить_метку_добавлено()
        self.спиннер_фильмы.text = 'Выберите фильм'

    def добавить_фото(self, instance):
        """Открывает всплывающее окно для добавления ссылки на фото"""
        content = BoxLayout(orientation='vertical', padding=10, spacing=10)

        # Предустановленные варианты
        предустановки = BoxLayout(orientation='horizontal', size_hint_y=None, height=40)

        def использовать_стандартное():
            стандартная_ссылка = 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/No-photo-m.png/800px-No-photo-m.png'
            self.ссылка_фото = стандартная_ссылка
            self.изображение_фото.source = стандартная_ссылка
            self.кнопка_фото.opacity = 0.3
            popup.dismiss()
            self.показать_сообщение('Стандартное фото установлено')

        btn_стандартное = Button(text='Стандартное фото', size_hint_x=0.5)
        btn_стандартное.bind(on_press=lambda x: использовать_стандартное())
        предустановки.add_widget(btn_стандартное)

        content.add_widget(предустановки)

        # Поле для ввода своей ссылки
        поле_ссылки = TextInput(
            hint_text='Или введите прямую ссылку на изображение (jpg, png)',
            size_hint_y=None,
            height=40,
            multiline=False
        )
        content.add_widget(поле_ссылки)

        btn_layout = BoxLayout(spacing=10, size_hint_y=None, height=40)
        btn_save = Button(text='Использовать ссылку', size_hint_x=0.5)
        btn_cancel = Button(text='Отмена', size_hint_x=0.5)

        def сохранить_ссылочное_фото(instance):
            ссылка = поле_ссылки.text.strip()
            if ссылка:
                # Проверяем URL на наличие кириллицы
                try:
                    # Пробуем закодировать как ASCII
                    ссылка.encode('ascii')
                    # Если нет ошибки, значит URL ASCII-совместим
                    self.ссылка_фото = ссылка
                    self.изображение_фото.source = ссылка
                    self.кнопка_фото.opacity = 0.3
                    popup.dismiss()
                    self.показать_сообщение('Фото добавлено')
                except UnicodeEncodeError:
                    # URL содержит не-ASCII символы
                    self.показать_сообщение('Используйте ссылки только на английском языке')
            else:
                self.показать_сообщение('Введите ссылку')

        btn_save.bind(on_press=сохранить_ссылочное_фото)
        btn_cancel.bind(on_press=lambda x: popup.dismiss())

        btn_layout.add_widget(btn_save)
        btn_layout.add_widget(btn_cancel)
        content.add_widget(btn_layout)

        popup = Popup(
            title='Добавить фото актёра',
            content=content,
            size_hint=(0.8, 0.5)
        )
        popup.open()

    def показать_сообщение(self, текст):
        """Показывает всплывающее сообщение"""
        popup = Popup(
            title='Сообщение',
            content=Label(text=текст),
            size_hint=(0.6, 0.4)
        )
        popup.open()

    def перейти_к_поиску(self, instance):
        тип_поиска = instance.text
        self.manager.get_screen('поиск').установить_режим_поиска(тип_поиска)
        self.manager.current = 'поиск'

    def вернуться_к_подбору(self, instance):
        self.manager.current = 'main_menu'

    def показать_статистику(self, instance):
        self.manager.current = 'статистика'

    def показать_профиль(self, instance):
        self.manager.current = 'профиль'


class ОкноДобавленияРежиссёра(Screen):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        background = Image(source='фон.png', fit_mode='fill')
        layout = FloatLayout()
        панель_навигации = создать_панель_навигации(self)
        layout.add_widget(панель_навигации)

        # Асинхронное изображение для фото
        self.изображение_фото = AsyncImage(
            source='',
            size_hint=(None, None),
            size=(200, 300),
            pos_hint={'center_x': 0.12, 'center_y': 0.68},
            allow_stretch=True,
            keep_ratio=True,
            color=(1, 1, 1, 0.9)
        )
        layout.add_widget(self.изображение_фото)

        # Кнопка поверх изображения для добавления фото
        self.кнопка_фото = Button(
            text='Добавить фото',
            size_hint=(None, None),
            size=(200, 300),
            pos_hint={'center_x': 0.12, 'center_y': 0.68},
            background_color=(0, 0, 0, 0.3),
            color=(1, 1, 1, 0.8),
            font_size=16
        )
        self.кнопка_фото.bind(on_press=self.добавить_фото)
        layout.add_widget(self.кнопка_фото)

        левая_колонка_x = 0.2
        текстовые_поля = [
            ("Введите имя", 0.83),
            ("Введите фамилию", 0.78),
            ("Введите дату рождения (ГГГГ-ММ-ДД)", 0.7)

        ]

        for hint, y in текстовые_поля:
            ti = TextInput(
                size_hint=(None, None),
                size=(300, 40),
                pos_hint={'x': левая_колонка_x, 'center_y': y},
                hint_text=hint,
                font_size=20,
                background_color=(0, 0, 0, 0),
                foreground_color=(0, 0, 0, 1),
                font_name="couriercyrps_bold.ttf"
            )
            layout.add_widget(ti)

            if hint == "Введите имя":
                self.поле_имя = ti
            elif hint == "Введите фамилию":
                self.поле_фамилия = ti
            elif hint == "Введите дату рождения (ГГГГ-ММ-ДД)":
                self.поле_дата_рождения = ti

        self.поле_ввода_страны = TextInput(
            size_hint=(None, None),
            size=(300, 40),
            pos_hint={'x': 0.4, 'center_y': 0.7},
            hint_text='Введите страну',
            font_size=20,
            background_color=(0, 0, 0, 0),
            foreground_color=(0, 0, 0, 1),
            font_name="couriercyrps_bold.ttf"
        )
        layout.add_widget(self.поле_ввода_страны)

        правая_колонка_x = 0.4
        self.поле_дата_смерти = TextInput(
            size_hint=(None, None),
            size=(300, 40),
            pos_hint={'x': правая_колонка_x, 'center_y': 0.83},
            hint_text='Дата смерти (ГГГГ-ММ-ДД)',
            font_size=20,
            background_color=(0, 0, 0, 0),
            foreground_color=(0, 0, 0, 1),
            font_name="couriercyrps_bold.ttf"
        )
        layout.add_widget(self.поле_дата_смерти)

        # Фильмы
        layout.add_widget(Label(
            text='Фильмы:',
            size_hint=(None, None), size=(200, 30),
            pos_hint={'x': правая_колонка_x, 'center_y': 0.79},
            font_size=20, color=(0, 0, 0, 1), font_name="couriercyrps_bold.ttf"
        ))

        box_выбор_фильмов = BoxLayout(size_hint=(None, None), size=(400, 40),
                                      pos_hint={'x': правая_колонка_x, 'center_y': 0.76})

        self.спиннер_фильмы = Spinner(
            text='Выберите фильм', values=[],
            size_hint=(0.7, None), height=40,
            font_size=16, background_color=(0, 0, 0, 0),
            color=(0, 0, 0, 1), font_name="couriercyrps_bold.ttf"
        )
        box_выбор_фильмов.add_widget(self.спиннер_фильмы)

        self.btn_add_mov = Button(
            text='+', size_hint=(0.1, None), height=40,
            background_color=(0, 0, 0, 0), color=(0, 0, 0, 1), font_size=24
        )
        self.btn_add_mov.bind(on_press=self.добавить_фильм)
        box_выбор_фильмов.add_widget(self.btn_add_mov)

        self.btn_clear_mov = Button(
            text='Очистить всех', size_hint=(0.2, None), height=40,
            background_color=(0, 0, 0, 0), color=(0, 0, 0, 1), font_size=14
        )
        self.btn_clear_mov.bind(on_press=self.очистить_фильмы)
        box_выбор_фильмов.add_widget(self.btn_clear_mov)
        layout.add_widget(box_выбор_фильмов)

        self.метка_добавлено_фильмы = Label(
            text='Добавлено: ',
            size_hint=(None, None), size=(400, 30),
            pos_hint={'x': правая_колонка_x, 'center_y': 0.73},
            font_size=16, color=(0, 0, 0, 1), font_name="couriercyrps_bold.ttf",
            halign='left', text_size=(380, None)
        )
        layout.add_widget(self.метка_добавлено_фильмы)

        # Кнопка сохранения режиссёра
        кнопка_сохранить = Button(
            text='Добавить режиссёра', size_hint=(None, None), size=(300, 50),
            pos_hint={'center_x': 0.25, 'center_y': 0.63}, font_size=20,
            background_color=(0, 0, 0, 0), color=(0, 0, 0, 1),
            font_name="couriercyrps_bold.ttf"
        )
        кнопка_сохранить.bind(on_press=self.сохранить_режиссера)
        layout.add_widget(кнопка_сохранить)

        self.add_widget(background)
        self.add_widget(layout)

        # Хранилище для выбранных фильмов
        self.выбранные_фильмы = []
        self.ссылка_фото = ''

    def on_enter(self):
        # Загружаем данные при входе на экран
        self.загрузить_данные_из_бд()

    def загрузить_данные_из_бд(self):
        try:
            conn = подключиться_к_бд()
            if not conn:
                return

            cur = conn.cursor()

            # Загружаем фильмы
            cur.execute("SELECT id_movie, rus_title FROM movies WHERE rus_title IS NOT NULL ORDER BY rus_title")
            фильмы = cur.fetchall()
            значения_фильмов = ['Выберите фильм']

            for id_movie, название in фильмы:
                значения_фильмов.append(название)
            self.спиннер_фильмы.values = значения_фильмов

            cur.close()
            conn.close()

        except Exception as e:
            print(f"Ошибка загрузки данных из БД: {e}")

    def добавить_фильм(self, instance):
        выбранный = self.спиннер_фильмы.text

        if выбранный != 'Выберите фильм' and выбранный not in self.выбранные_фильмы:
            self.выбранные_фильмы.append(выбранный)
            self.обновить_метку_добавлено()
            self.спиннер_фильмы.text = 'Выберите фильм'

    def очистить_фильмы(self, instance):
        self.выбранные_фильмы = []
        self.обновить_метку_добавлено()

    def обновить_метку_добавлено(self):
        # Обновляем метку для фильмов
        if self.выбранные_фильмы:
            self.метка_добавлено_фильмы.text = f'Добавлено: {", ".join(self.выбранные_фильмы[:3])}'
            if len(self.выбранные_фильмы) > 3:
                self.метка_добавлено_фильмы.text += f'... (ещё {len(self.выбранные_фильмы) - 3})'
        else:
            self.метка_добавлено_фильмы.text = 'Добавлено: '

    def сохранить_режиссера(self, instance):
        # Собираем данные
        имя = self.поле_имя.text.strip()
        фамилия = self.поле_фамилия.text.strip()
        дата_рождения = self.поле_дата_рождения.text.strip()
        дата_смерти = self.поле_дата_смерти.text.strip()
        страна = self.поле_ввода_страны.text.strip()

        # Проверяем обязательные поля
        if not имя:
            popup = Popup(title='Ошибка', content=Label(text='Введите имя режиссёра'), size_hint=(0.6, 0.4))
            popup.open()
            return

        # Проверяем формат даты рождения
        if дата_рождения:
            try:
                дата_рождения_obj = datetime.strptime(дата_рождения, '%Y-%m-%d').date()
                сегодня = datetime.now().date()
                if дата_рождения_obj > сегодня:
                    popup = Popup(title='Ошибка', content=Label(text='Дата рождения не может быть в будущем'),
                                  size_hint=(0.6, 0.4))
                    popup.open()
                    return
            except ValueError:
                popup = Popup(title='Ошибка', content=Label(text='Неверный формат даты рождения (ГГГГ-ММ-ДД)'),
                              size_hint=(0.6, 0.4))
                popup.open()
                return
        else:
            дата_рождения = None

        # Проверяем формат даты смерти (если указана)
        if дата_смерти:
            try:
                дата_смерти_obj = datetime.strptime(дата_смерти, '%Y-%m-%d').date()
                сегодня = datetime.now().date()
                if дата_смерти_obj > сегодня:
                    popup = Popup(title='Ошибка', content=Label(text='Дата смерти не может быть в будущем'),
                                  size_hint=(0.6, 0.4))
                    popup.open()
                    return

                if дата_рождения:
                    дата_рождения_obj = datetime.strptime(дата_рождения, '%Y-%m-%d').date()
                    if дата_смерти_obj < дата_рождения_obj:
                        popup = Popup(title='Ошибка',
                                      content=Label(text='Дата смерти не может быть раньше даты рождения'),
                                      size_hint=(0.6, 0.4))
                        popup.open()
                        return
            except ValueError:
                popup = Popup(title='Ошибка', content=Label(text='Неверный формат даты смерти (ГГГГ-ММ-ДД)'),
                              size_hint=(0.6, 0.4))
                popup.open()
                return
        else:
            дата_смерти = None

        try:
            conn = подключиться_к_бд()
            if not conn:
                popup = Popup(title='Ошибка', content=Label(text='Ошибка подключения к БД'), size_hint=(0.6, 0.4))
                popup.open()
                return

            cur = conn.cursor()

            # 1. Вставляем режиссёра в БД
            cur.execute("""
                INSERT INTO directors (first_name, second_name, date_birth, date_death, director_country, director_photo)
                VALUES (%s, %s, %s, %s, %s, %s) RETURNING id_director
            """, (
                имя,
                фамилия if фамилия else None,
                дата_рождения,
                дата_смерти,
                страна if страна else None,
                self.ссылка_фото if self.ссылка_фото else None
            ))

            id_режиссёра = cur.fetchone()[0]

            # 2. Добавляем связь с фильмами (если выбраны)
            for название_фильма in self.выбранные_фильмы:
                # Ищем ID фильма по названию
                cur.execute("SELECT id_movie FROM movies WHERE rus_title = %s", (название_фильма,))
                результат = cur.fetchone()

                if результат:
                    id_фильма = результат[0]
                    cur.execute("INSERT INTO directing (id_movie, id_director) VALUES (%s, %s)",
                                (id_фильма, id_режиссёра))

            conn.commit()
            cur.close()
            conn.close()

            # Показываем успешное сообщение
            полное_имя = f"{имя} {фамилия}" if фамилия else имя
            текст = f"Режиссёр '{полное_имя}' успешно добавлен в базу данных!\nID режиссёра: {id_режиссёра}"
            popup = Popup(
                title='Успех',
                content=Label(text=текст, font_size=18, font_name="couriercyrps_bold.ttf"),
                size_hint=(0.6, 0.4)
            )
            popup.open()

            # Очищаем поля после успешного добавления
            self.очистить_форму()

        except Exception as e:
            print(f"Ошибка сохранения режиссёра: {e}")
            popup = Popup(
                title='Ошибка',
                content=Label(text=f'Ошибка при сохранении: {str(e)}', font_size=16),
                size_hint=(0.6, 0.4)
            )
            popup.open()

    def очистить_форму(self):
        """Очищает все поля формы"""
        self.поле_имя.text = ''
        self.поле_фамилия.text = ''
        self.поле_дата_рождения.text = ''
        self.поле_дата_смерти.text = ''
        self.поле_ввода_страны.text = ''
        self.выбранные_фильмы = []
        self.ссылка_фото = ''
        self.изображение_фото.source = ''
        self.кнопка_фото.opacity = 0.7
        self.обновить_метку_добавлено()
        self.спиннер_фильмы.text = 'Выберите фильм'

    def добавить_фото(self, instance):
        """Открывает всплывающее окно для добавления ссылки на фото"""
        content = BoxLayout(orientation='vertical', padding=10, spacing=10)

        # Предустановленные варианты
        предустановки = BoxLayout(orientation='horizontal', size_hint_y=None, height=40)

        def использовать_стандартное():
            стандартная_ссылка = 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/No-photo-f.png/800px-No-photo-f.png'
            self.ссылка_фото = стандартная_ссылка
            self.изображение_фото.source = стандартная_ссылка
            self.кнопка_фото.opacity = 0.3
            popup.dismiss()
            self.показать_сообщение('Стандартное фото установлено')

        btn_стандартное = Button(text='Стандартное фото', size_hint_x=0.5)
        btn_стандартное.bind(on_press=lambda x: использовать_стандартное())
        предустановки.add_widget(btn_стандартное)

        content.add_widget(предустановки)

        # Поле для ввода своей ссылки
        поле_ссылки = TextInput(
            hint_text='Или введите прямую ссылку на изображение (jpg, png)',
            size_hint_y=None,
            height=40,
            multiline=False
        )
        content.add_widget(поле_ссылки)

        btn_layout = BoxLayout(spacing=10, size_hint_y=None, height=40)
        btn_save = Button(text='Использовать ссылку', size_hint_x=0.5)
        btn_cancel = Button(text='Отмена', size_hint_x=0.5)

        def сохранить_ссылочное_фото(instance):
            ссылка = поле_ссылки.text.strip()
            if ссылка:
                # Проверяем URL на наличие кириллицы
                try:
                    # Пробуем закодировать как ASCII
                    ссылка.encode('ascii')
                    # Если нет ошибки, значит URL ASCII-совместим
                    self.ссылка_фото = ссылка
                    self.изображение_фото.source = ссылка
                    self.кнопка_фото.opacity = 0.3
                    popup.dismiss()
                    self.показать_сообщение('Фото добавлено')
                except UnicodeEncodeError:
                    # URL содержит не-ASCII символы
                    self.показать_сообщение('Используйте ссылки только на английском языке')
            else:
                self.показать_сообщение('Введите ссылку')

        btn_save.bind(on_press=сохранить_ссылочное_фото)
        btn_cancel.bind(on_press=lambda x: popup.dismiss())

        btn_layout.add_widget(btn_save)
        btn_layout.add_widget(btn_cancel)
        content.add_widget(btn_layout)

        popup = Popup(
            title='Добавить фото режиссёра',
            content=content,
            size_hint=(0.8, 0.5)
        )
        popup.open()

    def показать_сообщение(self, текст):
        """Показывает всплывающее сообщение"""
        popup = Popup(
            title='Сообщение',
            content=Label(text=текст),
            size_hint=(0.6, 0.4)
        )
        popup.open()

    def перейти_к_поиску(self, instance):
        тип_поиска = instance.text
        self.manager.get_screen('поиск').установить_режим_поиска(тип_поиска)
        self.manager.current = 'поиск'

    def вернуться_к_подбору(self, instance):
        self.manager.current = 'main_menu'

    def показать_статистику(self, instance):
        self.manager.current = 'статистика'

    def показать_профиль(self, instance):
        self.manager.current = 'профиль'


class ОкноРедактированияСписка(Screen):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        background = Image(source='фон.png', fit_mode='fill')
        layout = FloatLayout()
        панель_навигации = создать_панель_навигации(self)
        layout.add_widget(панель_навигации)
        self.заголовок = Label(
            text='Загловок',
            size_hint=(None, None), size=(400, 50),
            pos_hint={'center_x': 0.2, 'center_y': 0.75},
            font_size=24, color=(0, 0, 0, 1),
            font_name="couriercyrps_bold.ttf"
        )
        layout.add_widget(self.заголовок)
        кнопка_сохранить = Button(
            text='Сохранить', size_hint=(None, None), size=(200, 50),
            pos_hint={'center_x': 0.2, 'center_y': 0.3},
            color=(0, 0, 0, 1), font_name="couriercyrps_bold.ttf",
            background_color=(0, 0, 0, 0), font_size=20
        )
        кнопка_сохранить.bind(on_press=self.сохранить_изменения)
        layout.add_widget(кнопка_сохранить)

        метка_доступные = Label(
            text='Доступные элементы',
            size_hint=(None, None), size=(400, 30),
            pos_hint={'center_x': 0.2, 'center_y': 0.65},
            font_size=20, color=(0, 0, 0, 1),
            font_name="couriercyrps_bold.ttf"
        )
        layout.add_widget(метка_доступные)

        # Область "Выбранные элементы"
        метка_выбранные = Label(
            text='Выбранные элементы',
            size_hint=(None, None), size=(400, 30),
            pos_hint={'center_x': 0.4, 'center_y': 0.65},
            font_size=20, color=(0, 0, 0, 1),
            font_name="couriercyrps_bold.ttf"
        )
        layout.add_widget(метка_выбранные)

        # Первый скроллбар с доступными элементами
        self.скролл_доступные = ScrollView(
            size_hint=(None, None), size=(400, 200),
            pos_hint={'center_x': 0.2, 'center_y': 0.5}
        )
        self.грид_доступные = GridLayout(cols=1, size_hint_y=None, spacing=5)
        self.грид_доступные.bind(minimum_height=self.грид_доступные.setter('height'))
        self.скролл_доступные.add_widget(self.грид_доступные)
        layout.add_widget(self.скролл_доступные)

        # Второй скроллбар с выбранными элементами
        self.скролл_выбранные = ScrollView(
            size_hint=(None, None), size=(400, 200),
            pos_hint={'center_x': 0.4, 'center_y': 0.5}
        )
        self.грид_выбранные = GridLayout(cols=1, size_hint_y=None, spacing=5)
        self.грид_выбранные.bind(minimum_height=self.грид_выбранные.setter('height'))
        self.скролл_выбранные.add_widget(self.грид_выбранные)
        layout.add_widget(self.скролл_выбранные)

        self.add_widget(background)
        self.add_widget(layout)

        self.тип_списка = None
        self.список_доступных = []
        self.список_выбранных = []
        self.id_элемента = None
        self.тип_сущности = None

    def on_enter(self):
        app = App.get_running_app()
        self.тип_списка = getattr(app, 'текущий_тип_редактирования', '')
        self.тип_сущности = getattr(app, 'текущий_тип_сущности', None)

        if self.тип_сущности == 'актер':
            self.id_элемента = getattr(app, 'выбранный_актер_id', None)
        elif self.тип_сущности == 'режиссер':
            self.id_элемента = getattr(app, 'выбранный_режиссер_id', None)
        else:
            self.id_элемента = getattr(app, 'выбранный_фильм_id', None)
            self.тип_сущности = 'фильм'

        self.список_выбранных = []

        if self.тип_сущности == 'актер':
            профиль_актера = self.manager.get_screen('профиль_актера')
            if hasattr(профиль_актера, 'текущие_фильмы'):
                for id_film in профиль_актера.текущие_фильмы:
                    название = self.получить_название_фильма(id_film)
                    self.список_выбранных.append((id_film, название))

        elif self.тип_сущности == 'режиссер':
            профиль_режиссера = self.manager.get_screen('профиль_режиссера')
            if hasattr(профиль_режиссера, 'текущие_фильмы'):
                for id_film in профиль_режиссера.текущие_фильмы:
                    название = self.получить_название_фильма(id_film)
                    self.список_выбранных.append((id_film, название))

        elif self.тип_сущности == 'фильм':
            профиль_фильма = self.manager.get_screen('профиль_фильма')

            if self.тип_списка == 'режиссёров' and hasattr(профиль_фильма, 'текущие_режиссеры'):
                for id_dir in профиль_фильма.текущие_режиссеры:
                    название = self.получить_имя_режиссера(id_dir)
                    self.список_выбранных.append((id_dir, название))

            elif self.тип_списка == 'актёров' and hasattr(профиль_фильма, 'текущие_актеры'):
                for id_act in профиль_фильма.текущие_актеры:
                    название = self.получить_имя_актера(id_act)
                    self.список_выбранных.append((id_act, название))

            elif self.тип_списка == 'жанров' and hasattr(профиль_фильма, 'текущие_жанры'):
                for id_genre in профиль_фильма.текущие_жанры:
                    название = self.получить_название_жанра(id_genre)
                    self.список_выбранных.append((id_genre, название))

        self.загрузить_данные_из_бд()

        if self.тип_сущности == 'актер':
            self.заголовок.text = 'Редактирование фильмов актёра'
        elif self.тип_сущности == 'режиссер':
            self.заголовок.text = 'Редактирование фильмов режиссёра'
        elif self.тип_списка == 'режиссёров':
            self.заголовок.text = 'Редактирование режиссёров фильма'
        elif self.тип_списка == 'актёров':
            self.заголовок.text = 'Редактирование актёров фильма'
        elif self.тип_списка == 'жанров':
            self.заголовок.text = 'Редактирование жанров фильма'
        else:
            self.заголовок.text = 'Редактирование'

    def получить_название_фильма(self, id_film):
        try:
            conn = подключиться_к_бд()
            if not conn:
                return f"Фильм #{id_film}"

            cur = conn.cursor()
            cur.execute("SELECT rus_title FROM movies WHERE id_movie = %s", (id_film,))
            результат = cur.fetchone()
            cur.close()
            conn.close()

            if результат:
                return результат[0]
            else:
                return f"Фильм #{id_film}"
        except Exception as e:
            print(f"Ошибка получения названия фильма: {e}")
            return f"Фильм #{id_film}"

    def получить_имя_режиссера(self, id_dir):
        try:
            conn = подключиться_к_бд()
            if not conn:
                return f"Режиссёр #{id_dir}"

            cur = conn.cursor()
            cur.execute("SELECT first_name, second_name FROM directors WHERE id_director = %s", (id_dir,))
            результат = cur.fetchone()
            cur.close()
            conn.close()

            if результат:
                имя, фамилия = результат
                return f"{имя} {фамилия}" if фамилия else имя
            return f"Режиссёр #{id_dir}"
        except Exception as e:
            print(f"Ошибка получения имени режиссёра: {e}")
            return f"Режиссёр #{id_dir}"

    def получить_имя_актера(self, id_act):
        try:
            conn = подключиться_к_бд()
            if not conn:
                return f"Актёр #{id_act}"

            cur = conn.cursor()
            cur.execute("SELECT first_name, second_name FROM actors WHERE id_actor = %s", (id_act,))
            результат = cur.fetchone()
            cur.close()
            conn.close()

            if результат:
                имя, фамилия = результат
                return f"{имя} {фамилия}" if фамилия else имя
            return f"Актёр #{id_act}"
        except Exception as e:
            print(f"Ошибка получения имени актёра: {e}")
            return f"Актёр #{id_act}"

    def получить_название_жанра(self, id_genre):
        try:
            conn = подключиться_к_бд()
            if not conn:
                return f"Жанр #{id_genre}"

            cur = conn.cursor()
            cur.execute("SELECT name_ru FROM genres WHERE id_genre = %s", (id_genre,))
            результат = cur.fetchone()
            cur.close()
            conn.close()

            if результат:
                return результат[0]
            else:
                return f"Жанр #{id_genre}"
        except Exception as e:
            print(f"Ошибка получения названия жанра: {e}")
            return f"Жанр #{id_genre}"

    def загрузить_данные_из_бд(self):
        try:
            conn = подключиться_к_бд()
            if not conn:
                return

            cur = conn.cursor()

            if self.тип_сущности == 'актер':
                cur.execute("SELECT id_movie, rus_title FROM movies WHERE rus_title IS NOT NULL ORDER BY rus_title")
                элементы = cur.fetchall()
                self.список_доступных = [(id_elem, название) for id_elem, название in элементы]

            elif self.тип_сущности == 'режиссер':
                cur.execute("SELECT id_movie, rus_title FROM movies WHERE rus_title IS NOT NULL ORDER BY rus_title")
                элементы = cur.fetchall()
                self.список_доступных = [(id_elem, название) for id_elem, название in элементы]

            elif self.тип_сущности == 'фильм':
                if self.тип_списка == 'режиссёров':
                    cur.execute(
                        "SELECT id_director, first_name, second_name FROM directors ORDER BY first_name, second_name")
                    элементы = cur.fetchall()
                    self.список_доступных = [(id_elem, f"{имя} {фамилия}") for id_elem, имя, фамилия in элементы]

                elif self.тип_списка == 'актёров':
                    cur.execute("SELECT id_actor, first_name, second_name FROM actors ORDER BY first_name, second_name")
                    элементы = cur.fetchall()
                    self.список_доступных = [(id_elem, f"{имя} {фамилия}") for id_eлем, имя, фамилия in элементы]

                elif self.тип_списка == 'жанры':
                    cur.execute("SELECT id_genre, name_ru FROM genres ORDER BY name_ru")
                    элементы = cur.fetchall()
                    self.список_доступных = [(id_elem, название) for id_elem, название in элементы]

            cur.close()
            conn.close()

            выбранные_ids = [elem[0] for elem in self.список_выбранных]
            self.список_доступных = [elem for elem in self.список_доступных if elem[0] not in выбранные_ids]

            self.обновить_список_доступных()
            self.обновить_список_выбранных()

        except Exception as e:
            print(f"Ошибка загрузки данных из БД: {e}")

    def обновить_список_доступных(self):
        self.грид_доступные.clear_widgets()

        for id_elem, название in self.список_доступных:
            if any(elem[0] == id_elem for elem in self.список_выбранных):
                continue

            строка = FloatLayout(size_hint_y=None, height=40)
            lbl = Label(
                text=название,
                size_hint_y=None, height=40,
                pos_hint={'x': 0, 'center_y': 0.5},
                font_size=16, color=(0, 0, 0, 1),
                font_name="couriercyrps_bold.ttf"
            )
            строка.add_widget(lbl)

            btn_add = Button(
                text='Добавить',
                size_hint=(None, None), size=(100, 30),
                pos_hint={'right': 1, 'center_y': 0.5},
                background_color=(0, 0, 0, 0), color=(0, 0, 0, 1),
                font_size=14, font_name="couriercyrps_bold.ttf"
            )
            btn_add.bind(on_press=lambda x, id=id_elem, name=название: self.добавить_в_выбранные(id, название))
            строка.add_widget(btn_add)

            self.грид_доступные.add_widget(строка)

    def обновить_список_выбранных(self):
        self.грид_выбранные.clear_widgets()

        for id_eлем, название in self.список_выбранных:
            строка = FloatLayout(size_hint_y=None, height=40)
            lbl = Label(
                text=название,
                size_hint_y=None, height=40,
                pos_hint={'x': 0, 'center_y': 0.5},
                font_size=16, color=(0, 0, 0, 1),
                font_name="couriercyrps_bold.ttf"
            )
            строка.add_widget(lbl)

            btn_remove = Button(
                text='Удалить',
                size_hint=(None, None), size=(100, 30),
                pos_hint={'right': 1, 'center_y': 0.5},
                background_color=(0, 0, 0, 0), color=(0, 0, 0, 1),
                font_size=14, font_name="couriercyrps_bold.ttf"
            )
            btn_remove.bind(on_press=lambda x, id=id_eлем: self.удалить_из_выбранных(id))
            строка.add_widget(btn_remove)

            self.грид_выбранные.add_widget(строка)

    def добавить_в_выбранные(self, id_eлем, название):
        элемент = None
        for elem in self.список_доступных:
            if elem[0] == id_eлем:
                элемент = elem
                break

        if элемент:
            self.список_выбранных.append(элемент)
            self.список_доступных.remove(элемент)
            self.обновить_список_доступных()
            self.обновить_список_выбранных()

    def удалить_из_выбранных(self, id_eлем):
        элемент = None
        for elem in self.список_выбранных:
            if elem[0] == id_eлем:
                элемент = elem
                break

        if элемент:
            self.список_выбранных.remove(элемент)
            self.список_доступных.append(элемент)
            self.список_доступных.sort(key=lambda x: x[1])
            self.обновить_список_доступных()
            self.обновить_список_выбранных()

    def сохранить_изменения(self, instance):
        if not self.id_элемента:
            popup = Popup(title='Ошибка', content=Label(text='Не выбран элемент'), size_hint=(0.6, 0.4))
            popup.open()
            return

        try:
            conn = подключиться_к_бд()
            if not conn:
                popup = Popup(title='Ошибка', content=Label(text='Ошибка подключения к БД'), size_hint=(0.6, 0.4))
                popup.open()
                return

            cur = conn.cursor()

            if self.тип_сущности == 'актер':
                cur.execute("DELETE FROM acting WHERE id_actor = %s", (self.id_элемента,))
                for id_eлем, _ in self.список_выбранных:
                    cur.execute("INSERT INTO acting (id_movie, id_actor) VALUES (%s, %s)",
                                (id_eлем, self.id_элемента))
                профиль_актера = self.manager.get_screen('профиль_актера')
                профиль_актера.загрузить_данные_актера(self.id_элемента)

            elif self.тип_сущности == 'режиссер':
                cur.execute("DELETE FROM directing WHERE id_director = %s", (self.id_элемента,))
                for id_eлем, _ in self.список_выбранных:
                    cur.execute("INSERT INTO directing (id_movie, id_director) VALUES (%s, %s)",
                                (id_eлем, self.id_элемента))
                профиль_режиссера = self.manager.get_screen('профиль_режиссера')
                профиль_режиссера.загрузить_данные_режиссера(self.id_элемента)

            elif self.тип_сущности == 'фильм':
                if self.тип_списка == 'режиссёров':
                    cur.execute("DELETE FROM directing WHERE id_movie = %s", (self.id_элемента,))
                    for id_eлем, _ in self.список_выбранных:
                        cur.execute("INSERT INTO directing (id_movie, id_director) VALUES (%s, %s)",
                                    (self.id_элемента, id_eлем))

                elif self.тип_списка == 'актёров':
                    cur.execute("DELETE FROM acting WHERE id_movie = %s", (self.id_элемента,))
                    for id_eлем, _ in self.список_выбранных:
                        cur.execute("INSERT INTO acting (id_movie, id_actor) VALUES (%s, %s)",
                                    (self.id_элемента, id_eлем))

                elif self.тип_списка == 'жанры':
                    cur.execute("DELETE FROM genre_movies WHERE id_movie = %s", (self.id_элемента,))
                    for id_eлем, _ in self.список_выбранных:
                        cur.execute("INSERT INTO genre_movies (id_movie, id_genre) VALUES (%s, %s)",
                                    (self.id_элемента, id_eлем))

                профиль_фильма = self.manager.get_screen('профиль_фильма')
                профиль_фильма.загрузить_данные_фильма(self.id_элемента)

            conn.commit()
            cur.close()
            conn.close()

            popup = Popup(title='Успех', content=Label(text='Изменения сохранены'), size_hint=(0.6, 0.4))
            popup.open()

            if self.тип_сущности == 'актер':
                self.manager.current = 'профиль_актера'
            elif self.тип_сущности == 'режиссер':
                self.manager.current = 'профиль_режиссера'
            elif self.тип_сущности == 'фильм':
                self.manager.current = 'профиль_фильма'

        except Exception as e:
            print(f"Ошибка сохранения изменений: {e}")
            popup = Popup(title='Ошибка', content=Label(text=f'Ошибка при сохранении: {str(e)}'), size_hint=(0.6, 0.4))
            popup.open()


    def перейти_к_поиску(self, instance):
        тип_поиска = instance.text
        self.manager.get_screen('поиск').установить_режим_поиска(тип_поиска)
        self.manager.current = 'поиск'


    def вернуться_к_подбору(self, instance):
        self.manager.current = 'main_menu'


    def показать_статистику(self, instance):
        self.manager.current = 'статистика'


    def показать_профиль(self, instance):
        self.manager.current = 'профиль'


class ОкноПрофиляФильма(Screen):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        background = Image(source='фон.png', fit_mode='fill')
        layout = FloatLayout()
        панель_навигации = создать_панель_навигации(self)
        layout.add_widget(панель_навигации)

        # Асинхронное изображение для обложки
        self.изображение_обложки = AsyncImage(
            source='',
            size_hint=(None, None),
            size=(200, 300),
            pos_hint={'center_x': 0.12, 'center_y': 0.68},
            allow_stretch=True,
            keep_ratio=True,
            color=(1, 1, 1, 0.9)
        )
        layout.add_widget(self.изображение_обложки)

        # Кнопка редактирования обложки
        self.btn_edit_poster = Button(
            text='Редактировать обложку',
            size_hint=(None, None), size=(200, 40),
            pos_hint={'center_x': 0.12, 'center_y': 0.53},
            background_color=(0, 0, 0, 0), color=(0, 0, 0, 1),
            font_size=16, font_name="couriercyrps_bold.ttf"
        )
        self.btn_edit_poster.bind(on_press=self.редактировать_обложку)
        layout.add_widget(self.btn_edit_poster)

        левая_колонка_x = 0.2
        # Название
        self.поле_название = TextInput(
            size_hint=(None, None), size=(300, 40),
            pos_hint={'x': левая_колонка_x, 'center_y': 0.83},
            hint_text='Название фильма',
            font_size=20, background_color=(0, 0, 0, 0),
            foreground_color=(0, 0, 0, 1), font_name="couriercyrps_bold.ttf"
        )
        layout.add_widget(self.поле_название)

        self.поле_ориг_название = TextInput(
            size_hint=(None, None), size=(300, 40),
            pos_hint={'x': левая_колонка_x, 'center_y': 0.78},
            hint_text='Оригинальное название',
            font_size=20, background_color=(0, 0, 0, 0),
            foreground_color=(0, 0, 0, 1), font_name="couriercyrps_bold.ttf"
        )
        layout.add_widget(self.поле_ориг_название)

        self.поле_длительность = TextInput(
            size_hint=(None, None), size=(300, 40),
            pos_hint={'x': левая_колонка_x, 'center_y': 0.73},
            hint_text='Длительность (минуты)',
            font_size=20, background_color=(0, 0, 0, 0),
            foreground_color=(0, 0, 0, 1), font_name="couriercyrps_bold.ttf",
            input_filter='int'
        )
        layout.add_widget(self.поле_длительность)

        self.поле_дата_выхода = TextInput(
            size_hint=(None, None), size=(300, 40),
            pos_hint={'x': левая_колонка_x, 'center_y': 0.68},
            hint_text='Дата выхода (ГГГГ-ММ-ДД)',
            font_size=20, background_color=(0, 0, 0, 0),
            foreground_color=(0, 0, 0, 1), font_name="couriercyrps_bold.ttf"
        )
        layout.add_widget(self.поле_дата_выхода)

        self.спиннер_рейтинг = Spinner(
            text='',
            values=[],
            size_hint=(None, None), size=(200, 40),
            pos_hint={'x': левая_колонка_x, 'center_y': 0.63},
            font_size=20, background_color=(0, 0, 0, 0), color=(0, 0, 0, 1),
            font_name="couriercyrps_bold.ttf"
        )
        layout.add_widget(self.спиннер_рейтинг)

        self.спиннер_настроение = Spinner(
            text='',
            values=[],
            size_hint=(None, None), size=(200, 40),
            pos_hint={'x': левая_колонка_x, 'center_y': 0.58},
            font_size=20, background_color=(0, 0, 0, 0), color=(0, 0, 0, 1),
            font_name="couriercyrps_bold.ttf"
        )
        layout.add_widget(self.спиннер_настроение)

        правая_колонка_x = 0.55

        # --- РЕЖИССЁРЫ ---
        layout.add_widget(Label(
            text='Режиссёры:',
            size_hint=(None, None), size=(200, 30),
            pos_hint={'x': правая_колонка_x, 'center_y': 0.83},
            font_size=20, color=(0, 0, 0, 1), font_name="couriercyrps_bold.ttf",
            halign='left'
        ))

        # Кнопка редактирования режиссёров
        self.btn_edit_dir = Button(
            text='Редактировать',
            size_hint=(None, None), size=(200, 40),
            pos_hint={'x': 0.65, 'center_y': 0.83},
            background_color=(0, 0, 0, 0), color=(0, 0, 0, 1),
            font_size=20, font_name="couriercyrps_bold.ttf"
        )
        self.btn_edit_dir.bind(on_press=lambda x: self.открыть_редактирование('режиссёров'))
        layout.add_widget(self.btn_edit_dir)

        # Список режиссёров
        self.список_режиссеров = ScrollView(
            size_hint=(None, None), size=(200, 100),
            pos_hint={'x': правая_колонка_x, 'center_y': 0.76}
        )
        self.грид_режиссеры = GridLayout(cols=1, size_hint_y=None, spacing=5)
        self.грид_режиссеры.bind(minimum_height=self.грид_режиссеры.setter('height'))
        self.список_режиссеров.add_widget(self.грид_режиссеры)
        layout.add_widget(self.список_режиссеров)

        # --- АКТЁРЫ ---
        layout.add_widget(Label(
            text='Актёры:',
            size_hint=(None, None), size=(200, 30),
            pos_hint={'x': правая_колонка_x, 'center_y': 0.65},
            font_size=20, color=(0, 0, 0, 1), font_name="couriercyrps_bold.ttf",
            halign='left'
        ))

        # Кнопка редактирования актёров
        self.btn_edit_act = Button(
            text='Редактировать',
            size_hint=(None, None), size=(200, 40),
            pos_hint={'x': 0.65, 'center_y': 0.65},
            background_color=(0, 0, 0, 0), color=(0, 0, 0, 1),
            font_size=20, font_name="couriercyrps_bold.ttf"
        )
        self.btn_edit_act.bind(on_press=lambda x: self.открыть_редактирование('актёров'))
        layout.add_widget(self.btn_edit_act)

        # Список актёров
        self.список_актеров = ScrollView(
            size_hint=(None, None), size=(200, 100),
            pos_hint={'x': правая_колонка_x, 'center_y': 0.58}
        )
        self.грид_актеры = GridLayout(cols=1, size_hint_y=None, spacing=5)
        self.грид_актеры.bind(minimum_height=self.грид_актеры.setter('height'))
        self.список_актеров.add_widget(self.грид_актеры)
        layout.add_widget(self.список_актеров)

        # --- ЖАНРЫ ---
        layout.add_widget(Label(
            text='Жанры:',
            size_hint=(None, None), size=(200, 30),
            pos_hint={'x': правая_колонка_x, 'center_y': 0.47},
            font_size=20, color=(0, 0, 0, 1), font_name="couriercyrps_bold.ttf",
            halign='left'
        ))

        # Кнопка редактирования жанров
        self.btn_edit_genre = Button(
            text='Редактировать',
            size_hint=(None, None), size=(200, 40),
            pos_hint={'x': 0.65, 'center_y': 0.47},
            background_color=(0, 0, 0, 0), color=(0, 0, 0, 1),
            font_size=20, font_name="couriercyrps_bold.ttf"
        )
        self.btn_edit_genre.bind(on_press=lambda x: self.открыть_редактирование('жанры'))
        layout.add_widget(self.btn_edit_genre)

        # Список жанров
        self.список_жанров = ScrollView(
            size_hint=(None, None), size=(200, 100),
            pos_hint={'x': правая_колонка_x, 'center_y': 0.40}
        )
        self.грид_жанры = GridLayout(cols=1, size_hint_y=None, spacing=5)
        self.грид_жанры.bind(minimum_height=self.грид_жанры.setter('height'))
        self.список_жанров.add_widget(self.грид_жанры)
        layout.add_widget(self.список_жанров)

        # Кнопка сохранения
        self.кнопка_сохранить = Button(
            text='Сохранить', size_hint=(None, None), size=(200, 40),
            pos_hint={'center_x': 0.25, 'center_y': 0.53},
            color=(0, 0, 0, 1), font_name="couriercyrps_bold.ttf",
            background_color=(0, 0, 0, 0),
            font_size=20
        )
        self.кнопка_сохранить.bind(on_press=self.сохранить_изменения)
        layout.add_widget(self.кнопка_сохранить)

        # Кнопка удаления
        self.кнопка_удалить = Button(
            text='Удалить', size_hint=(None, None), size=(200, 40),
            pos_hint={'center_x': 0.25, 'center_y': 0.48},
            color=(0, 0, 0, 1), font_name="couriercyrps_bold.ttf",
            background_color=(0, 0, 0, 0),
            font_size=20
        )
        self.кнопка_удалить.bind(on_press=self.удалить_фильм)
        layout.add_widget(self.кнопка_удалить)

        self.add_widget(background)
        self.add_widget(layout)

        # Хранилища для данных
        self.текущие_режиссеры = []
        self.текущие_актеры = []
        self.текущие_жанры = []
        self.id_фильма = None

    def on_enter(self):
        app = App.get_running_app()
        if app.текущий_пользователь:
            роль = app.текущий_пользователь.get('role', 'user')

            if роль == 'user':
                for поле in [self.поле_название, self.поле_ориг_название, self.поле_длительность,
                             self.поле_дата_выхода]:
                    поле.readonly = True

                self.спиннер_рейтинг.disabled = True
                self.спиннер_настроение.disabled = True

                self.btn_edit_dir.opacity = 0
                self.btn_edit_dir.disabled = True
                self.btn_edit_act.opacity = 0
                self.btn_edit_act.disabled = True
                self.btn_edit_genre.opacity = 0
                self.btn_edit_genre.disabled = True
                self.btn_edit_poster.opacity = 0
                self.btn_edit_poster.disabled = True
                self.кнопка_сохранить.opacity = 0
                self.кнопка_сохранить.disabled = True
                self.кнопка_удалить.opacity = 0
                self.кнопка_удалить.disabled = True
            else:
                for поле in [self.поле_название, self.поле_ориг_название, self.поле_длительность,
                             self.поле_дата_выхода]:
                    поле.readonly = False

                self.спиннер_рейтинг.disabled = False
                self.спиннер_настроение.disabled = False

                self.btn_edit_dir.opacity = 1
                self.btn_edit_dir.disabled = False
                self.btn_edit_act.opacity = 1
                self.btn_edit_act.disabled = False
                self.btn_edit_genre.opacity = 1
                self.btn_edit_genre.disabled = False
                self.btn_edit_poster.opacity = 1
                self.btn_edit_poster.disabled = False
                self.кнопка_сохранить.opacity = 1
                self.кнопка_сохранить.disabled = False
                self.кнопка_удалить.opacity = 1
                self.кнопка_удалить.disabled = False

    def загрузить_данные_фильма(self, id_фильма):
        self.id_фильма = id_фильма
        try:
            conn = подключиться_к_бд()
            if not conn:
                return

            cur = conn.cursor()

            cur.execute("""
                SELECT rus_title, orig_title, length, release_date, age_rating, mood, poster_url
                FROM movies WHERE id_movie = %s
            """, (id_фильма,))
            фильм = cur.fetchone()

            if фильм:
                название, ориг_название, длительность, дата_выхода, рейтинг, настроение, постер = фильм

                self.поле_название.text = название or ''
                self.поле_ориг_название.text = ориг_название or ''
                self.поле_длительность.text = str(длительность) if длительность else ''
                self.поле_дата_выхода.text = str(дата_выхода) if дата_выхода else ''

                self.загрузить_значения_спиннеров()

                if рейтинг:
                    self.спиннер_рейтинг.text = рейтинг
                if настроение:
                    self.спиннер_настроение.text = настроение
                if постер:
                    self.изображение_обложки.source = постер
                    self.изображение_обложки.reload()

            cur.execute("""
                SELECT d.id_director, d.first_name, d.second_name 
                FROM directors d
                JOIN directing dir ON d.id_director = dir.id_director
                WHERE dir.id_movie = %s
            """, (id_фильма,))
            режиссеры = cur.fetchall()
            self.текущие_режиссеры = [row[0] for row in режиссеры]
            self.обновить_отображение_режиссеров([f"{row[1]} {row[2]}" for row in режиссеры])

            cur.execute("""
                SELECT a.id_actor, a.first_name, a.second_name 
                FROM actors a
                JOIN acting act ON a.id_actor = act.id_actor
                WHERE act.id_movie = %s
            """, (id_фильма,))
            актеры = cur.fetchall()
            self.текущие_актеры = [row[0] for row in актеры]
            self.обновить_отображение_актеров([f"{row[1]} {row[2]}" for row in актеры])

            cur.execute("""
                SELECT g.id_genre, g.name_ru 
                FROM genres g
                JOIN genre_movies gm ON g.id_genre = gm.id_genre
                WHERE gm.id_movie = %s
            """, (id_фильма,))
            жанры = cur.fetchall()
            self.текущие_жанры = [row[0] for row in жанры]
            self.обновить_отображение_жанров([row[1] for row in жанры])

            cur.close()
            conn.close()

        except Exception as e:
            print(f"Ошибка загрузки данных фильма: {e}")

    def загрузить_значения_спиннеров(self):
        try:
            conn = подключиться_к_бд()
            if not conn:
                return

            cur = conn.cursor()

            cur.execute("SELECT DISTINCT age_rating FROM movies WHERE age_rating IS NOT NULL ORDER BY age_rating")
            рейтинги = [row[0] for row in cur.fetchall()]
            self.спиннер_рейтинг.values = рейтинги

            cur.execute("SELECT DISTINCT mood FROM movies WHERE mood IS NOT NULL ORDER BY mood")
            настроения = [row[0] for row in cur.fetchall()]
            self.спиннер_настроение.values = настроения

            cur.close()
            conn.close()

        except Exception as e:
            print(f"Ошибка загрузки значений спиннеров: {e}")

    def обновить_отображение_режиссеров(self, имена_режиссеров):
        self.грид_режиссеры.clear_widgets()
        for имя in имена_режиссеров:
            label = Label(
                text=f"• {имя}",
                size_hint_y=None,
                height=30,
                font_size=14,
                color=(0, 0, 0, 1),
                font_name="couriercyrps_bold.ttf",
                halign='left'
            )
            self.грид_режиссеры.add_widget(label)

    def обновить_отображение_актеров(self, имена_актеров):
        self.грид_актеры.clear_widgets()
        for имя in имена_актеров:
            label = Label(
                text=f"• {имя}",
                size_hint_y=None,
                height=30,
                font_size=14,
                color=(0, 0, 0, 1),
                font_name="couriercyrps_bold.ttf",
                halign='left'
            )
            self.грид_актеры.add_widget(label)

    def обновить_отображение_жанров(self, имена_жанров):
        self.грид_жанры.clear_widgets()
        for имя in имена_жанров:
            label = Label(
                text=f"• {имя}",
                size_hint_y=None,
                height=30,
                font_size=14,
                color=(0, 0, 0, 1),
                font_name="couriercyrps_bold.ttf",
                halign='left'
            )
            self.грид_жанры.add_widget(label)

    def сохранить_изменения(self, instance=None):
        # Проверка обязательных полей
        if not self.поле_название.text.strip():
            popup = Popup(title='Ошибка', content=Label(text='Введите название фильма'), size_hint=(0.6, 0.4))
            popup.open()
            return

        try:
            conn = подключиться_к_бд()
            if not conn:
                popup = Popup(title='Ошибка', content=Label(text='Ошибка подключения к БД'), size_hint=(0.6, 0.4))
                popup.open()
                return

            cur = conn.cursor()

            cur.execute("""
                UPDATE movies 
                SET rus_title = %s, orig_title = %s, length = %s, release_date = %s, 
                    age_rating = %s, mood = %s
                WHERE id_movie = %s
            """, (
                self.поле_название.text.strip(),
                self.поле_ориг_название.text.strip(),
                int(self.поле_длительность.text) if self.поле_длительность.text else None,
                self.поле_дата_выхода.text if self.поле_дата_выхода.text else None,
                self.спиннер_рейтинг.text if self.спиннер_рейтинг.text != 'Выберите возрастной рейтинг' else None,
                self.спиннер_настроение.text if self.спиннер_настроение.text != 'Выберите настроение' else None,
                self.id_фильма
            ))

            conn.commit()
            cur.close()
            conn.close()

            popup = Popup(title='Успех', content=Label(text='Изменения сохранены'), size_hint=(0.6, 0.4))
            popup.open()

        except Exception as e:
            print(f"Ошибка сохранения изменений: {e}")
            popup = Popup(title='Ошибка', content=Label(text=f'Ошибка при сохранении: {str(e)}'), size_hint=(0.6, 0.4))
            popup.open()

    def удалить_фильм(self):
        if not self.id_фильма:
            return

        content = BoxLayout(orientation='vertical', padding=10, spacing=10)
        content.add_widget(Label(text='Вы уверены, что хотите удалить этот фильм?'))

        btn_layout = BoxLayout(spacing=10)
        btn_yes = Button(text='Да', size_hint=(0.5, None), height=40)
        btn_no = Button(text='Нет', size_hint=(0.5, None), height=40)

        popup = Popup(title='Удаление фильма', content=content,
                      size_hint=(0.6, 0.4))

        def подтвердить_удаление(instance):
            try:
                conn = подключиться_к_бд()
                if not conn:
                    popup.dismiss()
                    return

                cur = conn.cursor()

                cur.execute("DELETE FROM directing WHERE id_movie = %s", (self.id_фильма,))
                cur.execute("DELETE FROM acting WHERE id_movie = %s", (self.id_фильма,))
                cur.execute("DELETE FROM genre_movies WHERE id_movie = %s", (self.id_фильма,))
                cur.execute("DELETE FROM favourite_movies WHERE id_movie = %s", (self.id_фильма,))

                cur.execute("DELETE FROM movies WHERE id_movie = %s", (self.id_фильма,))

                conn.commit()
                cur.close()
                conn.close()

                popup.dismiss()

                success_popup = Popup(
                    title='Успех',
                    content=Label(text='Фильм успешно удалён'),
                    size_hint=(0.6, 0.4)
                )
                success_popup.open()

                self.manager.current = 'main_menu'

            except Exception as e:
                popup.dismiss()
                error_popup = Popup(
                    title='Ошибка',
                    content=Label(text=f'Ошибка при удалении: {str(e)}'),
                    size_hint=(0.6, 0.4)
                )
                error_popup.open()

        btn_yes.bind(on_press=подтвердить_удаление)
        btn_no.bind(on_press=popup.dismiss)

        btn_layout.add_widget(btn_yes)
        btn_layout.add_widget(btn_no)
        content.add_widget(btn_layout)

        popup.open()

    def редактировать_обложку(self, instance):
        """Открывает всплывающее окно для редактирования обложки фильма"""
        content = BoxLayout(orientation='vertical', padding=10, spacing=10)

        # Предустановленные варианты
        предустановки = BoxLayout(orientation='horizontal', size_hint_y=None, height=40)

        def использовать_стандартное():
            стандартная_ссылка = 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png'
            self.обновить_обложку(стандартная_ссылка)
            popup.dismiss()
            self.показать_сообщение('Стандартная обложка установлена')

        btn_стандартное = Button(text='Стандартная обложка', size_hint_x=0.5)
        btn_стандартное.bind(on_press=lambda x: использовать_стандартное())
        предустановки.add_widget(btn_стандартное)

        content.add_widget(предустановки)

        # Поле для ввода своей ссылки
        поле_ссылки = TextInput(
            hint_text='Или введите прямую ссылку на изображение (jpg, png)',
            size_hint_y=None,
            height=40,
            multiline=False
        )
        content.add_widget(поле_ссылки)

        btn_layout = BoxLayout(spacing=10, size_hint_y=None, height=40)
        btn_save = Button(text='Использовать ссылку', size_hint_x=0.5)
        btn_cancel = Button(text='Отмена', size_hint_x=0.5)

        def сохранить_ссылочную_обложку(instance):
            ссылка = поле_ссылки.text.strip()
            if ссылка:
                # Проверяем URL на наличие кириллицы
                try:
                    # Пробуем закодировать как ASCII
                    ссылка.encode('ascii')
                    # Если нет ошибки, значит URL ASCII-совместим
                    self.обновить_обложку(ссылка)
                    popup.dismiss()
                    self.показать_сообщение('Обложка обновлена')
                except UnicodeEncodeError:
                    # URL содержит не-ASCII символы
                    self.показать_сообщение('Используйте ссылки только на английском языке')
            else:
                self.показать_сообщение('Введите ссылку')

        btn_save.bind(on_press=сохранить_ссылочную_обложку)
        btn_cancel.bind(on_press=lambda x: popup.dismiss())

        btn_layout.add_widget(btn_save)
        btn_layout.add_widget(btn_cancel)
        content.add_widget(btn_layout)

        popup = Popup(
            title='Редактировать обложку фильма',
            content=content,
            size_hint=(0.8, 0.5)
        )
        popup.open()

    def обновить_обложку(self, ссылка):
        """Обновляет обложку фильма в БД"""
        try:
            conn = подключиться_к_бд()
            if not conn:
                self.показать_сообщение('Ошибка подключения к БД')
                return

            cur = conn.cursor()
            cur.execute("""
                UPDATE movies 
                SET poster_url = %s 
                WHERE id_movie = %s
            """, (ссылка, self.id_фильма))
            conn.commit()
            cur.close()
            conn.close()

            # Обновляем изображение
            self.изображение_обложки.source = ссылка
            self.изображение_обложки.reload()

        except Exception as e:
            print(f"Ошибка обновления обложки: {e}")
            self.показать_сообщение(f'Ошибка: {str(e)}')

    def показать_сообщение(self, текст):
        """Показывает всплывающее сообщение"""
        popup = Popup(
            title='Сообщение',
            content=Label(text=текст),
            size_hint=(0.6, 0.4)
        )
        popup.open()

    def открыть_редактирование(self, тип_списка):
        app = App.get_running_app()
        app.текущий_тип_редактирования = тип_списка
        app.текущий_тип_сущности = 'фильм'
        self.manager.current = 'редактирование_списка'

    def перейти_к_поиску(self, instance):
        self.manager.get_screen('поиск').установить_режим_поиска(instance.text)
        self.manager.current = 'поиск'

    def вернуться_к_подбору(self, instance):
        self.manager.current = 'main_menu'

    def показать_статистику(self, instance):
        self.manager.current = 'статистика'

    def показать_профиль(self, instance):
        self.manager.current = 'профиль'


class ОкноПрофиляАктёра(Screen):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        background = Image(source='фон.png', fit_mode='fill')
        layout = FloatLayout()
        панель_навигации = создать_панель_навигации(self)
        layout.add_widget(панель_навигации)

        # Асинхронное изображение для фото
        self.изображение_фото = AsyncImage(
            source='',
            size_hint=(None, None),
            size=(200, 300),
            pos_hint={'center_x': 0.12, 'center_y': 0.68},
            allow_stretch=True,
            keep_ratio=True,
            color=(1, 1, 1, 0.9)
        )
        layout.add_widget(self.изображение_фото)

        # Кнопка редактирования фото
        self.btn_edit_photo = Button(
            text='Редактировать фото',
            size_hint=(None, None), size=(200, 40),
            pos_hint={'center_x': 0.12, 'center_y': 0.53},
            background_color=(0, 0, 0, 0), color=(0, 0, 0, 1),
            font_size=16, font_name="couriercyrps_bold.ttf"
        )
        self.btn_edit_photo.bind(on_press=self.редактировать_фото)
        layout.add_widget(self.btn_edit_photo)

        левая_колонка_x = 0.2

        self.поле_имя = TextInput(
            size_hint=(None, None), size=(300, 40),
            pos_hint={'x': левая_колонка_x, 'center_y': 0.83},
            hint_text='Имя',
            font_size=20, background_color=(0, 0, 0, 0),
            foreground_color=(0, 0, 0, 1), font_name="couriercyrps_bold.ttf"
        )
        layout.add_widget(self.поле_имя)

        self.поле_фамилия = TextInput(
            size_hint=(None, None), size=(300, 40),
            pos_hint={'x': левая_колонка_x, 'center_y': 0.78},
            hint_text='Фамилия',
            font_size=20, background_color=(0, 0, 0, 0),
            foreground_color=(0, 0, 0, 1), font_name="couriercyrps_bold.ttf"
        )
        layout.add_widget(self.поле_фамилия)

        self.поле_дата_рождения = TextInput(
            size_hint=(None, None), size=(300, 40),
            pos_hint={'x': левая_колонка_x, 'center_y': 0.73},
            hint_text='Дата рождения (ГГГГ-ММ-ДД)',
            font_size=20, background_color=(0, 0, 0, 0),
            foreground_color=(0, 0, 0, 1), font_name="couriercyrps_bold.ttf"
        )
        layout.add_widget(self.поле_дата_рождения)

        self.поле_дата_смерти = TextInput(
            size_hint=(None, None), size=(300, 40),
            pos_hint={'x': левая_колонка_x, 'center_y': 0.68},
            hint_text='Дата смерти (ГГГГ-ММ-ДД)',
            font_size=20, background_color=(0, 0, 0, 0),
            foreground_color=(0, 0, 0, 1), font_name="couriercyrps_bold.ttf"
        )
        layout.add_widget(self.поле_дата_смерти)

        self.поле_страна = TextInput(
            size_hint=(None, None), size=(300, 40),
            pos_hint={'x': левая_колонка_x, 'center_y': 0.63},
            hint_text='Страна',
            font_size=20, background_color=(0, 0, 0, 0),
            foreground_color=(0, 0, 0, 1), font_name="couriercyrps_bold.ttf"
        )
        layout.add_widget(self.поле_страна)

        правая_колонка_x = 0.55

        layout.add_widget(Label(
            text='Фильмы:',
            size_hint=(None, None), size=(200, 30),
            pos_hint={'x': правая_колонка_x, 'center_y': 0.83},
            font_size=20, color=(0, 0, 0, 1), font_name="couriercyrps_bold.ttf",
            halign='left'
        ))

        self.btn_edit_films = Button(
            text='Редактировать',
            size_hint=(None, None), size=(200, 40),
            pos_hint={'x': 0.75, 'center_y': 0.83},
            background_color=(0, 0, 0, 0), color=(0, 0, 0, 1),
            font_size=20, font_name="couriercyrps_bold.ttf"
        )
        self.btn_edit_films.bind(on_press=lambda x: self.открыть_редактирование('фильмы'))
        layout.add_widget(self.btn_edit_films)

        self.список_фильмов = ScrollView(
            size_hint=(None, None), size=(300, 150),
            pos_hint={'x': правая_колонка_x, 'center_y': 0.70}
        )
        self.грид_фильмы = GridLayout(cols=1, size_hint_y=None, spacing=5)
        self.грид_фильмы.bind(minimum_height=self.грид_фильмы.setter('height'))
        self.список_фильмов.add_widget(self.грид_фильмы)
        layout.add_widget(self.список_фильмов)

        self.кнопка_сохранить = Button(
            text='Сохранить', size_hint=(None, None), size=(200, 40),
            pos_hint={'center_x': 0.25, 'center_y': 0.53},
            color=(0, 0, 0, 1), font_name="couriercyrps_bold.ttf",
            background_color=(0, 0, 0, 0), font_size=20
        )
        self.кнопка_сохранить.bind(on_press=self.сохранить_изменения)
        layout.add_widget(self.кнопка_сохранить)

        self.кнопка_удалить = Button(
            text='Удалить', size_hint=(None, None), size=(200, 40),
            pos_hint={'center_x': 0.25, 'center_y': 0.48},
            color=(0, 0, 0, 1), font_name="couriercyrps_bold.ttf",
            background_color=(0, 0, 0, 0), font_size=20
        )
        self.кнопка_удалить.bind(on_press=self.удалить_актера)
        layout.add_widget(self.кнопка_удалить)

        self.add_widget(background)
        self.add_widget(layout)

        self.текущие_фильмы = []
        self.id_актера = None

    def on_enter(self):
        app = App.get_running_app()
        if app.текущий_пользователь:
            роль = app.текущий_пользователь.get('role', 'user')

            if роль == 'user':
                for поле in [self.поле_имя, self.поле_фамилия, self.поле_дата_рождения,
                             self.поле_дата_смерти, self.поле_страна]:
                    поле.readonly = True

                self.btn_edit_films.opacity = 0
                self.btn_edit_films.disabled = True
                self.btn_edit_photo.opacity = 0
                self.btn_edit_photo.disabled = True
                self.кнопка_сохранить.opacity = 0
                self.кнопка_сохранить.disabled = True
                self.кнопка_удалить.opacity = 0
                self.кнопка_удалить.disabled = True
            else:
                for поле in [self.поле_имя, self.поле_фамилия, self.поле_дата_рождения,
                             self.поле_дата_смерти, self.поле_страна]:
                    поле.readonly = False

                self.btn_edit_films.opacity = 1
                self.btn_edit_films.disabled = False
                self.btn_edit_photo.opacity = 1
                self.btn_edit_photo.disabled = False
                self.кнопка_сохранить.opacity = 1
                self.кнопка_сохранить.disabled = False
                self.кнопка_удалить.opacity = 1
                self.кнопка_удалить.disabled = False

    def загрузить_данные_актера(self, id_актера):
        self.id_актера = id_актера
        try:
            conn = подключиться_к_бд()
            if not conn:
                return

            cur = conn.cursor()

            cur.execute("""
                SELECT first_name, second_name, date_birth, date_death, actor_country, actor_photo
                FROM actors WHERE id_actor = %s
            """, (id_актера,))
            актер = cur.fetchone()

            if актер:
                имя, фамилия, дата_рождения, дата_смерти, страна, фото = актер

                self.поле_имя.text = имя or ''
                self.поле_фамилия.text = фамилия or ''
                self.поле_дата_рождения.text = str(дата_рождения) if дата_рождения else ''
                self.поле_дата_смерти.text = str(дата_смерти) if дата_смерти else ''
                self.поле_страна.text = страна or ''
                if фото:
                    self.изображение_фото.source = фото
                    self.изображение_фото.reload()

            cur.execute("""
                SELECT m.id_movie, m.rus_title 
                FROM movies m
                JOIN acting a ON m.id_movie = a.id_movie
                WHERE a.id_actor = %s
                ORDER BY m.rus_title
            """, (id_актера,))
            фильмы = cur.fetchall()
            self.текущие_фильмы = [row[0] for row in фильмы]
            self.обновить_отображение_фильмов([row[1] for row in фильмы])

            cur.close()
            conn.close()

        except Exception as e:
            print(f"Ошибка загрузки данных актёра: {e}")

    def обновить_отображение_фильмов(self, названия_фильмов):
        self.грид_фильмы.clear_widgets()
        for название in названия_фильмов:
            label = Label(
                text=f"• {название}",
                size_hint_y=None,
                height=30,
                font_size=14,
                color=(0, 0, 0, 1),
                font_name="couriercyrps_bold.ttf",
                halign='left',
                text_size=(280, None)
            )
            self.грид_фильмы.add_widget(label)

    def сохранить_изменения(self, instance=None):
        # Проверка обязательных полей
        if not self.поле_имя.text.strip():
            popup = Popup(title='Ошибка', content=Label(text='Введите имя актёра'), size_hint=(0.6, 0.4))
            popup.open()
            return

        try:
            conn = подключиться_к_бд()
            if not conn:
                popup = Popup(title='Ошибка', content=Label(text='Ошибка подключения к БД'), size_hint=(0.6, 0.4))
                popup.open()
                return

            cur = conn.cursor()

            cur.execute("""
                UPDATE actors 
                SET first_name = %s, second_name = %s, date_birth = %s, 
                    date_death = %s, actor_country = %s
                WHERE id_actor = %s
            """, (
                self.поле_имя.text.strip(),
                self.поле_фамилия.text.strip() if self.поле_фамилия.text.strip() else None,
                self.поле_дата_рождения.text if self.поле_дата_рождения.text else None,
                self.поле_дата_смерти.text if self.поле_дата_смерти.text else None,
                self.поле_страна.text.strip() if self.поле_страна.text.strip() else None,
                self.id_актера
            ))

            conn.commit()
            cur.close()
            conn.close()

            popup = Popup(title='Успех', content=Label(text='Изменения сохранены'), size_hint=(0.6, 0.4))
            popup.open()

        except Exception as e:
            print(f"Ошибка сохранения изменений: {e}")
            popup = Popup(title='Ошибка', content=Label(text=f'Ошибка при сохранении: {str(e)}'), size_hint=(0.6, 0.4))
            popup.open()

    def удалить_актера(self):
        if not self.id_актера:
            return

        content = BoxLayout(orientation='vertical', padding=10, spacing=10)
        content.add_widget(Label(text='Вы уверены, что хотите удалить этого актёра?'))

        btn_layout = BoxLayout(spacing=10)
        btn_yes = Button(text='Да', size_hint=(0.5, None), height=40)
        btn_no = Button(text='Нет', size_hint=(0.5, None), height=40)

        popup = Popup(title='Удаление актёра', content=content,
                      size_hint=(0.6, 0.4))

        def подтвердить_удаление(instance):
            try:
                conn = подключиться_к_бд()
                if not conn:
                    popup.dismiss()
                    return

                cur = conn.cursor()

                cur.execute("DELETE FROM acting WHERE id_actor = %s", (self.id_актера,))
                cur.execute("DELETE FROM actors WHERE id_actor = %s", (self.id_актера,))

                conn.commit()
                cur.close()
                conn.close()

                popup.dismiss()

                success_popup = Popup(
                    title='Успех',
                    content=Label(text='Актёр успешно удалён'),
                    size_hint=(0.6, 0.4)
                )
                success_popup.open()

                self.manager.current = 'main_menu'

            except Exception as e:
                popup.dismiss()
                error_popup = Popup(
                    title='Ошибка',
                    content=Label(text=f'Ошибка при удалении: {str(e)}'),
                    size_hint=(0.6, 0.4)
                )
                error_popup.open()

        btn_yes.bind(on_press=подтвердить_удаление)
        btn_no.bind(on_press=popup.dismiss)

        btn_layout.add_widget(btn_yes)
        btn_layout.add_widget(btn_no)
        content.add_widget(btn_layout)

        popup.open()

    def редактировать_фото(self, instance):
        """Открывает всплывающее окно для редактирования фото актёра"""
        content = BoxLayout(orientation='vertical', padding=10, spacing=10)

        # Предустановленные варианты
        предустановки = BoxLayout(orientation='horizontal', size_hint_y=None, height=40)

        def использовать_стандартное():
            стандартная_ссылка = 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/No-photo-m.png/800px-No-photo-m.png'
            self.обновить_фото(стандартная_ссылка)
            popup.dismiss()
            self.показать_сообщение('Стандартное фото установлено')

        btn_стандартное = Button(text='Стандартное фото', size_hint_x=0.5)
        btn_стандартное.bind(on_press=lambda x: использовать_стандартное())
        предустановки.add_widget(btn_стандартное)

        content.add_widget(предустановки)

        # Поле для ввода своей ссылки
        поле_ссылки = TextInput(
            hint_text='Или введите прямую ссылку на изображение (jpg, png)',
            size_hint_y=None,
            height=40,
            multiline=False
        )
        content.add_widget(поле_ссылки)

        btn_layout = BoxLayout(spacing=10, size_hint_y=None, height=40)
        btn_save = Button(text='Использовать ссылку', size_hint_x=0.5)
        btn_cancel = Button(text='Отмена', size_hint_x=0.5)

        def сохранить_ссылочное_фото(instance):
            ссылка = поле_ссылки.text.strip()
            if ссылка:
                # Проверяем URL на наличие кириллицы
                try:
                    # Пробуем закодировать как ASCII
                    ссылка.encode('ascii')
                    # Если нет ошибки, значит URL ASCII-совместим
                    self.обновить_фото(ссылка)
                    popup.dismiss()
                    self.показать_сообщение('Фото обновлено')
                except UnicodeEncodeError:
                    # URL содержит не-ASCII символы
                    self.показать_сообщение('Используйте ссылки только на английском языке')
            else:
                self.показать_сообщение('Введите ссылку')

        btn_save.bind(on_press=сохранить_ссылочное_фото)
        btn_cancel.bind(on_press=lambda x: popup.dismiss())

        btn_layout.add_widget(btn_save)
        btn_layout.add_widget(btn_cancel)
        content.add_widget(btn_layout)

        popup = Popup(
            title='Редактировать фото актёра',
            content=content,
            size_hint=(0.8, 0.5)
        )
        popup.open()

    def обновить_фото(self, ссылка):
        """Обновляет фото актёра в БД"""
        try:
            conn = подключиться_к_бд()
            if not conn:
                self.показать_сообщение('Ошибка подключения к БД')
                return

            cur = conn.cursor()
            cur.execute("""
                UPDATE actors 
                SET actor_photo = %s 
                WHERE id_actor = %s
            """, (ссылка, self.id_актера))
            conn.commit()
            cur.close()
            conn.close()

            # Обновляем изображение
            self.изображение_фото.source = ссылка
            self.изображение_фото.reload()

        except Exception as e:
            print(f"Ошибка обновления фото: {e}")
            self.показать_сообщение(f'Ошибка: {str(e)}')

    def показать_сообщение(self, текст):
        """Показывает всплывающее сообщение"""
        popup = Popup(
            title='Сообщение',
            content=Label(text=текст),
            size_hint=(0.6, 0.4)
        )
        popup.open()

    def открыть_редактирование(self, тип_списка):
        app = App.get_running_app()
        app.текущий_тип_редактирования = тип_списка
        app.текущий_тип_сущности = 'актер'
        app.выбранный_актер_id = self.id_актера
        self.manager.current = 'редактирование_списка'

    def перейти_к_поиску(self, instance):
        self.manager.get_screen('поиск').установить_режим_поиска(instance.text)
        self.manager.current = 'поиск'

    def вернуться_к_подбору(self, instance):
        self.manager.current = 'main_menu'

    def показать_статистику(self, instance):
        self.manager.current = 'статистика'

    def показать_профиль(self, instance):
        self.manager.current = 'профиль'


class ОкноПрофиляРежиссёра(Screen):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        background = Image(source='фон.png', fit_mode='fill')
        layout = FloatLayout()
        панель_навигации = создать_панель_навигации(self)
        layout.add_widget(панель_навигации)

        # Асинхронное изображение для фото
        self.изображение_фото = AsyncImage(
            source='',
            size_hint=(None, None),
            size=(200, 300),
            pos_hint={'center_x': 0.12, 'center_y': 0.68},
            allow_stretch=True,
            keep_ratio=True,
            color=(1, 1, 1, 0.9)
        )
        layout.add_widget(self.изображение_фото)

        # Кнопка редактирования фото
        self.btn_edit_photo = Button(
            text='Редактировать фото',
            size_hint=(None, None), size=(200, 40),
            pos_hint={'center_x': 0.12, 'center_y': 0.53},
            background_color=(0, 0, 0, 0), color=(0, 0, 0, 1),
            font_size=16, font_name="couriercyrps_bold.ttf"
        )
        self.btn_edit_photo.bind(on_press=self.редактировать_фото)
        layout.add_widget(self.btn_edit_photo)

        левая_колонка_x = 0.2

        self.поле_имя = TextInput(
            size_hint=(None, None), size=(300, 40),
            pos_hint={'x': левая_колонка_x, 'center_y': 0.83},
            hint_text='Имя',
            font_size=20, background_color=(0, 0, 0, 0),
            foreground_color=(0, 0, 0, 1), font_name="couriercyrps_bold.ttf"
        )
        layout.add_widget(self.поле_имя)

        self.поле_фамилия = TextInput(
            size_hint=(None, None), size=(300, 40),
            pos_hint={'x': левая_колонка_x, 'center_y': 0.78},
            hint_text='Фамилия',
            font_size=20, background_color=(0, 0, 0, 0),
            foreground_color=(0, 0, 0, 1), font_name="couriercyrps_bold.ttf"
        )
        layout.add_widget(self.поле_фамилия)

        self.поле_дата_рождения = TextInput(
            size_hint=(None, None), size=(300, 40),
            pos_hint={'x': левая_колонка_x, 'center_y': 0.73},
            hint_text='Дата рождения (ГГГГ-ММ-ДД)',
            font_size=20, background_color=(0, 0, 0, 0),
            foreground_color=(0, 0, 0, 1), font_name="couriercyrps_bold.ttf"
        )
        layout.add_widget(self.поле_дата_рождения)

        self.поле_дата_смерти = TextInput(
            size_hint=(None, None), size=(300, 40),
            pos_hint={'x': левая_колонка_x, 'center_y': 0.68},
            hint_text='Дата смерти (ГГГГ-ММ-ДД)',
            font_size=20, background_color=(0, 0, 0, 0),
            foreground_color=(0, 0, 0, 1), font_name="couriercyrps_bold.ttf"
        )
        layout.add_widget(self.поле_дата_смерти)

        self.поле_страна = TextInput(
            size_hint=(None, None), size=(300, 40),
            pos_hint={'x': левая_колонка_x, 'center_y': 0.63},
            hint_text='Страна',
            font_size=20, background_color=(0, 0, 0, 0),
            foreground_color=(0, 0, 0, 1), font_name="couriercyrps_bold.ttf"
        )
        layout.add_widget(self.поле_страна)

        правая_колонка_x = 0.55

        layout.add_widget(Label(
            text='Фильмы:',
            size_hint=(None, None), size=(200, 30),
            pos_hint={'x': правая_колонка_x, 'center_y': 0.83},
            font_size=20, color=(0, 0, 0, 1), font_name="couriercyrps_bold.ttf",
            halign='left'
        ))

        self.btn_edit_films = Button(
            text='Редактировать',
            size_hint=(None, None), size=(200, 40),
            pos_hint={'x': 0.75, 'center_y': 0.83},
            background_color=(0, 0, 0, 0), color=(0, 0, 0, 1),
            font_size=20, font_name="couriercyrps_bold.ttf"
        )
        self.btn_edit_films.bind(on_press=lambda x: self.открыть_редактирование('фильмы'))
        layout.add_widget(self.btn_edit_films)

        self.список_фильмов = ScrollView(
            size_hint=(None, None), size=(300, 150),
            pos_hint={'x': правая_колонка_x, 'center_y': 0.70}
        )
        self.грид_фильмы = GridLayout(cols=1, size_hint_y=None, spacing=5)
        self.грид_фильмы.bind(minimum_height=self.грид_фильмы.setter('height'))
        self.список_фильмов.add_widget(self.грид_фильмы)
        layout.add_widget(self.список_фильмов)

        self.кнопка_сохранить = Button(
            text='Сохранить', size_hint=(None, None), size=(200, 40),
            pos_hint={'center_x': 0.25, 'center_y': 0.53},
            color=(0, 0, 0, 1), font_name="couriercyrps_bold.ttf",
            background_color=(0, 0, 0, 0), font_size=20
        )
        self.кнопка_сохранить.bind(on_press=self.сохранить_изменения)
        layout.add_widget(self.кнопка_сохранить)

        self.кнопка_удалить = Button(
            text='Удалить', size_hint=(None, None), size=(200, 40),
            pos_hint={'center_x': 0.25, 'center_y': 0.48},
            color=(0, 0, 0, 1), font_name="couriercyrps_bold.ttf",
            background_color=(0, 0, 0, 0), font_size=20
        )
        self.кнопка_удалить.bind(on_press=self.удалить_режиссера)
        layout.add_widget(self.кнопка_удалить)

        self.add_widget(background)
        self.add_widget(layout)

        self.текущие_фильмы = []
        self.id_режиссера = None

    def on_enter(self):
        app = App.get_running_app()
        if app.текущий_пользователь:
            роль = app.текущий_пользователь.get('role', 'user')

            if роль == 'user':
                for поле in [self.поле_имя, self.поле_фамилия, self.поле_дата_рождения,
                             self.поле_дата_смерти, self.поле_страна]:
                    поле.readonly = True

                self.btn_edit_films.opacity = 0
                self.btn_edit_films.disabled = True
                self.btn_edit_photo.opacity = 0
                self.btn_edit_photo.disabled = True
                self.кнопка_сохранить.opacity = 0
                self.кнопка_сохранить.disabled = True
                self.кнопка_удалить.opacity = 0
                self.кнопка_удалить.disabled = True
            else:
                for поле in [self.поле_имя, self.поле_фамилия, self.поле_дата_рождения,
                             self.поле_дата_смерти, self.поле_страна]:
                    поле.readonly = False

                self.btn_edit_films.opacity = 1
                self.btn_edit_films.disabled = False
                self.btn_edit_photo.opacity = 1
                self.btn_edit_photo.disabled = False
                self.кнопка_сохранить.opacity = 1
                self.кнопка_сохранить.disabled = False
                self.кнопка_удалить.opacity = 1
                self.кнопка_удалить.disabled = False

    def загрузить_данные_режиссера(self, id_режиссера):
        self.id_режиссера = id_режиссера
        try:
            conn = подключиться_к_бд()
            if not conn:
                return

            cur = conn.cursor()

            cur.execute("""
                SELECT first_name, second_name, date_birth, date_death, director_country, director_photo
                FROM directors WHERE id_director = %s
            """, (id_режиссера,))
            режиссер = cur.fetchone()

            if режиссер:
                имя, фамилия, дата_рождения, дата_смерти, страна, фото = режиссер

                self.поле_имя.text = имя or ''
                self.поле_фамилия.text = фамилия or ''
                self.поле_дата_рождения.text = str(дата_рождения) if дата_рождения else ''
                self.поле_дата_смерти.text = str(дата_смерти) if дата_смерти else ''
                self.поле_страна.text = страна or ''
                if фото:
                    self.изображение_фото.source = фото
                    self.изображение_фото.reload()

            cur.execute("""
                SELECT m.id_movie, m.rus_title 
                FROM movies m
                JOIN directing d ON m.id_movie = d.id_movie
                WHERE d.id_director = %s
                ORDER BY m.rus_title
            """, (id_режиссера,))
            фильмы = cur.fetchall()
            self.текущие_фильмы = [row[0] for row in фильмы]
            self.обновить_отображение_фильмов([row[1] for row in фильмы])

            cur.close()
            conn.close()

        except Exception as e:
            print(f"Ошибка загрузки данных режиссёра: {e}")

    def обновить_отображение_фильмов(self, названия_фильмов):
        self.грид_фильмы.clear_widgets()
        for название in названия_фильмов:
            label = Label(
                text=f"• {название}",
                size_hint_y=None,
                height=30,
                font_size=14,
                color=(0, 0, 0, 1),
                font_name="couriercyrps_bold.ttf",
                halign='left',
                text_size=(280, None)
            )
            self.грид_фильмы.add_widget(label)

    def сохранить_изменения(self, instance=None):
        # Проверка обязательных полей
        if not self.поле_имя.text.strip():
            popup = Popup(title='Ошибка', content=Label(text='Введите имя режиссёра'), size_hint=(0.6, 0.4))
            popup.open()
            return

        try:
            conn = подключиться_к_бд()
            if not conn:
                popup = Popup(title='Ошибка', content=Label(text='Ошибка подключения к БД'), size_hint=(0.6, 0.4))
                popup.open()
                return

            cur = conn.cursor()

            cur.execute("""
                UPDATE directors 
                SET first_name = %s, second_name = %s, date_birth = %s, 
                    date_death = %s, director_country = %s
                WHERE id_director = %s
            """, (
                self.поле_имя.text.strip(),
                self.поле_фамилия.text.strip() if self.поле_фамилия.text.strip() else None,
                self.поле_дата_рождения.text if self.поле_дата_рождения.text else None,
                self.поле_дата_смерти.text if self.поле_дата_смерти.text else None,
                self.поле_страна.text.strip() if self.поле_страна.text.strip() else None,
                self.id_режиссера
            ))

            conn.commit()
            cur.close()
            conn.close()

            popup = Popup(title='Успех', content=Label(text='Изменения сохранены'), size_hint=(0.6, 0.4))
            popup.open()

        except Exception as e:
            print(f"Ошибка сохранения изменений: {e}")
            popup = Popup(title='Ошибка', content=Label(text=f'Ошибка при сохранении: {str(e)}'), size_hint=(0.6, 0.4))
            popup.open()

    def удалить_режиссера(self, instance=None):
        if not self.id_режиссера:
            return

        content = BoxLayout(orientation='vertical', padding=10, spacing=10)
        content.add_widget(Label(text='Вы уверены, что хотите удалить этого режиссёра?'))

        btn_layout = BoxLayout(spacing=10)
        btn_yes = Button(text='Да', size_hint=(0.5, None), height=40)
        btn_no = Button(text='Нет', size_hint=(0.5, None), height=40)

        popup = Popup(title='Удаление режиссёра', content=content,
                      size_hint=(0.6, 0.4))

        def подтвердить_удаление(instance):
            try:
                conn = подключиться_к_бд()
                if not conn:
                    popup.dismiss()
                    return

                cur = conn.cursor()

                cur.execute("DELETE FROM directing WHERE id_director = %s", (self.id_режиссера,))
                cur.execute("DELETE FROM directors WHERE id_director = %s", (self.id_режиссера,))

                conn.commit()
                cur.close()
                conn.close()

                popup.dismiss()

                success_popup = Popup(
                    title='Успех',
                    content=Label(text='Режиссёр успешно удалён'),
                    size_hint=(0.6, 0.4)
                )
                success_popup.open()

                self.manager.current = 'main_menu'

            except Exception as e:
                popup.dismiss()
                error_popup = Popup(
                    title='Ошибка',
                    content=Label(text=f'Ошибка при удалении: {str(e)}'),
                    size_hint=(0.6, 0.4)
                )
                error_popup.open()

        btn_yes.bind(on_press=подтвердить_удаление)
        btn_no.bind(on_press=popup.dismiss)

        btn_layout.add_widget(btn_yes)
        btn_layout.add_widget(btn_no)
        content.add_widget(btn_layout)

        popup.open()

    def редактировать_фото(self, instance):
        """Открывает всплывающее окно для редактирования фото режиссёра"""
        content = BoxLayout(orientation='vertical', padding=10, spacing=10)

        # Предустановленные варианты
        предустановки = BoxLayout(orientation='horizontal', size_hint_y=None, height=40)

        def использовать_стандартное():
            стандартная_ссылка = 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/No-photo-f.png/800px-No-photo-f.png'
            self.обновить_фото(стандартная_ссылка)
            popup.dismiss()
            self.показать_сообщение('Стандартное фото установлено')

        btn_стандартное = Button(text='Стандартное фото', size_hint_x=0.5)
        btn_стандартное.bind(on_press=lambda x: использовать_стандартное())
        предустановки.add_widget(btn_стандартное)

        content.add_widget(предустановки)

        # Поле для ввода своей ссылки
        поле_ссылки = TextInput(
            hint_text='Или введите прямую ссылку на изображение (jpg, png)',
            size_hint_y=None,
            height=40,
            multiline=False
        )
        content.add_widget(поле_ссылки)

        btn_layout = BoxLayout(spacing=10, size_hint_y=None, height=40)
        btn_save = Button(text='Использовать ссылку', size_hint_x=0.5)
        btn_cancel = Button(text='Отмена', size_hint_x=0.5)

        def сохранить_ссылочное_фото(instance):
            ссылка = поле_ссылки.text.strip()
            if ссылка:
                # Проверяем URL на наличие кириллицы
                try:
                    # Пробуем закодировать как ASCII
                    ссылка.encode('ascii')
                    # Если нет ошибки, значит URL ASCII-совместим
                    self.обновить_фото(ссылка)
                    popup.dismiss()
                    self.показать_сообщение('Фото обновлено')
                except UnicodeEncodeError:
                    # URL содержит не-ASCII символы
                    self.показать_сообщение('Используйте ссылки только на английском языке')
            else:
                self.показать_сообщение('Введите ссылку')

        btn_save.bind(on_press=сохранить_ссылочное_фото)
        btn_cancel.bind(on_press=lambda x: popup.dismiss())

        btn_layout.add_widget(btn_save)
        btn_layout.add_widget(btn_cancel)
        content.add_widget(btn_layout)

        popup = Popup(
            title='Редактировать фото режиссёра',
            content=content,
            size_hint=(0.8, 0.5)
        )
        popup.open()

    def обновить_фото(self, ссылка):
        """Обновляет фото режиссёра в БД"""
        try:
            conn = подключиться_к_бд()
            if not conn:
                self.показать_сообщение('Ошибка подключения к БД')
                return

            cur = conn.cursor()
            cur.execute("""
                UPDATE directors 
                SET director_photo = %s 
                WHERE id_director = %s
            """, (ссылка, self.id_режиссера))
            conn.commit()
            cur.close()
            conn.close()

            # Обновляем изображение
            self.изображение_фото.source = ссылка
            self.изображение_фото.reload()

        except Exception as e:
            print(f"Ошибка обновления фото: {e}")
            self.показать_сообщение(f'Ошибка: {str(e)}')

    def показать_сообщение(self, текст):
        """Показывает всплывающее сообщение"""
        popup = Popup(
            title='Сообщение',
            content=Label(text=текст),
            size_hint=(0.6, 0.4)
        )
        popup.open()

    def открыть_редактирование(self, тип_списка):
        app = App.get_running_app()
        app.текущий_тип_редактирования = тип_списка
        app.текущий_тип_сущности = 'режиссер'
        app.выбранный_режиссер_id = self.id_режиссера
        self.manager.current = 'редактирование_списка'

    def перейти_к_поиску(self, instance):
        self.manager.get_screen('поиск').установить_режим_поиска(instance.text)
        self.manager.current = 'поиск'

    def вернуться_к_подбору(self, instance):
        self.manager.current = 'main_menu'

    def показать_статистику(self, instance):
        self.manager.current = 'статистика'

    def показать_профиль(self, instance):
        self.manager.current = 'профиль'


class MyApp(App):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.текущий_пользователь = None
        self.текущий_тип_редактирования = None
        self.текущий_тип_сущности = None
        self.выбранный_фильм_id = None
        self.выбранный_актер_id = None
        self.выбранный_режиссер_id = None
        self.целевой_пользователь = None
        self.текущие_выбранные_элементы = []

    def build(self):
        Window.size = (1500, 750)
        sm = ScreenManager()
        sm.add_widget(ОкноАвторизации(name='first'))
        sm.add_widget(ОкноПодбора(name='main_menu'))
        sm.add_widget(ОкноПоиска(name='поиск'))
        sm.add_widget(ОкноПрофиля(name='профиль'))
        sm.add_widget(ОкноСтатистики(name='статистика'))
        sm.add_widget(ОкноЖанров(name='жанры'))
        sm.add_widget(ОкноБлокировкиПользователя(name='блокировка_пользователя'))
        sm.add_widget(ОкноДобавленияФильма(name='добавить_фильм'))
        sm.add_widget(ОкноРедактированияСписка(name='редактирование_списка'))
        sm.add_widget(ОкноПрофиляФильма(name='профиль_фильма'))
        sm.add_widget(ОкноДобавленияАктёра(name='добавить_актёра'))
        sm.add_widget(ОкноДобавленияРежиссёра(name='добавить_режиссёра'))
        sm.add_widget(ОкноПрофиляАктёра(name='профиль_актера'))
        sm.add_widget(ОкноПрофиляРежиссёра(name='профиль_режиссера'))
        self.title = 'Система для подбора фильмов'
        return sm


if __name__ == '__main__':
    try:
        MyApp().run()
    except KeyboardInterrupt:
        print("\nПрограмма завершена пользователем")