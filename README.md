# PSW-Database
В базе данных PetShopDB хранится информация о товарах, о бронировании и о клиентах.
## Информация о файлах
1. Файл CreatPetShopDB.sql содержит создание базы данных с помощью SQL-запросов.
2. Файл TriggerInsertBooking.sql содержит триггер, который уменьшает количество доступных товаров(поле AmountAvailable) в таблице Items при бронировании, то есть добавлении записи в таблицу Bookings.
3. Файл TriggerUpdateBookingStatus.sql содержит триггер, который при изменении статуса брони(поле BookingStatus) меняет количество товара в таблице Items. Если статус меняется на 'Забрали' количество всех товаров(поле AmountAll) в таблице Items уменьшилось на количество, которое было забронировано. Если же статус изменился на 'Просрочено' количество доступных товаров(поле AmountAvailable) в таблице Items увеличилось на забронированное количество.
4. Файл InsertItems.sql содержит SQL-запросы заполнения базы данных.
