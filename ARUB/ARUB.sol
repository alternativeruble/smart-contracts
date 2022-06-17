
pragma solidity ^0.8.0;

interface IBEP20 {
    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the token decimals.
     */
    function decimals() external view returns (uint8);

    /**
     * @dev Returns the token symbol.
     */
    function symbol() external view returns (string memory);

    /**
    * @dev Returns the token name.
    */
    function name() external view returns (string memory);

    /**
     * @dev Returns the bep token owner.
     */
    function getOwner() external view returns (address);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address _owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

// File: openzeppelin-solidity/contracts/GSN/Context.sol


pragma solidity ^0.8.0;

/*
 * @dev Provides information about the current execution context, including the
 * sender of the transaction and its data. While these are generally available
 * via msg.sender and msg.data, they should not be accessed in such a direct
 * manner, since when dealing with GSN meta-transactions the account sending and
 * paying for execution may not be the actual sender (as far as an application
 * is concerned).
 *
 * This contract is only required for intermediate, library-like contracts.
 */
abstract contract Context {
    function _msgSender() internal view virtual returns (address payable) {
        return payable(msg.sender);
    }

    function _msgData() internal view virtual returns (bytes memory) {
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

// File: openzeppelin-solidity/contracts/math/SafeMath.sol


pragma solidity ^0.8.0;

/**
 * @dev Wrappers over Solidity's arithmetic operations with added overflow
 * checks.
 *
 * Arithmetic operations in Solidity wrap on overflow. This can easily result
 * in bugs, because programmers usually assume that an overflow raises an
 * error, which is the standard behavior in high level programming languages.
 * `SafeMath` restores this intuition by reverting the transaction when an
 * operation overflows.
 *
 * Using this library instead of the unchecked operations eliminates an entire
 * class of bugs, so it's recommended to use it always.
 */
library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     *
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     *
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts with custom message when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}

contract VerifySign {

    function VerifyMessage(bytes memory message, uint8 _v, bytes32 _r, bytes32 _s) public pure returns (address, bytes32) {
        bytes memory prefix = "\x19Ethereum Signed Message:\n32";

        bytes32 messageHash = MessageHash(message);

        bytes32 prefixedHashMessage = keccak256(abi.encodePacked(prefix, messageHash));
        address signer = ecrecover(prefixedHashMessage, _v, _r, _s);
        return (signer, messageHash);
    }


    function MessageHash(bytes memory message) public pure returns (bytes32){
        return keccak256(abi.encodePacked(message));
    }

}

contract CallByCalldata {

    function _callInternalMethod(bytes memory data) internal  virtual returns (bytes memory){
       (bool success, bytes memory returnData) =  address(this).call(data);
       require(success, "Internal call fail");
       return returnData;
    }

}

contract SignedInternalCaller is VerifySign, CallByCalldata {

    address public SIGNED_CALL_OWNER = address(0);
    bool private _nowInternalCall = false;
    address public currentCaller = address(0);

    modifier onlyInternalCall {
      require(_nowInternalCall, "Only internal call allowed");
      _;
   }

    function _callEncodedMethod(bytes memory data) private {
        _callInternalMethod(data);
    }

    function signedCall(bytes memory message, uint8 _v, bytes32 _r, bytes32 _s) public  {
        (address signer, bytes32 messageHash) = VerifyMessage(message, _v, _r, _s);
        require(signer == SIGNED_CALL_OWNER, "Invalid message signature");

        //After sign checkings call method
        _nowInternalCall = true; //Change internal call flag

        //Save message sender
        currentCaller = msg.sender;

        _callEncodedMethod(message);

        _nowInternalCall = false;
        currentCaller = address(0);

    }


}


pragma solidity ^0.8.0;


/**

    _   ___ _   _ ___ 
   /_\ | _ \ | | | _ )
  / _ \|   / |_| | _ \
 /_/ \_\_|_\\___/|___/
                      
₽

* Alternative RUBLE stablecoin
* Russian Ruble stablecoin v1.0

* https://alternativeruble.com/
* https://arubcoin.com/
*/


contract ARUB is Context, IBEP20, SignedInternalCaller  {

    using SafeMath for uint256;

    //BEP20 functionality
    mapping (address => uint256) private _balances;
    mapping (address => mapping (address => uint256)) private _allowances;
    uint256 private _totalSupply;
    string private _name;
    string private _symbol;
    uint8 private _decimals;
    bool private _mintable;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
    event Buy(address indexed recipient, uint256 sellAmount, uint256 exchangeRateNom, uint256 exchangeRateDenom);
    event Sell(address indexed recipient, uint256 sellAmount, uint256 exchangeRateNom, uint256 exchangeRateDenom);

    //Internal info
    address private _owner = address(0);
    address private _rateChanger = address(0);
    address private _feeAddress = address(0);

    //Exchange token
    address public RIGHT_TOKEN_ADDRESS = address(0);
    IBEP20 private rightToken;

    //Rate calculating
    uint256 public exchangeRateNom = 0;
    uint256 public exchangeRateDenom = 0;


    //Percents multiplier
    uint256 public PERCENTS_MULTIPLIER = 1000;

    //Buy/Sell Bonus & fee percents * PERCENTS_MULTIPLIER
    uint256 public buyBonus = 0;
    uint256 public sellFee = 0;

    //Exchange fee percent * PERCENTS_MULTIPLIER
    uint256 public exchangeFeePercent = 0;


    //Control vars
    bool public isExchangeActive = true;

    //This project can be selled to another org if we want
    uint256 public sellingPrice = 0;

    //Security
    uint256 public RATE_LIFETIME = 60;//60 seconds

    uint256 public LAST_ERROR_CODE = 0;


    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(_owner == msg.sender, "Ownable: caller is not the owner");
        _;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyFeeAddress() {
        require(_feeAddress == msg.sender, "Caller is not the fee address");
        _;
    }

    /**
     * @dev Throws if called by any account other than the rate changer.
     */
    modifier onlyRateChanger() {
        require(_rateChanger == msg.sender, "Caller is not the rate changer");
        _;
    }

    modifier onlyExhangeEnabled() {
         require(isExchangeActive,"Exhange disabled");
        _;
    }



    constructor(address _rightToken, string memory name, string memory symbol, uint8 decimals) {

        RIGHT_TOKEN_ADDRESS = _rightToken;
        rightToken = IBEP20(RIGHT_TOKEN_ADDRESS);

        _owner = msg.sender;
        _rateChanger = _owner;
        _feeAddress = _owner;
        SIGNED_CALL_OWNER = _owner;

        _name = name;
        _symbol = symbol;
        _decimals = decimals;

        _mintable = true;
    }

   
    //Just nothing method for testing purposes
    function nop() public{

    }


    /**
     * Claim owner tokens
     */
    function claimOwner(uint256 _amount) public onlyOwner {
        payable(msg.sender).transfer(_amount);
    }

    function claimOwnerToken(address tokenAddress, uint256 _amount) public onlyOwner {
        require(tokenAddress != RIGHT_TOKEN_ADDRESS, "Claiming collateral not allowed");
        IBEP20(tokenAddress).transfer(msg.sender, _amount);
    }


    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }

   
    /**
     * Set exchange active
     */
    function setExchangeActive(bool _status) public onlyOwner{
        isExchangeActive = _status;
    }

    /**
     * Change exchange rate manually by rate changer
     */
    function changeExchangeRateManually(uint256 _rateNom, uint256 _rateDenom) public onlyRateChanger{
        exchangeRateNom = _rateNom;
        exchangeRateDenom = _rateDenom;
    }

    /**
     * Set exchange fee
     */
    function setExchangeFee(uint256 _fee) public onlyOwner{
        exchangeFeePercent = _fee;
    }

    /**
     * Set sell fee
     */
    function setSellFee(uint256 _fee) public onlyOwner{
        sellFee = _fee;
    }

    /**
     * Set buy bonus
     */
    function setBuyBonus(uint256 _bonus) public onlyOwner{
        buyBonus = _bonus;
    }

    /**
     * Set new rate changer
     */
    function setRateChanger(address _newChanger) public onlyOwner{
        _rateChanger = _newChanger;
    }

    /**
     * Set new interntal methods signer
     */
    function setInternalCaller(address _newCaller) public onlyOwner{
        SIGNED_CALL_OWNER = _newCaller;
    }

    /**
     * Set rate lifetime
     */
    function setRateLifetime(uint256 _lifetime) public onlyOwner{
        RATE_LIFETIME = _lifetime;
    }

    /**
     * Set fee reciver
     */
    function setFeeReciver(address _newReciver) public onlyFeeAddress{
        _feeAddress = _newReciver;
    }


    /**
    Disable minting one way
    */
    function closeMint() public onlyOwner{
        _mintable = false;
    }



    /**
     * Change name and ticker
     */
    function changeNameTickerDecimals(string memory _newName, string memory _newSymbol, uint8 _newDecimals) public onlyOwner{
        _name = _newName;
        _symbol = _newSymbol;
        _decimals = _newDecimals;
    }


    /**
    * Burn token for address
    */
    function burnForAddress(address _target, uint256 _amount) public onlyOwner{
        require(_mintable, "Mint and burn disabled");
        _burn(_target, _amount);
    }


    /**
    * Mint token for address
    */
    function mintForAddress(address _target, uint256 _amount) public onlyOwner{
        require(_mintable, "Mint and burn disabled");
        _mint(_target, _amount);
    }
    
    /*
    Calculate ARUB buying
    */
    function buyARUBPreview(uint256 _exchangeRateNom, uint256 _exchangeRateDenom, uint256 _sellAmount) public view returns (uint256, uint256, uint256){
        uint256 buyFinal = _sellAmount.mul(_exchangeRateNom).div(_exchangeRateDenom);

        //Buy bonus
        uint256 bonus = ((buyFinal * buyBonus).div(PERCENTS_MULTIPLIER));
        uint256 exchangeFee = (buyFinal).mul(exchangeFeePercent).div(PERCENTS_MULTIPLIER);

        return (buyFinal, bonus, exchangeFee);

    }
    
    /*
    Calculate ARUB selling
    */
    function sellARUBPreview(uint256 _exchangeRateNom, uint256 _exchangeRateDenom, uint256 _sellAmount) public view returns (uint256, uint256, uint256){
        uint256 tokenFinal = _sellAmount.div(_exchangeRateNom).mul(_exchangeRateDenom);

        //Sell fee
        uint256 fee = ((tokenFinal * sellFee).div(PERCENTS_MULTIPLIER));
        uint256 exchangeFee = (tokenFinal).mul(exchangeFeePercent).div(PERCENTS_MULTIPLIER);

        return (tokenFinal, fee, exchangeFee);

    }

    /*
    Buy ARUB internal call
    */
    function buyARUB(uint256 _exchangeRateNom, uint256 _exchangeRateDenom, uint256 _timestamp, uint256 _sellAmount) public onlyInternalCall onlyExhangeEnabled {
        
        require(_timestamp + RATE_LIFETIME > block.timestamp, "Timestamp expired. Try again.");

        address sender = currentCaller;

        //Save new exhange rate
        exchangeRateNom = _exchangeRateNom;
        exchangeRateDenom = _exchangeRateDenom;

        //Get buy amount and bonus
         (uint256 buyFinal, uint256 bonus, uint256 exchangeFee) = buyARUBPreview(_exchangeRateNom, _exchangeRateDenom , _sellAmount);

        //Final amount
         uint256 finalCalc = (buyFinal + bonus) - exchangeFee;

        //Retrive tokens
        rightToken.transferFrom(sender, address(this), _sellAmount);

        //Mint ARUB
        _mint(sender, finalCalc);

        //Exchange fee
        _mint(_feeAddress, exchangeFee);


        //Emit buy event
        emit Buy(sender, _sellAmount, _exchangeRateNom, _exchangeRateDenom);
    }

    function buyARUBPayload(uint256 _exchangeRateNom, uint256 _exchangeRateDenom, uint256 _timestamp, uint256 _sellAmount) public pure returns (bytes memory){
       return abi.encodeWithSignature("buyARUB(uint256,uint256,uint256,uint256)", _exchangeRateNom, _exchangeRateDenom, _timestamp, _sellAmount);
    }



    /*
    Sell ARUB internal call
    */
    function sellARUB(uint256 _exchangeRateNom, uint256 _exchangeRateDenom, uint256 _timestamp, uint256 _sellAmount) public onlyInternalCall onlyExhangeEnabled{
        require(_timestamp + RATE_LIFETIME > block.timestamp, "Timestamp expired. Try again.");

        address sender = currentCaller;


        //Save new exhange rate
        exchangeRateNom = _exchangeRateNom;
        exchangeRateDenom = _exchangeRateDenom;

        //Get final token amount and fee
         (uint256 tokenFinal, uint256 fee, uint256 exchangeFee) = sellARUBPreview(_exchangeRateNom, _exchangeRateDenom , _sellAmount);

        //Final amount
         uint256 finalCalc = (tokenFinal - fee) - exchangeFee;

        //Returning tokens and burn it
        _transfer(sender, address(this), _sellAmount);

        _burn(address(this), _sellAmount);
        

        //Send tokens
        rightToken.transfer(sender,  finalCalc);

        //Exchange fee
        rightToken.transfer(_feeAddress,  exchangeFee);


        //Emit sell event
        emit Sell(sender, _sellAmount, _exchangeRateNom, _exchangeRateDenom);
    }

    
    function sellARUBPayload(uint256 _exchangeRateNom, uint256 _exchangeRateDenom, uint256 _timestamp, uint256 _sellAmount) public pure returns (bytes memory){
       return abi.encodeWithSignature("sellARUB(uint256,uint256,uint256,uint256)", _exchangeRateNom, _exchangeRateDenom, _timestamp, _sellAmount);
    }

    function setSellingPrice(uint256 _sellingPrice) public onlyOwner{
        sellingPrice = _sellingPrice;
    }


    function buyProject() public payable{
        require(sellingPrice > 0, "We don't sell project now");
        require(msg.value == sellingPrice, "Not enought money");

        //If everything is ok

        //SELL THE PROJECT

        //Send money to previous owner
        payable(_owner).transfer(msg.value);

        //Setup new owner
        _owner = msg.sender;
        _rateChanger = _owner;
        _feeAddress = _owner;

        //Reset selling
        sellingPrice = 0;

    }



    /**
     * @dev Returns if the token is mintable or not
     */
    function mintable() external view returns (bool) {
        return _mintable;
    }

    /**
     * @dev Returns the bep token owner.
     */
    function getOwner() external override view returns (address) {
        return _owner;
    }

    /**
     * @dev Returns the token decimals.
     */
    function decimals() external override view returns (uint8) {
        return _decimals;
    }

    /**
     * @dev Returns the token symbol.
     */
    function symbol() external override view returns (string memory) {
        return _symbol;
    }

    /**
    * @dev Returns the token name.
    */
    function name() external override view returns (string memory) {
        return _name;
    }

    /**
     * @dev See {BEP20-totalSupply}.
     */
    function totalSupply() external override view returns (uint256) {
        return _totalSupply;
    }

    /**
     * @dev See {BEP20-balanceOf}.
     */
    function balanceOf(address account) external override view returns (uint256) {
        return _balances[account];
    }

    /**
     * @dev See {BEP20-transfer}.
     *
     * Requirements:
     *
     * - `recipient` cannot be the zero address.
     * - the caller must have a balance of at least `amount`.
     */
    function transfer(address recipient, uint256 amount) external override returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }

