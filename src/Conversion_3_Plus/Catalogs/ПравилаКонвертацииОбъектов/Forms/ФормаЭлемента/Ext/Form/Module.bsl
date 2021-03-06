﻿#Область ОписаниеПеременных

&НаКлиенте
Перем КонсольКодаПриОтправке;

&НаКлиенте
Перем КонсольКодаПередПолучениемДанных;

&НаКлиенте
Перем КонсольКодаПриПолученниДанных;

&НаКлиенте
Перем КонсольКодаПослеЗагрузкиВсехДанных;

&НаКлиенте
Перем ПриОтправкеДанныхHTMLСфомирован;

&НаКлиенте
Перем ПередПолучениемДанныхHTMLСформирован;

&НаКлиенте
Перем ПриПолученииДанныхHTMLСформирован;

//&НаКлиенте
//Перем ПослеЗагрузкиВсехДанныхСформирован;

&НаКлиенте
Перем СветлаяТемаАлгоритмПриОтправкеДанных;

&НаКлиенте
Перем СветлаяТемаАлгоритмПередПолучениемДанных;

&НаКлиенте
Перем СветлаяТемаАлгоритмПриПолученииДанных;

#КонецОбласти

#Область ОбработчикиСобытийФормы

&НаСервере
Процедура Расш1_ПриСозданииНаСервереПосле(Отказ, СтандартнаяОбработка)
	
	Расш1_КонсольКода.СоздатьКонсоль(Элементы.АлгоритмПриОтправкеДанных, Элементы.Страница_ПриОтправке, ЭтотОбъект);
	Расш1_КонсольКода.СоздатьКонсоль(Элементы.АлгоритмПередПолучениемДанных, Элементы.Страница_ПриКонвертацииДанныхXDTO, ЭтотОбъект);
	Расш1_КонсольКода.СоздатьКонсоль(Элементы.АлгоритмПриПолученииДанных, Элементы.Страница_ПередЗаписьюПолученныхДанных, ЭтотОбъект);
	Элементы.АлгоритмПослеЗагрузкиВсехДанныхТекст.Видимость = Истина;
	
КонецПроцедуры

&НаКлиенте
Процедура Расш1_ПриОткрытииПосле(Отказ)
	
	ЭтотОбъект[Элементы.АлгоритмПриОтправкеДанных.Имя + "HTML"] = АдресКонсолиКода;
	
	Если Объект.ИспользоватьДляПолучения Тогда
		ЭтотОбъект[Элементы.АлгоритмПередПолучениемДанных.Имя + "HTML"] = АдресКонсолиКода;
		ЭтотОбъект[Элементы.АлгоритмПриПолученииДанных.Имя + "HTML"] = АдресКонсолиКода;
		//ПослеЗагрузкиВсехДанныхHTML = АдресКонсолиКода;
	Иначе
		ЭтотОбъект[Элементы.АлгоритмПередПолучениемДанных.Имя + "HTML"] = АдресКонсолиКода;
		ЭтотОбъект[Элементы.АлгоритмПриПолученииДанных.Имя + "HTML"] = АдресКонсолиКода;
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура Расш1_ПередЗаписьюПосле(Отказ, ПараметрыЗаписи)
	
	// Запишем новый текст в реквизиты.
	Объект.АлгоритмПриОтправкеДанных = КонсольКодаПриОтправке.getText();
	Объект.АлгоритмПередПолучениемДанных = КонсольКодаПередПолучениемДанных.getText();
	Объект.АлгоритмПриПолученииДанных = КонсольКодаПриПолученниДанных.getText();
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовШапкиФормы

&НаКлиенте
Процедура АлгоритмПриОтправкеДанныхHTMLСформирован(Элемент)
	
	КонсольКодаПриОтправке = Элемент.Документ.defaultView;
	Расш1_КонсольКода.ИнициализацияРедактора(КонсольКодаПриОтправке, Объект.АлгоритмПриОтправкеДанных);
	ПриОтправкеДанныхHTMLСфомирован = Истина;
	ПоказатьВыборКонвертации();
	
КонецПроцедуры

&НаКлиенте
Процедура АлгоритмПриОтправкеДанныхHTMLПриНажатии(Элемент, ДанныеСобытия, СтандартнаяОбработка)
	Расш1_КонсольКода.ПриНажатии(ЭтотОбъект, ДанныеСобытия);
КонецПроцедуры

&НаКлиенте
Процедура АлгоритмПередПолучениемДанныхHTMLСформирован(Элемент)
	
	КонсольКодаПередПолучениемДанных = Элемент.Документ.defaultView;
	Расш1_КонсольКода.ИнициализацияРедактора(КонсольКодаПередПолучениемДанных, Объект.АлгоритмПередПолучениемДанных);
	ПередПолучениемДанныхHTMLСформирован = Истина;
	ПоказатьВыборКонвертации();
	
КонецПроцедуры

&НаКлиенте
Процедура АлгоритмПередПолучениемДанныхHTMLПриНажатии(Элемент, ДанныеСобытия, СтандартнаяОбработка)
	Расш1_КонсольКода.ПриНажатии(ЭтотОбъект, ДанныеСобытия);
КонецПроцедуры

