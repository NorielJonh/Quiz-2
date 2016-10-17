<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Products_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Products</title>
    <link href="../../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../../Content/font-awesome.min.css" rel="stylesheet" />
</head>
<body>
    <div class="container">
        <h1 class="text-left">
            <i class="fa fa-spoon">View Products</i>
        </h1>
        <div class="well">
            <form runat="server" class="form-horizontal">
                <asp:Panel ID="pnlRegistrants" runat="server"
                    DefaultButton="btnSearch">
                    <div class="col-lg-5 pull-right">
                        <div class="input-group">
                            <asp:TextBox ID="txtKeyword" runat="server" CssClass="form-control"
                                placeholder="Keyword...." />
                            <span class="input-group-btn">
                                <asp:LinkButton ID="btnSearch" runat="server" class="btn btn-info"
                                    OnClick="btnSearch_Click">
                                    <i class="fa fa-search"></i>
                                </asp:LinkButton>
                            </span>
                        </div>
                    </div>
                    <div class="row"></div>
                    <br />
                    <table class="table table-hover">
                        <thead>
                            <th>#</th>
                            <th>Name</th>
                            <th>Category</th>
                            <th>Description</th>
                            <th>Image</th>
                            <th>Price</th>
                            <th>Is Featured?</th>
                            <th>Date Added</th>
                            <th>Date Modified</th>
                            <th>Actions</th>
                        </thead>
                        <tbody>
                            <asp:ListView ID="lvProducts" runat="server"
                                OnPagePropertiesChanging="lvProducts_PagePropertiesChanging">
                                <ItemTemplate>
                                    <tr>
                                        <td><%# Eval("ProductID") %></td>
                                        <td><%# Eval("Name") %></td>
                                        <td><%# Eval("Category") %></td>
                                        <td><%# Eval("Description") %></td>
                                        <td>
                                            <asp:Image ID="ImageID" runat="server" ImageUrl='<%# Eval("Image") %>' Height="100px" Width="100px"></asp:Image>
                                        </td>
                                        <td><%# Eval("Price") %></td>
                                        <td><%# Eval("IsFeatured") %></td>
                                        <td><%# Eval("DateAdded", "{0: MMM dd, yyyy hh:mm}") %></td>
                                        <td><%# Eval("DateModified", "{0: MMM dd, yyyy hh:mm}") %></td>
                                        <td>
                                            <a href='Details.aspx?ID=<%# Eval("ProductID") %>'
                                                class="btn btn-xs btn-info">
                                                <i class="fa fa-search"></i>
                                            </a>
                                            <a href='Delete.aspx?ID=<%# Eval("ProductID") %>'
                                                class="btn btn-xs btn-danger" onclick='return confirm("Are you sure?")'>
                                                <i class="fa fa-trash"></i>
                                            </a>
                                    </tr>
                                </ItemTemplate>

                                <EmptyDataTemplate>
                                    <tr>
                                        <td colspan="10">
                                            <h2 class="text-center">No records found.
                                            </h2>
                                        </td>
                                    </tr>
                                </EmptyDataTemplate>
                            </asp:ListView>
                        </tbody>
                    </table>
                    <hr />
                    <div class="container">
                        <asp:DataPager ID="dpProducts" runat="server" PageSize="3"
                            PagedControlID="lvProducts">
                            <Fields>
                                <asp:NumericPagerField ButtonType="Button"
                                    CurrentPageLabelCssClass="btn btn-info"
                                    NumericButtonCssClass="btn"
                                    NextPreviousButtonCssClass="btn" />
                            </Fields>
                        </asp:DataPager>
                    </div>
                </asp:Panel>
            </form>
        </div>
    </div>
</body>
</html>
