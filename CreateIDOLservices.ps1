#use this powershell script to create IDOL services
function GenerateForm {

[reflection.assembly]::loadwithpartialname("System.Windows.Forms") | Out-Null
[reflection.assembly]::loadwithpartialname("System.Drawing") | Out-Null

$form1 = New-Object System.Windows.Forms.Form
$button1 = New-Object System.Windows.Forms.Button
$listBox1 = New-Object System.Windows.Forms.ListBox
$checkBox5 = New-Object System.Windows.Forms.CheckBox
$checkBox4 = New-Object System.Windows.Forms.CheckBox
$checkBox3 = New-Object System.Windows.Forms.CheckBox
$checkBox2 = New-Object System.Windows.Forms.CheckBox
$checkBox1 = New-Object System.Windows.Forms.CheckBox
$InitialFormWindowState = New-Object System.Windows.Forms.FormWindowState

$b1= $false
$b2= $false
$b3= $false
$b4= $false
$b5= $false

#----------------------------------------------
#Generated Event Script Blocks
#----------------------------------------------

$handler_button1_Click= 
{
    $listBox1.Items.Clear();    

    if ($checkBox1.Checked)     
    {
        $listBox1.Items.Add( "AgenStore Service will be created"  ) 

        $service = "HPE-Agentstore"

        # Verify if the service already exists, and if yes remove it first
        if (Get-Service $service -ErrorAction SilentlyContinue)
        {
            # using WMI to remove Windows service because PowerShell does not have CmdLet for this
            $serviceToRemove = Get-WmiObject -Class Win32_Service -Filter "name='$service'"

            $serviceToRemove.delete()
            Write-Host "Service removed: $service"
        }
        
        Write-Host "Installing service: $service"

        New-Service -name $service -BinaryPathName "C:\HewlettPackardEnterprise\IDOLServer-11.1.0\agentstore\agentstore.exe" -DisplayName "HPE Agentstore" -Description "My Agentstore Service"
        
         Write-Host "Installation completed: $service"

    }

    if ($checkBox2.Checked)    {  $listBox1.Items.Add( "Category Service will be created"  ) }

    if ($checkBox3.Checked)    {  $listBox1.Items.Add( "Community Service will be created"  ) }

    if ($checkBox4.Checked)    {  $listBox1.Items.Add( "Content Service will be created"  ) }
    
    if ($checkBox5.Checked)    {  $listBox1.Items.Add( "View Service will be created"  ) }


    if ( !$checkBox1.Checked -and !$checkBox2.Checked -and !$checkBox3.Checked -and !$checkBox4.Checked -and !$checkBox5.Checked ) {   $listBox1.Items.Add("No CheckBox selected....")} 
}

$OnLoadForm_StateCorrection=
{#Correct the initial state of the form to prevent the .Net maximized form issue
    $form1.WindowState = $InitialFormWindowState
}

#----------------------------------------------
#region Generated Form Code
$form1.Text = "IDOL Service Creation Form"
$form1.Name = "form1"
$form1.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 550
$System_Drawing_Size.Height = 350
$form1.ClientSize = $System_Drawing_Size

$button1.TabIndex = 5
$button1.Name = "button1"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 75
$System_Drawing_Size.Height = 23
$button1.Size = $System_Drawing_Size
$button1.UseVisualStyleBackColor = $True

$button1.Text = "Run Script"

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 27
$System_Drawing_Point.Y = 260
$button1.Location = $System_Drawing_Point
$button1.DataBindings.DefaultDataSourceUpdateMode = 0
$button1.add_Click($handler_button1_Click)

$form1.Controls.Add($button1)

$listBox1.FormattingEnabled = $True
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 301
$System_Drawing_Size.Height = 260
$listBox1.Size = $System_Drawing_Size
$listBox1.DataBindings.DefaultDataSourceUpdateMode = 0
$listBox1.Name = "listBox1"
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 175
$System_Drawing_Point.Y = 13
$listBox1.Location = $System_Drawing_Point
$listBox1.TabIndex = 6

$form1.Controls.Add($listBox1)

$checkBox5.UseVisualStyleBackColor = $True
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 155
$System_Drawing_Size.Height = 30
$checkBox5.Size = $System_Drawing_Size
$checkBox5.TabIndex = 4
$checkBox5.Text = "Create View Service"
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 27
$System_Drawing_Point.Y = 155
$checkBox5.Location = $System_Drawing_Point
$checkBox5.DataBindings.DefaultDataSourceUpdateMode = 0
$checkBox5.Name = "checkBox5"

$form1.Controls.Add($checkBox5)



$checkBox4.UseVisualStyleBackColor = $True
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 155
$System_Drawing_Size.Height = 30
$checkBox4.Size = $System_Drawing_Size
$checkBox4.TabIndex = 3
$checkBox4.Text = "Create Content Service"
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 27
$System_Drawing_Point.Y = 115
$checkBox4.Location = $System_Drawing_Point
$checkBox4.DataBindings.DefaultDataSourceUpdateMode = 0
$checkBox4.Name = "checkBox4"

$form1.Controls.Add($checkBox4)


$checkBox3.UseVisualStyleBackColor = $True
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 155
$System_Drawing_Size.Height = 30
$checkBox3.Size = $System_Drawing_Size
$checkBox3.TabIndex = 2
$checkBox3.Text = "Create Community Service"
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 27
$System_Drawing_Point.Y = 80
$checkBox3.Location = $System_Drawing_Point
$checkBox3.DataBindings.DefaultDataSourceUpdateMode = 0
$checkBox3.Name = "checkBox3"

$form1.Controls.Add($checkBox3)


$checkBox2.UseVisualStyleBackColor = $True
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 155
$System_Drawing_Size.Height = 30
$checkBox2.Size = $System_Drawing_Size
$checkBox2.TabIndex = 1
$checkBox2.Text = "Create Category Service"
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 27
$System_Drawing_Point.Y = 45
$checkBox2.Location = $System_Drawing_Point
$checkBox2.DataBindings.DefaultDataSourceUpdateMode = 0
$checkBox2.Name = "checkBox2"

$form1.Controls.Add($checkBox2)


$checkBox1.UseVisualStyleBackColor = $True
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 155
$System_Drawing_Size.Height = 30
$checkBox1.Size = $System_Drawing_Size
$checkBox1.TabIndex = 0
$checkBox1.Text = "Create Agentstore Service"
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 27
$System_Drawing_Point.Y = 10
$checkBox1.Location = $System_Drawing_Point
$checkBox1.DataBindings.DefaultDataSourceUpdateMode = 0
$checkBox1.Name = "checkBox1"

$form1.Controls.Add($checkBox1)


#Save the initial state of the form
$InitialFormWindowState = $form1.WindowState
#Init the OnLoad event to correct the initial state of the form
$form1.add_Load($OnLoadForm_StateCorrection)
#Show the Form
$form1.ShowDialog()| Out-Null

} #End Function

#Call the Function
GenerateForm