<%-- 
    Document   : invoice
    Created on : Jul 16, 2022, 11:51:05 PM
    Author     : buihi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="<c:url value="/css/styleindex.css"/>" rel="stylesheet" />
        <link href="<c:url value="/css/bootstrap.min.css"/>" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
              integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
              integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="./js/Jquery.js"></script>
        <script src="./js/bootstrap.min.js"></script>
        <script src="./js/bootstrap.bundle.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">       
        <link href="<c:url value="/html/styleindex.css" />" rel="stylesheet">
        <link rel="stylesheet" href="<c:url value="/css/button.css"/>">
        <title>Bill - StockP</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body p-0">
                            <div class="row p-5">
                                <div class="col-md-6">
                                    <form action="CartController">
                                        <h2>Payment Successfully.</h2>
                                        <input type="submit" value="Back to homepage" name="op" style="border-radius: 10px ; background-color: rgba(rgb(22, 22, 22), green, blue, alpha); border-color: white;"/>
                                    </form>
                                </div>

                                <div class="col-md-6 text-right">
                                    <p class="font-weight-bold mb-1">Invoice #id</p>
                                </div>
                            </div>

                            <hr class="my-5">

                            <div class="row pb-5 p-5">
                                <div class="col-md-6">
                                    <p class="font-weight-bold mb-4">Customer Information</p>
                                    <p class="mb-1">Customer id</p>
                                    <p>Customer name</p>
                                    <p class="mb-1">Customer username</p>
                                    <p class="mb-1">Customer gender</p>
                                    <p class="mb-1">Address</p>
                                    <p class="mb-1">Customer password</p>
                                </div>

                                <div class="col-md-6 text-right">
                                    <p class="font-weight-bold mb-4">Payment Details</p>
                                    <p class="mb-1"><span class="text-muted">Payment Type: </span> Cash</p>
                                    <p class="mb-1"><span class="text-muted">Name: </span> Customer name</p>
                                </div>
                            </div>
                            <div class="row p-5">
                                <div class="col-md-12">
                                    <c:if test="${not empty list}">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th class="">ID</th>
                                                    <th class="">Date</th>
                                                    <th class="">Price</th>
                                                    <th class="">Customer ID</th>
                                                </tr>
                                            </thead>
                                            <c:forEach var="invoice" items="${list}" varStatus="loop">
                                                <tbody>
                                                    <tr>
                                                        <td>${invoice.invoiceid}</td>
                                                        <td>${invoice.date}</td>
                                                        <td>${invoice.totalprice}</td>
                                                        <td>${invoice.customer}</td>
                                                    </tr>
                                                </tbody>
                                            </c:forEach>
                                        </table>
                                    </c:if>
                                </div>
                            </div>
                            <div class="d-flex flex-row-reverse bg-dark text-white p-4">
                                <div class="py-3 px-5 text-right">
                                    <div class="mb-2">Grand Total</div>
                                    <div class="h2 font-weight-light">$</div>
                                </div>

                                <div class="py-3 px-5 text-right">
                                    <div class="mb-2">Discount</div>
                                    <div class="h2 font-weight-light">0%</div>
                                </div>

                                <div class="py-3 px-5 text-right">
                                    <div class="mb-2">Sub - Total amount</div>
                                    <div class="h2 font-weight-light">$</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>