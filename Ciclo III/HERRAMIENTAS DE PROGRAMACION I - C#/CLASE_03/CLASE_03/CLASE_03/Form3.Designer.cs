namespace CLASE_03
{
    partial class Form3
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.label1 = new System.Windows.Forms.Label();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.rb_n3 = new System.Windows.Forms.RadioButton();
            this.rb_n2 = new System.Windows.Forms.RadioButton();
            this.rb_n1 = new System.Windows.Forms.RadioButton();
            this.label2 = new System.Windows.Forms.Label();
            this.tb_sueldo = new System.Windows.Forms.TextBox();
            this.cbx_estado = new System.Windows.Forms.ComboBox();
            this.label3 = new System.Windows.Forms.Label();
            this.bt_boni = new System.Windows.Forms.Button();
            this.tb_boni = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.cbx_pension = new System.Windows.Forms.ComboBox();
            this.bt_descuento = new System.Windows.Forms.Button();
            this.tb_descuento = new System.Windows.Forms.TextBox();
            this.button1 = new System.Windows.Forms.Button();
            this.tb_neto = new System.Windows.Forms.TextBox();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Bookman Old Style", 26.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(182, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(424, 41);
            this.label1.TabIndex = 0;
            this.label1.Text = "PLANILLA DE SUELDO";
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.rb_n3);
            this.groupBox1.Controls.Add(this.rb_n2);
            this.groupBox1.Controls.Add(this.rb_n1);
            this.groupBox1.Location = new System.Drawing.Point(23, 89);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(148, 159);
            this.groupBox1.TabIndex = 1;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "CARGO";
            // 
            // rb_n3
            // 
            this.rb_n3.AutoSize = true;
            this.rb_n3.Location = new System.Drawing.Point(28, 108);
            this.rb_n3.Name = "rb_n3";
            this.rb_n3.Size = new System.Drawing.Size(85, 17);
            this.rb_n3.TabIndex = 2;
            this.rb_n3.Text = "ASISTENTE";
            this.rb_n3.UseVisualStyleBackColor = true;
            this.rb_n3.CheckedChanged += new System.EventHandler(this.rb_n3_CheckedChanged);
            // 
            // rb_n2
            // 
            this.rb_n2.AutoSize = true;
            this.rb_n2.Location = new System.Drawing.Point(28, 72);
            this.rb_n2.Name = "rb_n2";
            this.rb_n2.Size = new System.Drawing.Size(84, 17);
            this.rb_n2.TabIndex = 1;
            this.rb_n2.Text = "EMPLEADO";
            this.rb_n2.UseVisualStyleBackColor = true;
            this.rb_n2.CheckedChanged += new System.EventHandler(this.rb_n2_CheckedChanged);
            // 
            // rb_n1
            // 
            this.rb_n1.AutoSize = true;
            this.rb_n1.Location = new System.Drawing.Point(28, 34);
            this.rb_n1.Name = "rb_n1";
            this.rb_n1.Size = new System.Drawing.Size(77, 17);
            this.rb_n1.TabIndex = 0;
            this.rb_n1.Text = "GERENTE";
            this.rb_n1.UseVisualStyleBackColor = true;
            this.rb_n1.CheckedChanged += new System.EventHandler(this.rb_n1_CheckedChanged);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(186, 137);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(129, 13);
            this.label2.TabIndex = 2;
            this.label2.Text = "SUELDO ACTUALIZADO";
            // 
            // tb_sueldo
            // 
            this.tb_sueldo.Location = new System.Drawing.Point(189, 161);
            this.tb_sueldo.Name = "tb_sueldo";
            this.tb_sueldo.Size = new System.Drawing.Size(100, 20);
            this.tb_sueldo.TabIndex = 3;
            // 
            // cbx_estado
            // 
            this.cbx_estado.FormattingEnabled = true;
            this.cbx_estado.Items.AddRange(new object[] {
            "SOLTERO",
            "CASADO",
            "DIVORSIADO",
            "VIUDO"});
            this.cbx_estado.Location = new System.Drawing.Point(379, 119);
            this.cbx_estado.Name = "cbx_estado";
            this.cbx_estado.Size = new System.Drawing.Size(121, 21);
            this.cbx_estado.TabIndex = 4;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(376, 103);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(158, 13);
            this.label3.TabIndex = 5;
            this.label3.Text = "SELECCIONAR ESTADO CIVIL";
            // 
            // bt_boni
            // 
            this.bt_boni.Location = new System.Drawing.Point(379, 155);
            this.bt_boni.Name = "bt_boni";
            this.bt_boni.Size = new System.Drawing.Size(147, 23);
            this.bt_boni.TabIndex = 6;
            this.bt_boni.Text = "BONIFICACION";
            this.bt_boni.UseVisualStyleBackColor = true;
            this.bt_boni.Click += new System.EventHandler(this.bt_boni_Click);
            // 
            // tb_boni
            // 
            this.tb_boni.Location = new System.Drawing.Point(379, 197);
            this.tb_boni.Name = "tb_boni";
            this.tb_boni.Size = new System.Drawing.Size(100, 20);
            this.tb_boni.TabIndex = 7;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(20, 274);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(192, 13);
            this.label4.TabIndex = 8;
            this.label4.Text = "SELECCIONAR FONDO DE PENSION";
            // 
            // cbx_pension
            // 
            this.cbx_pension.FormattingEnabled = true;
            this.cbx_pension.Items.AddRange(new object[] {
            "AFP",
            "ONP"});
            this.cbx_pension.Location = new System.Drawing.Point(23, 301);
            this.cbx_pension.Name = "cbx_pension";
            this.cbx_pension.Size = new System.Drawing.Size(121, 21);
            this.cbx_pension.TabIndex = 9;
            // 
            // bt_descuento
            // 
            this.bt_descuento.Location = new System.Drawing.Point(23, 341);
            this.bt_descuento.Name = "bt_descuento";
            this.bt_descuento.Size = new System.Drawing.Size(155, 23);
            this.bt_descuento.TabIndex = 10;
            this.bt_descuento.Text = "DESCUENTO";
            this.bt_descuento.UseVisualStyleBackColor = true;
            this.bt_descuento.Click += new System.EventHandler(this.bt_descuento_Click);
            // 
            // tb_descuento
            // 
            this.tb_descuento.Location = new System.Drawing.Point(23, 381);
            this.tb_descuento.Name = "tb_descuento";
            this.tb_descuento.Size = new System.Drawing.Size(100, 20);
            this.tb_descuento.TabIndex = 11;
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(379, 256);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(174, 31);
            this.button1.TabIndex = 12;
            this.button1.Text = "CALCULAR SUELDO NETO";
            this.button1.UseVisualStyleBackColor = true;
            // 
            // tb_neto
            // 
            this.tb_neto.Location = new System.Drawing.Point(379, 314);
            this.tb_neto.Name = "tb_neto";
            this.tb_neto.Size = new System.Drawing.Size(100, 20);
            this.tb_neto.TabIndex = 13;
            // 
            // Form3
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(775, 434);
            this.Controls.Add(this.tb_neto);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.tb_descuento);
            this.Controls.Add(this.bt_descuento);
            this.Controls.Add(this.cbx_pension);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.tb_boni);
            this.Controls.Add(this.bt_boni);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.cbx_estado);
            this.Controls.Add(this.tb_sueldo);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.label1);
            this.Name = "Form3";
            this.Text = "PLANILLA DE SUELDO";
            this.Load += new System.EventHandler(this.Form3_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.RadioButton rb_n3;
        private System.Windows.Forms.RadioButton rb_n2;
        private System.Windows.Forms.RadioButton rb_n1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox tb_sueldo;
        private System.Windows.Forms.ComboBox cbx_estado;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Button bt_boni;
        private System.Windows.Forms.TextBox tb_boni;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.ComboBox cbx_pension;
        private System.Windows.Forms.Button bt_descuento;
        private System.Windows.Forms.TextBox tb_descuento;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.TextBox tb_neto;
    }
}