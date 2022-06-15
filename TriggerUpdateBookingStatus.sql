CREATE TRIGGER UpdateBookingStatus
ON Bookings
AFTER UPDATE
AS
BEGIN
DECLARE @BookingStatus nvarchar(30), @ItemID INT, @BookingAmount INT
SELECT @ItemID = ItemID, @BookingAmount = Amount, @BookingStatus = BookingStatus FROM inserted
IF (@BookingStatus = 'Забрали') --статус сменился на 'Забрали'
   BEGIN
   UPDATE Items --кол-во всех товаров уменьшилось на кол-во, которое было забронировано
   SET AmountAll = AmountAll - @BookingAmount 
   WHERE ID = @ItemID
   END
ELSE IF (@BookingStatus = 'Просрочено') --статус сменился на 'Просрочено'
   BEGIN
   UPDATE Items --кол-во доступных товаров увеличилось на забронированное кол-во
   SET AmountAvailable = AmountAvailable + @BookingAmount
   WHERE ID = @ItemID
   END
END
