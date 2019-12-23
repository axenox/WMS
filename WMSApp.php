<?php
namespace axenox\WMS;

use exface\Core\Interfaces\InstallerInterface;
use exface\Core\CommonLogic\AppInstallers\MySqlDatabaseInstaller;
use exface\Core\CommonLogic\Model\App;
use exface\Core\Exceptions\Model\MetaObjectNotFoundError;
use exface\Core\Factories\DataSourceFactory;

class WMSApp extends App
{
    public function getInstaller(InstallerInterface $injected_installer = null)
    {
        $installer = parent::getInstaller($injected_installer);        
        $schema_installer = new MySqlDatabaseInstaller($this->getSelector());
        $schema_installer
        ->setDataSourceSelector('0x11e83d69112063269e40e4b318306b9a')
        ->setFoldersWithMigrations(['InitDB', 'DemoData']);
        $installer->addInstaller($schema_installer);
        
        $schema_installer->getDataConnection();
        return $installer;
    }
}
?>