&НаКлиенте
Процедура АлгоритмПриПолученииДанныхHTMLСформирован(Элемент)
	
	КонсольКодаПриПолученниДанных = Элемент.Документ.defaultView;
	Расш1_КонсольКода.ИнициализацияРедактора(КонсольКодаПриПолученниДанных, Объект.АлгоритмПриПолученииДанных);
	ПриПолученииДанныхHTMLСформирован = Истина;
	ПоказатьВыборКонвертации();
	
КонецПроцедуры

&НаКлиенте
Процедура АлгоритмПриПолученииДанныхHTMLПриНажатии(Элемент, ДанныеСобытия, СтандартнаяОбработка)
	Расш1_КонсольКода.ПриНажатии(ЭтотОбъект, ДанныеСобытия);
КонецПроцедуры

//&НаКлиенте
//Процедура Расш1_ПослеЗагрузкиВсехДанныхHTMLДокументСформированПосле(Элемент)
//	
//	КонсольКодаПослеЗагрузкиВсехДанных = Элементы.ПриОтправкеДанныхHTML.Документ.defaultView;
//	Расш1_КонсольКода.ИнициализацияРедактора(КонсольКодаПослеЗагрузкиВсехДанных, АлгоритмПослеЗагрузкиВсехДанных.Алгоритм);
//	
//КонецПроцедуры

#КонецОбласти

#Область ОбработчикиКомандФормы

&НаКлиенте
Процедура СменитьТемуАлгоритмПриОтправкеДанныхHTML(Команда)
	Расш1_КонсольКода.СменитьТему(ЭтотОбъект, Элементы.АлгоритмПриОтправкеДанных.Имя + "HTML", СветлаяТемаАлгоритмПриОтправкеДанных);
КонецПроцедуры

&НаКлиенте
Процедура ЗаменитьВхожденияАлгоритмПриОтправкеДанныхHTML()
	КонсольКодаПриОтправке.editor.trigger("", "editor.action.changeAll");
КонецПроцедуры

&НаКлиенте
Процедура СменитьТемуАлгоритмПередПолучениемДанныхHTML(Команда)
	Расш1_КонсольКода.СменитьТему(ЭтотОбъект, Элементы.АлгоритмПередПолучениемДанных.Имя + "HTML", СветлаяТемаАлгоритмПередПолучениемДанных);
КонецПроцедуры

&НаКлиенте
Процедура ЗаменитьВхожденияАлгоритмПередПолучениемДанныхHTML()
	КонсольКодаПередПолучениемДанных.editor.trigger("", "editor.action.changeAll");
КонецПроцедуры

&НаКлиенте
Процедура СменитьТемуАлгоритмПриПолученииДанныхHTML(Команда)
	Расш1_КонсольКода.СменитьТему(ЭтотОбъект, Элементы.АлгоритмПриПолученииДанных.Имя + "HTML", СветлаяТемаАлгоритмПриПолученииДанных);
КонецПроцедуры

&НаКлиенте
Процедура ЗаменитьВхожденияАлгоритмПриПолученииДанныхHTML()
	КонсольКодаПриПолученниДанных.editor.trigger("", "editor.action.changeAll");
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаКлиенте
Процедура ПоказатьВыборКонвертации()
	
	Если ПриОтправкеДанныхHTMLСфомирован 
		И ПередПолучениемДанныхHTMLСформирован
		И ПриПолученииДанныхHTMLСформирован Тогда
		
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
	ОписаниеМетаданныхJSON = ПолучитьОписаниеМетаданныхJSON(Конвертация);
	КонсольКодаПриОтправке.updateMetadata(ОписаниеМетаданныхJSON);
	
	Если Объект.ИспользоватьДляПолучения Тогда
		КонсольКодаПередПолучениемДанных.updateMetadata(ОписаниеМетаданныхJSON);
		КонсольКодаПриПолученниДанных.updateMetadata(ОписаниеМетаданныхJSON);
	КонецЕсли;
	
КонецПроцедуры

&НаСервереБезКонтекста
Функция ПолучитьОписаниеМетаданныхJSON(Знач Конвертация)
	
	ОписаниеМетаданных = Расш1_КоллекцияМетаданных.ПолучитьОписаниеМетаданных(Конвертация);
	//"customObjects":{
	//         "_СтруктураВыгрузки":{
	//            "ref": "classes.Структура",
	//            "properties":{
	//               "Номенклатура":{
	//                  "name":"Номенклатура",
	//                  "description":"Ссылка на справочник номенклатуры",
	//                  "ref":"catalogs.Товары"
	//               },
	//               "Остаток":{
	//                  "name":"Остаток"
	//               }
	//            },
	
	//ОбъетыСобытия = Справочники.Конфигурации.ПолучитьОписаниеПараметровОбработчиков();
	//ОписаниеМетаданных.Вставить("customObjects", ОбъетыСобытия);
	
	ОписаниеМетаданныхJSON = Расш1_КоллекцияМетаданных.ПолучитьОписаниеМетаданныхJSON(ОписаниеМетаданных);
	Возврат ОписаниеМетаданныхJSON;
	
КонецФункции

#КонецОбласти

#Если Клиент Тогда
	ПриОтправкеДанныхHTMLСфомирован = Ложь;
	ПередПолучениемДанныхHTMLСформирован = Ложь;
	ПриПолученииДанныхHTMLСформирован = Ложь;
	СветлаяТемаАлгоритмПриОтправкеДанных = Истина;
	СветлаяТемаАлгоритмПередПолучениемДанных = Истина;
	СветлаяТемаАлгоритмПриПолученииДанных = Истина;
#КонецЕсли
