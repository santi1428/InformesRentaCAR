<%@ Page Title="" Language="C#" MasterPageFile="~/MenuOpciones.Master" AutoEventWireup="true" CodeBehind="AlquilerFRM.aspx.cs" Inherits="SitioWEB.Informes.AlquileresFRM" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Alquilar vehículo</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="row">
        <div class="col-12">
                    <div class="row">
                        <div class="col-11">
                            <h1 class="text-center"> Realizar Alquiler. </h1>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-5">
                                <div class="input-group mb-3">
                                   <div class="input-group">
                                    <div class="input-group-prepend">
                                        <label class="input-group-text" for="txtCodigoReserva"><i class="fas fa-search"></i></label>
                                    </div>
                                    <asp:TextBox ID="txtCodigoReserva" CssClass="form-control mr-2" runat="server" placeholder="Ingrese el codigo de la reserva"></asp:TextBox>                                    
                                    <asp:Button ID="btnBuscar" runat="server" Text="Buscar" CssClass="btn btn-primary" OnClick="btnBuscar_Click" />
                                </div>
                            </div>
                    </div> 
                    </div>
                      <div class="row">
                                <div class="col-12 text-center">
                                    <asp:Label ID="lblError" CssClass="text-success font-weight-bold" Style="font-size:24px" runat="server" Text=""></asp:Label>    
                                </div>
                      </div> 
                <div class="row">
                    <div class="col-11">
                        <asp:GridView ID="grdReservas" runat="server" CssClass="table table-secondary text-center mt-2" OnSelectedIndexChanged="grdReservas_SelectedIndexChanged"> 
                            <Columns>
                                <asp:CommandField AccessibleHeaderText="ACCIONES" HeaderText="ACCIONES" SelectText="ALQUILAR" ShowSelectButton="True" >
                                
                                <ControlStyle CssClass="btn btn-primary btn-block" />
                                </asp:CommandField>
                                
                            </Columns>
                            <HeaderStyle CssClass="thead-secondary" />
                        </asp:GridView>
                    </div>
                </div>
                <div class="row">
                    <div class="col-11 card">
                        <div class="card-header text-center">Realizar Alquiler</div>
                        <div class="card-body">
                            <div class="row justify-content-center">
                                <div class="col">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <label class="input-group-text">Fecha inicial</label>
                                        </div>
                                        <asp:TextBox ID="txtFechaInicial" runat="server"  CssClass="form-control" Enabled="False"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <label class="input-group-text">Fecha final</label>
                                        </div>
                                        <asp:TextBox ID="txtFechaFinal" runat="server"  CssClass="form-control" Enabled="False"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <label class="input-group-text"><i class="fas fa-tachometer-alt"></i></label>
                                        </div>
                                        <asp:TextBox ID="txtKMInicial" runat="server" Type="number" CssClass="form-control" placeholder="Kilometraje"></asp:TextBox>
                                         <div class="input-group-append">
                                            <label class="input-group-text">KM</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-12">
                                    <asp:Button ID="btnRegistrarAlquiler" runat="server" Text="Registrar alquiler" CssClass="btn btn-primary btn-block" Enabled="false" OnClick="btnRegistrarAlquiler_Click" />
                                </div>
                            </div>

                        </div>
                    </div>       
                 </div>
    </div>
</asp:Content>
