<?php
/**
 * Fork_Sniffs_PHP_DeprecatedNewReferenceSniff.
 *
 * PHP version 5.3
 *
 * @category  PHP
 * @package   Fork
 * @author    Wim Godden <wim.godden@cu.be>
 * @copyright 2010 Cu.be Solutions bvba
 */

/**
 * Fork_Sniffs_PHP_DeprecatedNewReferenceSniff.
 *
 * Discourages the use of assigning the return value of new by reference
 *
 * PHP version 5.3
 *
 * @category  PHP
 * @package   Fork
 * @author    Wim Godden <wim.godden@cu.be>
 * @copyright 2010 Cu.be Solutions bvba
 */
class Fork_Sniffs_PHP_DeprecatedNewReferenceSniff implements PHP_CodeSniffer_Sniff
{

    /**
     * If true, an error will be thrown; otherwise a warning.
     *
     * @var bool
     */
    protected $error = true;


    /**
     * Returns an array of tokens this test wants to listen for.
     *
     * @return array
     */
    public function register()
    {
        return array(T_NEW);

    }//end register()


    /**
     * Processes this test, when one of its tokens is encountered.
     *
     * @param PHP_CodeSniffer_File $phpcsFile The file being scanned.
     * @param int                  $stackPtr  The position of the current token in the
     *                                        stack passed in $tokens.
     *
     * @return void
     */
    public function process(PHP_CodeSniffer_File $phpcsFile, $stackPtr)
    {
        $tokens = $phpcsFile->getTokens();
        if ($tokens[$stackPtr - 1]['type'] == 'T_BITWISE_AND' || $tokens[$stackPtr - 2]['type'] == 'T_BITWISE_AND') {
            $error = 'Assigning the return value of new by reference is deprecated in PHP 5.3';
            $phpcsFile->addError($error, $stackPtr);
        }

    }//end process()


}//end class
