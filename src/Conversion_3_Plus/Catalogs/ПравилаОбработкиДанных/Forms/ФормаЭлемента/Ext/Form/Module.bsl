﻿
#Область ОписаниеПеременных

&НаКлиенте
Перем КонсольКодаПриОбработке;

&НаКлиенте
Перем КонсольКодаВыборкаДанных;

&НаКлиенте
Перем ПриОбработкеHTMLСфомирован;

&НаКлиенте
Перем ВыборкаДанныхHTMLСформирован;

&НаКлиенте
Перем СветлаяТемаАлгоритмПриОбработке;

&НаКлиенте
Перем СветлаяТемаАлгоритмВыборкаДанных;

#КонецОбласти

#Область ОбработчикиСобытийФормы

&НаСервере
Процедура Расш1_ПриСозданииНаСервереПосле(Отказ, СтандартнаяОбработка)
	
	Расш1_КонсольКода.СоздатьКонсоль(Элементы.АлгоритмПриОбработке, Элементы.Страница_ПриОбработке, ЭтотОбъект);
	Расш1_КонсольКода.СоздатьКонсоль(Элементы.АлгоритмВыборкаДанных, Элементы.Страница_ВыборкаДанных, ЭтотОбъект);
	
КонецПроцедуры

&НаКлиенте
Процедура Расш1_ПриОткрытииПосле(Отказ)
	
	ЭтотОбъект[Элементы.АлгоритмПриОбработке.Имя + "HTML"] = АдресКонсолиКода;
	
	Если Объект.ИспользоватьДляОтправки Тогда
		ЭтотОбъект[Элементы.АлгоритмВыборкаДанных.Имя + "HTML"] = АдресКонсолиКода;
	Иначе
		ВыборкаДанныхHTMLСформирован = Истина;
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура Расш1_ПередЗаписьюПосле(Отказ, ПараметрыЗаписи)
	
	// Запишем новый текст в реквизиты.
	Объект.АлгоритмПриОбработке = КонсольКодаПриОбработке.getText();
	Объект.АлгоритмВыборкаДанных = КонсольКодаВыборкаДанных.getText();
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовШапкиФормы

&НаКлиенте
Процедура АлгоритмПриОбработкеHTMLСформирован(Элемент)
	
	КонсольКодаПриОбработке = Элемент.Документ.defaultView;
	Расш1_КонсольКода.ИнициализацияРедактора(КонсольКодаПриОбработке, Объект.АлгоритмПриОбработке);
	ПриОбработкеHTMLСфомирован = Истина;
	ПоказатьВыборКонвертации();
	
КонецПроцедуры

&НаКлиенте
Процедура АлгоритмПриОбработкеHTMLПриНажатии(Элемент, ДанныеСобытия, СтандартнаяОбработка)
	Расш1_КонсольКода.ПриНажатии(ЭтотОбъект, ДанныеСобытия);
КонецПроцедуры

&НаКлиенте
Процедура АлгоритмВыборкаДанныхHTMLСформирован(Элемент)
	
	КонсольКодаВыборкаДанных = Элемент.Документ.defaultView;
	Расш1_КонсольКода.ИнициализацияРедактора(КонсольКодаВыборкаДанных, Объект.АлгоритмВыборкаДанных);
	ВыборкаДанныхHTMLСформирован = Истина;
	ПоказатьВыборКонвертации();
	
КонецПроцедуры

&НаКлиенте
Процедура АлгоритмВыборкаДанныхHTMLПриНажатии(Элемент, ДанныеСобытия, СтандартнаяОбработка)
	Расш1_КонсольКода.ПриНажатии(ЭтотОбъект, ДанныеСобытия);
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиКомандФормы

&НаКлиенте
Процедура СменитьТемуАлгоритмПриОбработкеHTML(Команда)
	Расш1_КонсольКода.СменитьТему(ЭтотОбъект, Элементы.АлгоритмПриОбработке.Имя + "HTML", СветлаяТемаАлгоритмПриОбработке);
КонецПроцедуры

&НаКлиенте
Процедура СменитьТемуАлгоритмВыборкаДанныхHTML(Команда)
	Расш1_КонсольКода.СменитьТему(ЭтотОбъект, Элементы.АлгоритмВыборкаДанных.Имя + "HTML", СветлаяТемаАлгоритмВыборкаДанных);
КонецПроцедуры

&НаКлиенте
Процедура ЗаменитьВхожденияАлгоритмПриОбработкеHTML()
	КонсольКодаПриОбработке.editor.trigger("", "editor.action.changeAll");
КонецПроцедуры

&НаКлиенте
Процедура ЗаменитьВхожденияАлгоритмВыборкаДанных()
	КонсольКодаВыборкаДанных.editor.trigger("", "editor.action.changeAll");
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаКлиенте
Процедура ПоказатьВыборКонвертации()
	
	Если ПриОбработкеHTMLСфомирован И ВыборкаДанныхHTMLСформирован Тогда
		
		Если СписокКонвертаций.Количество() > 1 Тогда
			Расш1_КонсольКода.ПоказатьВыборКонвертации(ЭтотОбъект, СписокКонвертаций);
		Иначе
			ВыборКонфигурацииКонсоли(0, Неопределено)
		КонецЕсли;
		
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ВыборКонфигурацииКонсоли(РезультатВопроса, ДополнительныеПараметры) Экспорт
	
	Конвертация = СписокКонвертаций[РезультатВопроса].Значение;
	
	Если Объект.ИспользоватьДляОтправки Тогда
		Направление = "Отправка";
	Иначе
		Направление = "Получение";
	КонецЕсли;
		
	ОписаниеМетаданных = ПолучитьОписаниеМетаданныхJSON(Объект.ОбъектВыборки, Конвертация, Направление);
	КонсольКодаПриОбработке.updateMetadata(ОписаниеМетаданных);
	
	Если Объект.ИспользоватьДляОтправки Тогда
		КонсольКодаВыборкаДанных.updateMetadata(ОписаниеМетаданных);
	КонецЕсли;
	
КонецПроцедуры

&НаСервереБезКонтекста
Функция ПолучитьОписаниеМетаданныхJSON(ОбъектВыборки, Конвертация, Направление)
	
	ОписаниеМетаданных = Расш1_КоллекцияМетаданных.ПолучитьОписаниеМетаданных(Конвертация);
	
	// Заполнение общих параметров обработчиков ПОД.
	ДанныеИБ = Справочники.Конфигурации.ПолучитьОписаниеДанныеИБ(ОписаниеМетаданных, ОбъектВыборки);
	КомпонентыОбмена = Справочники.Конфигурации.ПолучитьОписаниеКомпонентыОбмена(Направление);
	ПользовательскиеОбъекты = Новый Структура;
	ПользовательскиеОбъекты.Вставить("ДанныеИБ", ДанныеИБ);
	ПользовательскиеОбъекты.Вставить("КомпонентыОбмена", КомпонентыОбмена);
	ОписаниеМетаданных.Вставить("customObjects", ПользовательскиеОбъекты);
	
	ОписаниеМетаданныхJSON = Расш1_КоллекцияМетаданных.ПолучитьОписаниеМетаданныхJSON(ОписаниеМетаданных);
	Возврат ОписаниеМетаданныхJSON;
	
КонецФункции

#КонецОбласти

#Если Клиент Тогда
	ПриОбработкеHTMLСфомирован = Ложь;
	ВыборкаДанныхHTMLСформирован = Ложь;
	СветлаяТемаАлгоритмПриОбработке = Истина;
	СветлаяТемаАлгоритмВыборкаДанных = Истина;
#КонецЕсли
