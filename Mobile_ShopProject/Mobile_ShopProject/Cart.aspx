<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Mobile_ShopProject.WebForm5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h1>Shopping Cart</h1>
          <br />
      <div><h3><asp:Label ID="lblemptyCart" runat="server" ForeColor="#8c8c8c"></asp:Label></h3></div>
        
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Height="193px" OnRowDeleting="GridView1_RowDeleting" ShowFooter="True" Width="1135px"  CssClass="table table-bordered table-striped table-condensed">
                        <HeaderStyle HorizontalAlign="Left" BackColor="#8c8c8c" ForeColor="#FFFFFF" />
                        <FooterStyle HorizontalAlign="Right" BackColor="#6C6B66" ForeColor="#FFFFFF" />
                        <AlternatingRowStyle BackColor="#F8F8F8" />
                        <Columns>
                            <asp:BoundField DataField="srno" HeaderText="SR NO">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="mobile_id" HeaderText="Mobile ID">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="mobile_name" HeaderText="Mobile name">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                         
                            <asp:ImageField DataImageUrlField="productimage" HeaderText="Display" ControlStyle-Width="80" ControlStyle-Height = "150">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:ImageField>
                            <asp:BoundField DataField="price" HeaderText="Price">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="quantity" HeaderText="Quantity">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="totalprice" HeaderText="Total price">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:CommandField DeleteText="Remove" ShowDeleteButton="True" />
                        </Columns>
                    </asp:GridView>
       

        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
        <asp:Button ID="btn_checkout" runat="server" Text="Check Out"  CssClass="btn btn-primary" OnClick="btn_checkout_Click" />&nbsp;
         <asp:Button ID="btn_back" runat="server"  Text="Back to Products" CssClass="btn btn-primary"   OnClick="btn_back_Click"/>
     
    </div>
    <br />
    <br />
</asp:Content>

