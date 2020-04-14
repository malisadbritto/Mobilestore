<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Checkout.aspx.cs" Inherits="Mobile_ShopProject.Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="text-center">
        <h2>Thanks for shopping with us !!!!!!!!!!!</h2>
    </div>

    <div class="row text-center">
     
        <div class="col-md-12">
            <div class="form-group">
                <h3>Total products you Purchased :<asp:Label ID="lblproductnumber" runat="server" Text="" ForeColor="#8c8c8c"></asp:Label></h3>
            </div>
            <div class="form-group">
                <b>Total Amount Paid :
                    <asp:Label ID="lblamount" runat="server" Text=""></asp:Label></b>
            </div>
            <div class="form-group">
                <b>Products Delivery Date :
               <asp:Label ID="lbldate" runat="server" Text=""></asp:Label>
                </b>
            </div>
            <div class="form-group">
                For Return Or Cancel Order:
            <asp:Button ID="btncontact" CssClass="btn btn-primary" runat="server" Text="Contact Us" OnClick="btncontact_Click" />
            </div>
        </div>





    </div>
</asp:Content>
