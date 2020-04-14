<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="orders.aspx.cs" Inherits="Mobile_ShopProject.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style2">
     <tr>
            <td class="tblhead" colspan="3">
                Mobile Specifications</td>
        </tr>
     
        <tr>
           
            <td class="style6">
                <asp:Image ID="img" runat="server" Height="335px" Width="227px" 
                    CssClass="vimg" />
            </td>

            <td valign="top" 
                
                
                style="border-left-style: solid; border-left-width: thin; border-left-color: #C0C0C0">
                <table style="width: 603px">
                    <tr>
                        <td class="style19">
                            Product Name :</td>
                        <td colspan="2">
                            
                <asp:Label ID="lblmobilename" runat="server" ForeColor="#000369" ></asp:Label>
                
                        </td>
                        <td>
                            
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style19">
                Item Price :
               
                        </td>
                        
                        <td colspan="2">
              
                <asp:Label ID="lblprice" runat="server" ForeColor="#000369" ></asp:Label>
              
                        </td>
                        <td>
              
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style19">
                            Item Quntity :
                
                        </td>
                        <td colspan="2">
                <asp:TextBox ID="txtquantity" runat="server" OnTextChanged="txtquantity_TextChanged" AutoPostBack="True"></asp:TextBox>
                             </td>
                        <td>
                
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style14" colspan="4">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style14" bgcolor="#E3BBFF" colspan="4">
                            General Specification :</td>
                    </tr>
                    <tr>
                        <td class="style19">
                            Ram :</td>
                        <td class="style18">
                
                <asp:Label ID="lblram" runat="server" ForeColor="#000369" ></asp:Label>
               
                        </td>
                        <td class="style20">
                            CPU : </td>
                        <td>
                
                <asp:Label ID="lblCPU" runat="server" ForeColor="#000369" ></asp:Label>
               
                        </td>
                    </tr>
                    <tr>
                        <td class="style19">
                            VERSION :</td>
                        <td class="style18">
                
                <asp:Label ID="lblversion" runat="server" ForeColor="#000369" ></asp:Label>
               
                        </td>
                        <td class="style20">
                           Camera:</td>
                        <td>
                
                <asp:Label ID="lblcamera" runat="server" ForeColor="#000369" ></asp:Label>
               
                        </td>
                    </tr>
                    
                    
                   
                    <tr>
                        <td class="style20">
                           Total Amount:</td>
                        <td>
                            <asp:Label ID="lblamount" runat="server" > </asp:Label>
                        <td> &nbsp;</td>
                    </tr>
                </table>
                <br />
                <asp:Button ID="btn_buynow" runat="server" CssClass="btn btn-primary"  
                    Text="Buy Now" Width="140px"  Height="40px" OnClick="btn_buynow_Click" />
            </td>
        </tr>
        <tr>
            <td class="style4" colspan="3" 
                style="border-top-style: solid; border-top-width: thin; border-top-color: #369">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style4" colspan="3" style="font-size: medium">
                  <asp:Label ID="lblerror" runat="server" forecolor="Red"></asp:Label></td>
        </tr>
       
        </table>










    



</asp:Content>
