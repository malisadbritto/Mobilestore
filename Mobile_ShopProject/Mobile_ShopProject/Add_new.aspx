<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add_new.aspx.cs" Inherits="Mobile_ShopProject.Category.Add_new" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet" />
    <link href="Content/site.css" rel="stylesheet" />

    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="Home.aspx">Mobile Shop</a>
                </div>
                <ul class="nav navbar-nav navbar-right">
                    <li><h4><asp:Label ID="lbladminname" Forecolor="White" runat="server"></asp:Label></h4> </li>
                    <li><a href="Login.aspx"><span class="glyphicon glyphicon-user"></span>Log out</a></li>
                    <%--<li><asp:Button ID="Button1" runat="server" CssClass="glyphicon glyphicon-user"></asp:button></li>--%>
                </ul>

            </div>
        </nav>
        <div style="height:1500px">
            <div class="col-sm-6 table-responsive">
                <asp:GridView ID="grdcategory" runat="server" AutoGenerateColumns="False" DataKeyNames="mobile_id"
                    DataSourceID="SqlDataSource1" AllowPaging="True" SelectedIndex="0"
                    CssClass="table table-bordered table-striped table-condensed"
                    OnPreRender="grdcategory_PreRender">
                    <Columns>
                        <asp:BoundField DataField="mobile_id" HeaderText="Mobile ID" ReadOnly="True">
                            <ItemStyle CssClass="col-xs-2" />
                        </asp:BoundField>
                        <asp:BoundField DataField="mobile_name" HeaderText="NAME">
                            <ItemStyle CssClass="col-xs-6" />
                        </asp:BoundField>
                        <asp:BoundField DataField="category_name" HeaderText="Category">
                            <ItemStyle CssClass="col-xs-3" />
                        </asp:BoundField>
                        <asp:CommandField ShowSelectButton="True">
                            <ItemStyle CssClass="col-xs-1" />
                        </asp:CommandField>
                    </Columns>
                    <HeaderStyle CssClass="bg-halloween" />
                    <PagerSettings Mode="NumericFirstLast" />
                    <PagerStyle CssClass="pagerStyle"
                        BackColor="#8c8c8c" HorizontalAlign="Center" />
                    <SelectedRowStyle CssClass="warning" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Mdt.mobile_id, Mdt.mobile_name, Mdt.Cpu, Mdt.Price, Mdt.RAM, Mdt.Camera, Mdt.image_url, Mdt.version, ct.category_name,Mdt.warranty,Mdt.battery,Mdt.Color FROM Mobile_description_tbl AS Mdt INNER JOIN category_table AS ct ON Mdt.category_Id = ct.category_id ORDER BY Mdt.mobile_name"></asp:SqlDataSource>
                <p>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server"
                        HeaderText="Please correct the following errors:"
                        CssClass="text-danger" />
                    <p>
                        <asp:Label ID="lblErrorMessage" runat="server"
                            EnableViewState="false" CssClass="text-danger"></asp:Label>
                    </p>
            </div>

            <div class="col-sm-6">

                <asp:FormView ID="FormView1" runat="server" DataKeyNames="mobile_id"
                    DataSourceID="SqlDataSource3" OnItemDeleted="FormView1_ItemDeleted"
                    OnItemDeleting="FormView1_ItemDeleting" OnItemInserted="FormView1_ItemInserted"
                    OnItemUpdated="FormView1_ItemUpdated">
                    <EditItemTemplate>
                        <div class="container-fluid">
                            <div class="form-group">
                                <label for="mobile_nameTextBox">Mobile Name:</label>
                                <asp:RequiredFieldValidator ID="rfvName" runat="server" Display="Dynamic"
                                    ControlToValidate="mobile_nameTextBox" CssClass="text-danger"
                                    ErrorMessage="Name is a required field." Text="*">
                                </asp:RequiredFieldValidator>
                                <asp:TextBox ID="mobile_nameTextBox" runat="server" Text='<%# Bind("mobile_name") %>' CssClass="form-control" />
                            </div>
                            <div class="form-group">
                                <label for="CpuTextBox">CPU:</label>
                                <asp:RequiredFieldValidator ID="rfvcpu" runat="server" Display="Dynamic"
                                    ControlToValidate="CpuTextBox" CssClass="text-danger"
                                    ErrorMessage="CPU is a required field." Text="*">
                                </asp:RequiredFieldValidator>

                                <asp:TextBox ID="CpuTextBox" runat="server" Text='<%# Bind("Cpu") %>' CssClass="form-control" />
                            </div>
                            <div class="form-group">
                                <label for="PriceTextBox">PRICE:</label>
                                <asp:RequiredFieldValidator ID="rfvprice" runat="server" Display="Dynamic"
                                    ControlToValidate="PriceTextBox" CssClass="text-danger"
                                    ErrorMessage="Price is a required field." Text="*">
                                </asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="cvPrice" runat="server" Display="Dynamic"
                                    ControlToValidate="PriceTextBox" Type="Double" Operator="GreaterThan"
                                    ErrorMessage=" Price must be a number greater than zero." Text="*"
                                    CssClass="text-danger" ValueToCompare=""></asp:CompareValidator>
                                <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' CssClass="form-control" />
                            </div>
                            <div class="form-group">
                                <label for="RAMTextBox">RAM:</label>
                                <asp:RequiredFieldValidator ID="rfvRAM" runat="server" Display="Dynamic"
                                    ControlToValidate="RAMTextBox" CssClass="text-danger"
                                    ErrorMessage="RAM is a required field." Text="*">
                                </asp:RequiredFieldValidator>
                                <asp:TextBox ID="RAMTextBox" runat="server" Text='<%# Bind("RAM") %>' CssClass="form-control" />
                            </div>
                            <div class="form-group">
                                <label for="CameraTextBox">Camera:</label>
                                <asp:RequiredFieldValidator ID="rfvCamera" runat="server" Display="Dynamic"
                                    ControlToValidate="CameraTextBox" CssClass="text-danger"
                                    ErrorMessage="CAMERA is a required field." Text="*">
                                </asp:RequiredFieldValidator>
                                <asp:TextBox ID="CameraTextBox" runat="server" Text='<%# Bind("Camera") %>' CssClass="form-control" />
                            </div>
                            <div class="form-group">
                                <label for="image_urlTextBox">Image URL:</label>
                                <asp:RequiredFieldValidator ID="rfvimageurl" runat="server" Display="Dynamic"
                                    ControlToValidate="image_urlTextBox" CssClass="text-danger"
                                    ErrorMessage="Image url is a required field." Text="*">
                                </asp:RequiredFieldValidator>
                                <asp:TextBox ID="image_urlTextBox" runat="server" Text='<%# Bind("image_url") %>' CssClass="form-control" />
                            </div>
                            <div class="form-group">
                                <label for="versionTextBox">Display:</label>
                                <asp:RequiredFieldValidator ID="rfvVersion" runat="server" Display="Dynamic"
                                    ControlToValidate="versionTextBox" CssClass="text-danger"
                                    ErrorMessage="Version is a required field." Text="*">
                                </asp:RequiredFieldValidator>
                                <asp:TextBox ID="versionTextBox" runat="server" Text='<%# Bind("version") %>' CssClass="form-control" />
                            </div>
                            <div class="form-group">
                                <label for="warrantyTextBox">Warranty:</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
                                    ControlToValidate="warrantyTextBox" CssClass="text-danger"
                                    ErrorMessage="Warranty is a required field." Text="*">
                                </asp:RequiredFieldValidator>
                                <asp:TextBox ID="warrantyTextBox" runat="server" Text='<%# Bind("warranty") %>' CssClass="form-control" />
                            </div>
                              <div class="form-group">
                                <label for="batteryTextBox">Battery Life:</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic"
                                    ControlToValidate="batteryTextBox" CssClass="text-danger"
                                    ErrorMessage="Battery is a required field." Text="*">
                                </asp:RequiredFieldValidator>
                                <asp:TextBox ID="batteryTextBox" runat="server" Text='<%# Bind("battery") %>' CssClass="form-control" />
                            </div>
                               <div class="form-group">
                                <label for="ColorTextBox">Color:</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic"
                                    ControlToValidate="ColorTextBox" CssClass="text-danger"
                                    ErrorMessage="Color is a required field." Text="*">
                                </asp:RequiredFieldValidator>
                                <asp:TextBox ID="ColorTextBox" runat="server" Text='<%# Bind("Color") %>' CssClass="form-control" />
                            </div>
                            <div class="form-group">
                                <label for="ddlCategory">Category ID:</label>
                                <asp:DropDownList runat="server" ID="ddlCategory"
                                    DataSourceID="SqlDataSource2" DataTextField="category_name" DataValueField="category_id"
                                    SelectedValue='<%# Bind("category_Id") %>' CssClass="form-control">
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                            </div>
                        </div>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <div class="container-fluid">
                            <div class="form-group">
                                <label for="mobile_nameTextBox">Mobile Name:</label>
                                <asp:RequiredFieldValidator ID="rfvName" runat="server" Display="Dynamic"
                                    ControlToValidate="mobile_nameTextBox" CssClass="text-danger"
                                    ErrorMessage="Name is a required field." Text="*">
                                </asp:RequiredFieldValidator>
                                <asp:TextBox ID="mobile_nameTextBox" runat="server" Text='<%# Bind("mobile_name") %>' CssClass="form-control" />
                            </div>
                            <div class="form-group">
                                <label for="CpuTextBox">CPU:</label>
                                <asp:RequiredFieldValidator ID="rfvcpu" runat="server" Display="Dynamic"
                                    ControlToValidate="CpuTextBox" CssClass="text-danger"
                                    ErrorMessage="CPU is a required field." Text="*">
                                </asp:RequiredFieldValidator>

                                <asp:TextBox ID="CpuTextBox" runat="server" Text='<%# Bind("Cpu") %>' CssClass="form-control" />
                            </div>
                            <div class="form-group">
                                <label for="PriceTextBox">PRICE:</label>
                                <asp:RequiredFieldValidator ID="rfvprice" runat="server" Display="Dynamic"
                                    ControlToValidate="PriceTextBox" CssClass="text-danger"
                                    ErrorMessage="Price is a required field." Text="*">
                                </asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="cvPrice" runat="server" Display="Dynamic"
                                    ControlToValidate="PriceTextBox" Type="Double" Operator="GreaterThan"
                                    ErrorMessage=" Price must be a number greater than zero." Text="*"
                                    CssClass="text-danger" ValueToCompare=""></asp:CompareValidator>
                                <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' CssClass="form-control" />
                            </div>
                            <div class="form-group">
                                <label for="RAMTextBox">RAM:</label>
                                <asp:RequiredFieldValidator ID="rfvRAM" runat="server" Display="Dynamic"
                                    ControlToValidate="RAMTextBox" CssClass="text-danger"
                                    ErrorMessage="RAM is a required field." Text="*">
                                </asp:RequiredFieldValidator>
                                <asp:TextBox ID="RAMTextBox" runat="server" Text='<%# Bind("RAM") %>' CssClass="form-control" />
                            </div>
                            <div class="form-group">
                                <label for="CameraTextBox">Camera:</label>
                                <asp:RequiredFieldValidator ID="rfvCamera" runat="server" Display="Dynamic"
                                    ControlToValidate="CameraTextBox" CssClass="text-danger"
                                    ErrorMessage="CAMERA is a required field." Text="*">
                                </asp:RequiredFieldValidator>
                                <asp:TextBox ID="CameraTextBox" runat="server" Text='<%# Bind("Camera") %>' CssClass="form-control" />
                            </div>
                            <div class="form-group">
                                <label for="image_urlTextBox">Image URL:</label>
                                <asp:RequiredFieldValidator ID="rfvimageurl" runat="server" Display="Dynamic"
                                    ControlToValidate="image_urlTextBox" CssClass="text-danger"
                                    ErrorMessage="Image url is a required field." Text="*">
                                </asp:RequiredFieldValidator>
                                <asp:TextBox ID="image_urlTextBox" runat="server" Text='<%# Bind("image_url") %>' CssClass="form-control" />
                            </div>
                            <div class="form-group">
                                <label for="versionTextBox">Display:</label>
                                <asp:RequiredFieldValidator ID="rfvVersion" runat="server" Display="Dynamic"
                                    ControlToValidate="versionTextBox" CssClass="text-danger"
                                    ErrorMessage="Version is a required field." Text="*">
                                </asp:RequiredFieldValidator>
                                <asp:TextBox ID="versionTextBox" runat="server" Text='<%# Bind("version") %>' CssClass="form-control" />
                            </div>
                            <div class="form-group">
                                <label for="warrantyTextBox">Warranty:</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
                                    ControlToValidate="warrantyTextBox" CssClass="text-danger"
                                    ErrorMessage="Warranty is a required field." Text="*">
                                </asp:RequiredFieldValidator>
                                <asp:TextBox ID="warrantyTextBox" runat="server" Text='<%# Bind("warranty") %>' CssClass="form-control" />
                            </div>
                              <div class="form-group">
                                <label for="batteryTextBox">Battery Life:</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic"
                                    ControlToValidate="batteryTextBox" CssClass="text-danger"
                                    ErrorMessage="Battery is a required field." Text="*">
                                </asp:RequiredFieldValidator>
                                <asp:TextBox ID="batteryTextBox" runat="server" Text='<%# Bind("battery") %>' CssClass="form-control" />
                            </div>
                               <div class="form-group">
                                <label for="ColorTextBox">Color:</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic"
                                    ControlToValidate="ColorTextBox" CssClass="text-danger"
                                    ErrorMessage="Color is a required field." Text="*">
                                </asp:RequiredFieldValidator>
                                <asp:TextBox ID="ColorTextBox" runat="server" Text='<%# Bind("Color") %>' CssClass="form-control" />
                            </div>
                            
                            <div class="form-group">
                                <label for="ddlCategory">Category ID:</label>
                                <asp:DropDownList runat="server" ID="ddlCategory"
                                    DataSourceID="SqlDataSource2" DataTextField="category_name" DataValueField="category_id"
                                    SelectedValue='<%# Bind("category_Id") %>' CssClass="form-control">
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                            </div>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <div class="list-group">
                            <div class="list-group-item bg-halloween">
                                <div class="row">
                                    <div class="col-sm-8">

                                        <b>
                                            <asp:Label ID="mobile_nameLabel" runat="server" Text='<%# Bind("mobile_name") %>' /></b>
                                    </div>

                                    <div class="col-sm-4">
                                        <b>
                                            <asp:Label ID="PriceLabel" runat="server" Text='<%# Bind("Price") %>' /></b>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="row">
                                    <div class="col-sm-8">
                                        <b>
                                            <asp:Label ID="CameraLabel" runat="server" Text='<%# Bind("Camera") %>' />
                                        </b>
                                    </div>
                                    <div class="col-sm-4">
                                        <b>
                                            <asp:Label ID="RamLabel" runat="server" Text='<%# Bind("RAM") %>' />

                                        </b>
                                    </div>
                                </div>

                            </div>

                        </div>
                        <table class="table table-bordered">
                            <thead class="bg-halloween">
                                <tr>
                                    <th>Mobile ID</th>
                                    <th>Display</th>
                                    <th>Category</th>
                                    <th>Image File</th>
                                    <th>CPU</th>
                                    <th>Memory</th>
                                    <th>Color</th>
                                    <th>Warranty</th>
                                    <th>Battery Life</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <asp:Label ID="MobileIDLabel" runat="server"
                                            Text='<%# Eval("mobile_id") %>' /></td>
                                    <td>
                                        <asp:Label ID="Version_Label" runat="server"
                                            Text='<%# Bind("version") %>' /></td>
                                    <td>
                                        <asp:Label ID="CategoryIDLabel" runat="server"
                                            Text='<%# Bind("category_Id") %>' /></td>
                                    <td>
                                        <asp:Label ID="ImageFileLabel" runat="server"
                                            Text='<%# Bind("image_url") %>' /></td>
                                    <td>
                                        <asp:Label ID="cpulbl" runat="server"
                                            Text='<%# Bind("Cpu") %>' /></td>
                                     <td>
                                        <asp:Label ID="ramlbl" runat="server"
                                            Text='<%# Bind("RAM") %>' /></td>
                                    <td>
                                        <asp:Label ID="colorlbl" runat="server"
                                            Text='<%# Bind("Color") %>' /></td>
                                    <td>
                                        <asp:Label ID="warrantylbl" runat="server"
                                            Text='<%# Bind("warranty") %>' /></td>
                                    <td>
                                        <asp:Label ID="batterylbl" runat="server"
                                            Text='<%# Bind("battery") %>' /></td>

                                </tr>
                            </tbody>
                        </table>


                        <div class="list-group">
                            <div class="list-group-item">
                                <asp:LinkButton ID="EditButton" runat="server"
                                    CausesValidation="False" CommandName="Edit" Text="Edit" />
                                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server"
                                    CausesValidation="False" CommandName="Delete" Text="Delete" />
                                &nbsp;<asp:LinkButton ID="NewButton" runat="server"
                                    CausesValidation="False" CommandName="New" Text="New" />
                            </div>
                        </div>

                    </ItemTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT [mobile_id], [mobile_name], [Cpu], [Price], [RAM], [Camera], [image_url], [version],[warranty],[battery], [Color], [category_Id] FROM [Mobile_description_tbl] WHERE ([mobile_id] = @mobile_id)"
                    UpdateCommand="Update [Mobile_description_tbl] SET 
                                 [mobile_name]=@mobile_name
                                , [Cpu]=@Cpu
                                , [Price]=@Price
                                , [RAM]=@RAM
                                 ,[Camera]=@Camera
                                , [image_url]=@image_url
                                , [version]=@version
                                ,[warranty]=@warranty
                                ,[battery]=@battery
                                , [Color]=@color
                                , [category_Id] =@category_Id
                                WHERE
                                [mobile_id]=@mobile_id"
                    DeleteCommand="DELETE FROM [Mobile_description_tbl] 
                                WHERE
                                [mobile_id]=@mobile_id"
                    InsertCommand="INSERT  INTO [Mobile_description_tbl] ([mobile_name], [Cpu], [Price], [RAM], [Camera], [image_url], [version], [category_Id],[warranty],[battery], [Color])
                                VALUES (@mobile_name,@Cpu,@Price,@RAM,@Camera,@image_url,@version,@category_Id,@warranty,@battery,@Color)">
                    <DeleteParameters>
                        <asp:Parameter Name="mobile_id" Type="Int32" />

                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="mobile_name" Type="String" />
                        <asp:Parameter Name="Cpu" Type="String" />
                        <asp:Parameter Name="Price" Type="String" />
                        <asp:Parameter Name="RAM" Type="String" />
                        <asp:Parameter Name="Camera" Type="String" />
                        <asp:Parameter Name="image_url" Type="String" />
                        <asp:Parameter Name="version" Type="String" />
                        <asp:Parameter Name="category_Id" />
                        <asp:Parameter Name="warranty" Type="String"/>
                        <asp:Parameter Name="battery" Type="String"/>
                        <asp:Parameter Name="Color" Type="String"/>
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="grdcategory" Name="mobile_id" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="mobile_id" Type="String" />

                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>

        </div>


        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [category_name], [category_id] FROM [category_table]"></asp:SqlDataSource>


        <footer>

            <a href="https://www.facebook.com/"><i class="fa fa-facebook"></i></a>
            <a href="https://twitter.com/"><i class="fa fa-twitter"></i></a>
            <a href="https://ca.linkedin.com/company/linkedin"><i class="fa fa-linkedin"></i></a>
            <a href="#"><i class="fa fa-google-plus"></i></a>
            <a href="#"><i class="fa fa-skype"></i></a>
        </footer>
    </form>
</body>
</html>
