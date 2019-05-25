using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;
using libComunes.CapaDatos;
using libComunes.CapaObjetos;

namespace libClases_DS.Informes
{
    public class AlquilerCTRL
    {
        #region Atributos/Propiedades
        private string SQL;
        public string error { get; private set; }
        public string fechaInicial { get; set; }
        public string fechaFinal { get; set; }
        public Int32 kmInicial { get; set; }
        public Int32 reservaId { get; set; }
        public GridView grdAlquiler { get; set; }
        #endregion

        #region Metodos
        public bool Ingresar()
        {
            SQL = "SP_Alquiler_Insert ";
            clsConexion oConexion = new clsConexion();
            oConexion.SQL = SQL;
            oConexion.AgregarParametro("@KM_Inicial", System.Data.SqlDbType.Int, 8, kmInicial);
            oConexion.AgregarParametro("@FechaInicial", System.Data.SqlDbType.VarChar, 20, fechaInicial);
            oConexion.AgregarParametro("@FechaFinal", System.Data.SqlDbType.VarChar, 20, fechaFinal);
            oConexion.AgregarParametro("@ReservaId", System.Data.SqlDbType.BigInt, 8, reservaId);
            oConexion.StoredProcedure = true;
            if (oConexion.EjecutarSentencia())
            {
                oConexion = null;
                return true;
            }
            else
            {
                error = oConexion.Error;
                oConexion = null;
                return false;
            }
        }

        public bool LlenarGrid()
        {
            if (grdAlquiler == null)
            {
                error = "No definió el grid de alquileres";
                return false;
            }
            SQL = "SP_Consultar_Alquiler";
            clsGrid oGrid = new clsGrid();
            oGrid.SQL = SQL;
            oGrid.gridGenerico = grdAlquiler;
            oGrid.StoredProcedure = true;
            if (oGrid.LlenarGridWeb())
            {
                grdAlquiler = oGrid.gridGenerico;
                oGrid = null;
                return true;
            }
            else
            {
                error = oGrid.Error;
                oGrid = null;
                return false;
            }
        }
        #endregion

    }
}
