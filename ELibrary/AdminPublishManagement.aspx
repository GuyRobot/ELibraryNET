<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminPublishManagement.aspx.cs" Inherits="ELibrary.AdminPublishManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="w-full px-8 py-4">
        <div class="flex space-x-6">
            <%-- Left Panel --%>
            <div class="w-5/12">

                <%--  --%>
                <div class="shadow border rounded-lg px-6 py-4">
                    <div class="card-body">

                        <div class="flex">
                            <div class="w-full text-center">
                                <h4 class="text-3xl font-extrabold">Author Publish</h4>
                            </div>
                        </div>

                        <div class="flex my-3">
                            <div class="w-full text-center">
                                <%-- ReSharper disable once Asp.Image --%>
                                <img src="Assets/Images/book.png" alt="Author Image" width="64" class="mx-auto" />
                            </div>
                        </div>

                        <%-- Author ID and Name --%>

                        <div class="flex mt-3 space-x-3">
                            <div class="w-4/12">
                                <label class="block text-sm font-medium text-gray-700">Publisher ID</label>

                                <div class="form-group">
                                    <div class="flex space-x-2">
                                        <asp:TextBox CssClass="mt-1 focus:ring-indigo-500 focus:border-indigo-500 focus:border-2 focus-visible:ring-indigo-500 focus-visible:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md bg-white border px-3 py-2 text-base leading-4 m-0 outline-none" ID="TextPublisherID" runat="server"
                                            placeholder="ID">
                                        </asp:TextBox>
                                        <asp:Button ID="ButtonGo" CssClass="cursor-pointer mt-1 px-3 py-2 bg-indigo-600 rounded-lg text-white text-sm" runat="server" OnClick="ButtonGo_Click" Text="Go" />
                                    </div>
                                </div>
                            </div>
                            <div class="w-8/12">
                                <label class="block text-sm font-medium text-gray-700">Publisher Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="mt-1 focus:ring-indigo-500 focus:border-indigo-500 focus:border-2 focus-visible:ring-indigo-500 focus-visible:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md bg-white border px-3 py-2 text-base leading-4 m-0 outline-none" ID="TextPublisherName" runat="server"
                                        placeholder="Publisher Name">
                                    </asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <%-- Button Control --%>

                        <div class="flex mt-3 space-x-3">
                            <div class="w-4/12">
                                <asp:Button class="cursor-pointer px-8 py-3 bg-indigo-600 rounded-lg text-white text-sm font-extrabold" ID="ButtonAdd" OnClick="ButtonAdd_Click" runat="server" Text="Add" />
                            </div>
                            <div class="w-4/12">
                                <asp:Button class="cursor-pointer px-8 py-3 bg-indigo-600 rounded-lg text-white text-sm font-extrabold" ID="ButtonUpdate" OnClick="ButtonUpdate_Click" runat="server" Text="Update" />
                            </div>
                            <div class="w-4/12">
                                <asp:Button class="cursor-pointer px-8 py-3 bg-indigo-600 rounded-lg text-white text-sm font-extrabold" ID="ButtonDelete" OnClick="ButtonDelete_Click" runat="server" Text="Delete" />
                            </div>
                        </div>
                    </div>
                </div>

                <a href="/" class="hover:text-indigo-600 text-indigo-500 text-sm italic mt-3 block">Back to home</a>
            </div>

            <%-- Right Panel --%>
            <div class="w-7/12">

                <%--  --%>
                <div class="shadow border rounded-lg px-6 py-4">
                    <div class="card-body">

                        <div class="flex">
                            <div class="w-full">
                                <div class="text-center">
                                    <h4 class="text-3xl font-extrabold">Publisher List</h4>
                                </div>
                            </div>
                        </div>

                        <div class="flex mt-3">
                            <asp:SqlDataSource ID="SqlDataAdminPublisherSource" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [publisher_master_tbl]"></asp:SqlDataSource>
                            <div class="w-full">
                                <asp:GridView class="w-full text-center table-bordered table table-striped" ID="GridViewPublisher" runat="server" DataSourceID="SqlDataAdminPublisherSource" CellPadding="4" ForeColor="#333333" GridLines="None">
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    <EditRowStyle BackColor="#999999" />
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>

                <a href="/" class="hover:text-indigo-600 text-indigo-500 text-sm italic mt-3 block">Back to home</a>
            </div>
        </div>
    </div>
</asp:Content>
