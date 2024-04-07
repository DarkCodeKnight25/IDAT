using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CLASE_03
{
    public partial class Form4 : Form
    {
        public Form4()
        {
            InitializeComponent();
        }

        private void lbx_categoria_SelectedIndexChanged(object sender, EventArgs e)
        {

            lbx_producto.Items.Clear();

            if (lbx_categoria.Text.Equals("DISCOS DUROS"))
            {
                lbx_producto.Items.Add("DISCO DURO TOSHIBA 500GB P300 PARA PC");
                lbx_producto.Items.Add("DISCO DURO TOSHIBA 1TB P300 PARA PC");
                lbx_producto.Items.Add("DISCO DURO TOSHIBA 2TB P300 PARA PC");
                lbx_producto.Items.Add("DISCO DURO PARA LAPTOP 500GB TOSHIBA L200");
                lbx_producto.Items.Add("DISCO DURO PARA LAPTOP 1TB TOSHIBA L200");
                lbx_producto.Items.Add("DISCO DURO SATA 1TB WD PURPLE");
                lbx_producto.Items.Add("DISCO DURO SATA 2TB WD PURPLE");
                lbx_producto.Items.Add("DISCO DURO SATA 4TB WD PURPLE");
            }
            if (lbx_categoria.Text.Equals("DISCOS DUROS EXTERNOS"))
            {
                lbx_producto.Items.Add("DISCO EXTERNO CANVIO 1TB TOSHIBA USB 3.0.");
                lbx_producto.Items.Add("DISCO EXTERNO CANVIO 1TB TOSHIBA USB 3.0.");
                lbx_producto.Items.Add("DISCO EXTERNO CANVIO 3TB TOSHIBA USB 3.0");
            }

        }

        private void lbx_producto_SelectedIndexChanged(object sender, EventArgs e)
        {

            tb_producto.Text = lbx_producto.Text;
            //También podemos usar:
            //txbProducto.Text = lsbProductos.SelectedItem.ToString();

            tb_precio.Text = Convert.ToString(lbx_producto.SelectedIndex * 10);



        }
    }
}
