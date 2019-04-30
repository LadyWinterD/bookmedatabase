BookMe Database System
<ul> 
  <a href="#introduction"><li>Introduction of BookMe Database System</li></a>
  <a href="#ER"><li> ER Model of BookMe Database System</li></a>
<a href="#tables"> <li>The tables BOOKME has</li></a>
<a href="#query"> <li> The business query it uses</li></a>
  </ul>

 
 
 <h3>Introduction of BookMe Database System</h3> 
<a href = "https://www.bookme.co.nz/"> Bookme website </a>
 <p>By analyzing Bookme website, I found that there should be at least twelve association tables. The main three tables are the user table, the booking table and the product table. From my design I that the user table and three tables associated. They are country table, title table and booking table, respectively. Each user has one title and one country. And each user can book many different products. Each product has a corresponding product detail. And each product may have multiple reviews. The product will have some pictures or videos. Finally, a product will have an organization date and time. After a user book a product, the user will pay for their bills. So, there will be a payment table. There are 12 tables to explain the relationship as below.</p>
 <a name="ER">ER Model of BookMe Database System</a>
<img src="https://github.com/LovelyEmma/bookmedatabase/blob/master/img/ERD.JPG">
<a href = "https://github.com/LovelyEmma/bookmedatabase/blob/master/img/bookme.vsdx">ERD Document download</a>

<a name="tables"><h3>The tables BOOKME has</h3></a>
<ul>
    <li>Customers</li>
  <li>Products</li>
 <li> Products Detail</li>
 <li> Products Time</li>
    <li>Reviews</li>
 <li>Booking</li>
 <li>Payments</li>
  </ul>
  
<h3>Customers</h3>
<img src="https://github.com/LovelyEmma/bookmedatabase/blob/master/img/Customers.JPG">

  <h3>Products</h3>
  <img src="https://github.com/LovelyEmma/bookmedatabase/blob/master/img/Products.JPG">
  
 <h3> Products Detail</h3>
   <img src="https://github.com/LovelyEmma/bookmedatabase/blob/master/img/ProductsDetails.JPG">
 <h3> Products Time</h3>
    <img src="https://github.com/LovelyEmma/bookmedatabase/blob/master/img/ProductsTime.JPG">
    <h3>Reviews</h3>
        <img src="https://github.com/LovelyEmma/bookmedatabase/blob/master/img/Reviews.JPG">
 <h3>Booking</h3>
 <img src="https://github.com/LovelyEmma/bookmedatabase/blob/master/img/Booking.JPG">
 <h3>Payments</h3>
  <img src="https://github.com/LovelyEmma/bookmedatabase/blob/master/img/Payments.JPG">
  
  
  <h3><a name="query">The business query it uses</h3></query>
  <ul>
    <li>Customer Detail</li>
  <li>Product Information</li>
 <li> Products Detail</li>
 <li> Products Time</li>
    <li>Products Reviews</li>
 <li>Booking Information</li>
 <li>Payments Information</li>
  </ul>
  
    <h3>Customer Detail</h3>
      <img src="https://github.com/LovelyEmma/bookmedatabase/blob/master/img/QueryCustomersDetails.png">
    
  <h3>Product Information</h3>
     <img src="https://github.com/LovelyEmma/bookmedatabase/blob/master/img/QueryProductsInformation.png">
 <h3> Products Detail</h3>
      <img src="https://github.com/LovelyEmma/bookmedatabase/blob/master/img/QueryProductsDetails.png">
 <h3> Products Time</h3>
      <img src="https://github.com/LovelyEmma/bookmedatabase/blob/master/img/QueryProductsTimes.png">
    <h3>Products Reviews</h3>
         <img src="https://github.com/LovelyEmma/bookmedatabase/blob/master/img/QueryProductsReviews.png">
 <h3>Booking Information</h3>
      <img src="https://github.com/LovelyEmma/bookmedatabase/blob/master/img/QueryBookingInformation.png">
 <h3>Payments Information</h3>
      <img src="https://github.com/LovelyEmma/bookmedatabase/blob/master/img/QueryPaymentInformations.png">