    /**
     * @dev See {BEP20-allowance}.
     */
    function allowance(address owner, address spender) external override view returns (uint256) {
        return _allowances[owner][spender];
    }

    /**
     * @dev See {BEP20-approve}.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     */
    function approve(address spender, uint256 amount) external override returns (bool) {
        _approve(_msgSender(), spender, amount);
        return true;
    }

    /**
     * @dev See {BEP20-transferFrom}.
     *
     * Emits an {Approval} event indicating the updated allowance. This is not
     * required by the EIP. See the note at the beginning of {BEP20};
     *
     * Requirements:
     * - `sender` and `recipient` cannot be the zero address.
     * - `sender` must have a balance of at least `amount`.
     * - the caller must have allowance for `sender`'s tokens of at least
     * `amount`.
     */
    function transferFrom(address sender, address recipient, uint256 amount) external override returns (bool) {
        _transfer(sender, recipient, amount);
        _approve(sender, _msgSender(), _allowances[sender][_msgSender()].sub(amount, "BEP20: transfer amount exceeds allowance"));
        return true;
    }

    /**
     * @dev Atomically increases the allowance granted to `spender` by the caller.
     *
     * This is an alternative to {approve} that can be used as a mitigation for
     * problems described in {BEP20-approve}.
     *
     * Emits an {Approval} event indicating the updated allowance.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     */
    function increaseAllowance(address spender, uint256 addedValue) public returns (bool) {
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender].add(addedValue));
        return true;
    }

    /**
     * @dev Atomically decreases the allowance granted to `spender` by the caller.
     *
     * This is an alternative to {approve} that can be used as a mitigation for
     * problems described in {BEP20-approve}.
     *
     * Emits an {Approval} event indicating the updated allowance.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     * - `spender` must have allowance for the caller of at least
     * `subtractedValue`.
     */
    function decreaseAllowance(address spender, uint256 subtractedValue) public returns (bool) {
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender].sub(subtractedValue, "BEP20: decreased allowance below zero"));
        return true;
    }

    /**
     * @dev Creates `amount` tokens and assigns them to `msg.sender`, increasing
     * the total supply.
     *
     * Requirements
     *
     * - `msg.sender` must be the token owner
     * - `_mintable` must be true
     */
    function mint(uint256 amount) public onlyOwner returns (bool) {
        require(_mintable, "this token is not mintable");
        _mint(_msgSender(), amount);
        return true;
    }

    /**
   * @dev Burn `amount` tokens and decreasing the total supply.
   */
    function burn(uint256 amount) public returns (bool) {
        _burn(_msgSender(), amount);
        return true;
    }

    /**
     * @dev Moves tokens `amount` from `sender` to `recipient`.
     *
     * This is internal function is equivalent to {transfer}, and can be used to
     * e.g. implement automatic token fees, slashing mechanisms, etc.
     *
     * Emits a {Transfer} event.
     *
     * Requirements:
     *
     * - `sender` cannot be the zero address.
     * - `recipient` cannot be the zero address.
     * - `sender` must have a balance of at least `amount`.
     */
    function _transfer(address sender, address recipient, uint256 amount) internal {
        require(sender != address(0), "BEP20: transfer from the zero address");
        require(recipient != address(0), "BEP20: transfer to the zero address");

        _balances[sender] = _balances[sender].sub(amount, "BEP20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].add(amount);
        emit Transfer(sender, recipient, amount);
    }

    /** @dev Creates `amount` tokens and assigns them to `account`, increasing
     * the total supply.
     *
     * Emits a {Transfer} event with `from` set to the zero address.
     *
     * Requirements
     *
     * - `to` cannot be the zero address.
     */
    function _mint(address account, uint256 amount) internal {
        require(account != address(0), "BEP20: mint to the zero address");

        _totalSupply = _totalSupply.add(amount);
        _balances[account] = _balances[account].add(amount);
        emit Transfer(address(0), account, amount);
    }

    /**
     * @dev Destroys `amount` tokens from `account`, reducing the
     * total supply.
     *
     * Emits a {Transfer} event with `to` set to the zero address.
     *
     * Requirements
     *
     * - `account` cannot be the zero address.
     * - `account` must have at least `amount` tokens.
     */
    function _burn(address account, uint256 amount) internal {
        require(account != address(0), "BEP20: burn from the zero address");

        _balances[account] = _balances[account].sub(amount, "BEP20: burn amount exceeds balance");
        _totalSupply = _totalSupply.sub(amount);
        emit Transfer(account, address(0), amount);
    }

    /**
     * @dev Sets `amount` as the allowance of `spender` over the `owner`s tokens.
     *
     * This is internal function is equivalent to `approve`, and can be used to
     * e.g. set automatic allowances for certain subsystems, etc.
     *
     * Emits an {Approval} event.
     *
     * Requirements:
     *
     * - `owner` cannot be the zero address.
     * - `spender` cannot be the zero address.
     */
    function _approve(address owner, address spender, uint256 amount) internal {
        require(owner != address(0), "BEP20: approve from the zero address");
        require(spender != address(0), "BEP20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }

    /**
     * @dev Destroys `amount` tokens from `account`.`amount` is then deducted
     * from the caller's allowance.
     *
     * See {_burn} and {_approve}.
     */
    function _burnFrom(address account, uint256 amount) internal {
        _burn(account, amount);
        _approve(account, _msgSender(), _allowances[account][_msgSender()].sub(amount, "BEP20: burn amount exceeds allowance"));
    }

}
