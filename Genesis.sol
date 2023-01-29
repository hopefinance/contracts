// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
 interface IERC20 {

    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

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
     * @dev Returns the addition of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function tryAdd(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        uint256 c = a + b;
        if (c < a) return (false, 0);
        return (true, c);
    }

    /**
     * @dev Returns the substraction of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function trySub(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        if (b > a) return (false, 0);
        return (true, a - b);
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function tryMul(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) return (true, 0);
        uint256 c = a * b;
        if (c / a != b) return (false, 0);
        return (true, c);
    }

    /**
     * @dev Returns the division of two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryDiv(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        if (b == 0) return (false, 0);
        return (true, a / b);
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryMod(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        if (b == 0) return (false, 0);
        return (true, a % b);
    }

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
        require(b <= a, "SafeMath: subtraction overflow");
        return a - b;
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
        if (a == 0) return 0;
        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");
        return c;
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting on
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
        require(b > 0, "SafeMath: division by zero");
        return a / b;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting when dividing by zero.
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
        require(b > 0, "SafeMath: modulo by zero");
        return a % b;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {trySub}.
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        return a - b;
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {tryDiv}.
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
        return a / b;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting with custom message when dividing by zero.
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {tryMod}.
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
        require(b > 0, errorMessage);
        return a % b;
    }
}


/**
 * @dev Collection of functions related to the address type
 */
library Address {
    /**
     * @dev Returns true if `account` is a contract.
     *
     * [IMPORTANT]
     * ====
     * It is unsafe to assume that an address for which this function returns
     * false is an externally-owned account (EOA) and not a contract.
     *
     * Among others, `isContract` will return false for the following
     * types of addresses:
     *
     *  - an externally-owned account
     *  - a contract in construction
     *  - an address where a contract will be created
     *  - an address where a contract lived, but was destroyed
     * ====
     */
    function isContract(address account) internal view returns (bool) {
        // This method relies on extcodesize, which returns 0 for contracts in
        // construction, since the code is only stored at the end of the
        // constructor execution.

        uint256 size;
        // solhint-disable-next-line no-inline-assembly
        assembly { size := extcodesize(account) }
        return size > 0;
    }

    /**
     * @dev Replacement for Solidity's `transfer`: sends `amount` wei to
     * `recipient`, forwarding all available gas and reverting on errors.
     *
     * https://eips.ethereum.org/EIPS/eip-1884[EIP1884] increases the gas cost
     * of certain opcodes, possibly making contracts go over the 2300 gas limit
     * imposed by `transfer`, making them unable to receive funds via
     * `transfer`. {sendValue} removes this limitation.
     *
     * https://diligence.consensys.net/posts/2019/09/stop-using-soliditys-transfer-now/[Learn more].
     *
     * IMPORTANT: because control is transferred to `recipient`, care must be
     * taken to not create reentrancy vulnerabilities. Consider using
     * {ReentrancyGuard} or the
     * https://solidity.readthedocs.io/en/v0.5.11/security-considerations.html#use-the-checks-effects-interactions-pattern[checks-effects-interactions pattern].
     */
    function sendValue(address payable recipient, uint256 amount) internal {
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-low-level-calls, avoid-call-value
        (bool success, ) = recipient.call{ value: amount }("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }

    /**
     * @dev Performs a Solidity function call using a low level `call`. A
     * plain`call` is an unsafe replacement for a function call: use this
     * function instead.
     *
     * If `target` reverts with a revert reason, it is bubbled up by this
     * function (like regular Solidity function calls).
     *
     * Returns the raw returned data. To convert to the expected return value,
     * use https://solidity.readthedocs.io/en/latest/units-and-global-variables.html?highlight=abi.decode#abi-encoding-and-decoding-functions[`abi.decode`].
     *
     * Requirements:
     *
     * - `target` must be a contract.
     * - calling `target` with `data` must not revert.
     *
     * _Available since v3.1._
     */
    function functionCall(address target, bytes memory data) internal returns (bytes memory) {
      return functionCall(target, data, "Address: low-level call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`], but with
     * `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCall(address target, bytes memory data, string memory errorMessage) internal returns (bytes memory) {
        return functionCallWithValue(target, data, 0, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but also transferring `value` wei to `target`.
     *
     * Requirements:
     *
     * - the calling contract must have an ETH balance of at least `value`.
     * - the called Solidity function must be `payable`.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(address target, bytes memory data, uint256 value) internal returns (bytes memory) {
        return functionCallWithValue(target, data, value, "Address: low-level call with value failed");
    }

    /**
     * @dev Same as {xref-Address-functionCallWithValue-address-bytes-uint256-}[`functionCallWithValue`], but
     * with `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(address target, bytes memory data, uint256 value, string memory errorMessage) internal returns (bytes memory) {
        require(address(this).balance >= value, "Address: insufficient balance for call");
        require(isContract(target), "Address: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = target.call{ value: value }(data);
        return _verifyCallResult(success, returndata, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but performing a static call.
     *
     * _Available since v3.3._
     */
    function functionStaticCall(address target, bytes memory data) internal view returns (bytes memory) {
        return functionStaticCall(target, data, "Address: low-level static call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-string-}[`functionCall`],
     * but performing a static call.
     *
     * _Available since v3.3._
     */
    function functionStaticCall(address target, bytes memory data, string memory errorMessage) internal view returns (bytes memory) {
        require(isContract(target), "Address: static call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = target.staticcall(data);
        return _verifyCallResult(success, returndata, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but performing a delegate call.
     *
     * _Available since v3.4._
     */
    function functionDelegateCall(address target, bytes memory data) internal returns (bytes memory) {
        return functionDelegateCall(target, data, "Address: low-level delegate call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-string-}[`functionCall`],
     * but performing a delegate call.
     *
     * _Available since v3.4._
     */
    function functionDelegateCall(address target, bytes memory data, string memory errorMessage) internal returns (bytes memory) {
        require(isContract(target), "Address: delegate call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = target.delegatecall(data);
        return _verifyCallResult(success, returndata, errorMessage);
    }

    function _verifyCallResult(bool success, bytes memory returndata, string memory errorMessage) private pure returns(bytes memory) {
        if (success) {
            return returndata;
        } else {
            // Look for revert reason and bubble it up if present
            if (returndata.length > 0) {
                // The easiest way to bubble the revert reason is using memory via assembly

                // solhint-disable-next-line no-inline-assembly
                assembly {
                    let returndata_size := mload(returndata)
                    revert(add(32, returndata), returndata_size)
                }
            } else {
                revert(errorMessage);
            }
        }
    }
}


/**
 * @title SafeERC20
 * @dev Wrappers around ERC20 operations that throw on failure (when the token
 * contract returns false). Tokens that return no value (and instead revert or
 * throw on failure) are also supported, non-reverting calls are assumed to be
 * successful.
 * To use this library you can add a `using SafeERC20 for IERC20;` statement to your contract,
 * which allows you to call the safe operations as `token.safeTransfer(...)`, etc.
 */
library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function safeTransfer(IERC20 token, address to, uint256 value) internal {
        _callOptionalReturn(token, abi.encodeWithSelector(token.transfer.selector, to, value));
    }

    function safeTransferFrom(IERC20 token, address from, address to, uint256 value) internal {
        _callOptionalReturn(token, abi.encodeWithSelector(token.transferFrom.selector, from, to, value));
    }

    /**
     * @dev Deprecated. This function has issues similar to the ones found in
     * {IERC20-approve}, and its usage is discouraged.
     *
     * Whenever possible, use {safeIncreaseAllowance} and
     * {safeDecreaseAllowance} instead.
     */
    function safeApprove(IERC20 token, address spender, uint256 value) internal {
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        // solhint-disable-next-line max-line-length
        require((value == 0) || (token.allowance(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, value));
    }

    function safeIncreaseAllowance(IERC20 token, address spender, uint256 value) internal {
        uint256 newAllowance = token.allowance(address(this), spender).add(value);
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
    }

    function safeDecreaseAllowance(IERC20 token, address spender, uint256 value) internal {
        uint256 newAllowance = token.allowance(address(this), spender).sub(value, "SafeERC20: decreased allowance below zero");
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
    }

    /**
     * @dev Imitates a Solidity high-level call (i.e. a regular function call to a contract), relaxing the requirement
     * on the return value: the return value is optional (but if data is returned, it must not be false).
     * @param token The token targeted by the call.
     * @param data The call data (encoded using abi.encode or one of its variants).
     */
    function _callOptionalReturn(IERC20 token, bytes memory data) private {
        // We need to perform a low level call here, to bypass Solidity's return data size checking mechanism, since
        // we're implementing it ourselves. We use {Address.functionCall} to perform this call, which verifies that
        // the target address contains contract code and also asserts for success in the low-level call.

        bytes memory returndata = address(token).functionCall(data, "SafeERC20: low-level call failed");
        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

abstract contract ReentrancyGuard {
    // Booleans are more expensive than uint256 or any type that takes up a full
    // word because each write operation emits an extra SLOAD to first read the
    // slot's contents, replace the bits taken up by the boolean, and then write
    // back. This is the compiler's defense against contract upgrades and
    // pointer aliasing, and it cannot be disabled.

    // The values being non-zero value makes deployment a bit more expensive,
    // but in exchange the refund on every call to nonReentrant will be lower in
    // amount. Since refunds are capped to a percentage of the total
    // transaction's gas, it is best to keep them low in cases like this one, to
    // increase the likelihood of the full refund coming into effect.
    uint256 private constant _NOT_ENTERED = 1;
    uint256 private constant _ENTERED = 2;

    uint256 private _status;

    constructor() {
        _status = _NOT_ENTERED;
    }

    /**
     * @dev Prevents a contract from calling itself, directly or indirectly.
     * Calling a `nonReentrant` function from another `nonReentrant`
     * function is not supported. It is possible to prevent this from happening
     * by making the `nonReentrant` function external, and making it call a
     * `private` function that does the actual work.
     */
    modifier nonReentrant() {
        // On the first call to nonReentrant, _notEntered will be true
        require(_status != _ENTERED, "ReentrancyGuard: reentrant call");

        // Any calls to nonReentrant after this point will fail
        _status = _ENTERED;

        _;

        // By storing the original value once again, a refund is triggered (see
        // https://eips.ethereum.org/EIPS/eip-2200)
        _status = _NOT_ENTERED;
    }
}

interface ITradingHelper {

    function profitTax() external view returns (uint256);
    function fundsBackTax() external view  returns (uint256);
    function maxTradePeriod() external view  returns (uint256);
    function isAutoEnder(address autoEnder) external view  returns (bool);
    function getETHprice() external view returns (uint256);
    function SwapToWETH(uint256 inAmount) external returns (uint256 outAmount);
    function getEstimateWETH(uint256 inAmount) external view returns (uint256 estOutAmount);
    function SwapWETH(uint256 inAmount) external returns (uint256 outAmount);
    function getEstimateUSDC(uint256 inAmount) external view returns (uint256 estOutAmount);
}

interface IReferalHelper {

    function totalReferNum() external view returns (uint256);
    function totalReferProfitInUSDC() external view  returns (uint256);
    function totalReferProfitInWETH() external view  returns (uint256);
    function addReferWETHAmount(address depositor, address referrer, address token, uint256 amount) external;
    function addReferUSDCAmount(address depositor, address referrer, address token, uint256 amount) external;
}

// Note that this pool has no minter key of HOPE (rewards).
// Instead, the governance will call HOPE distributeReward method and send reward to this pool at the beginning.
contract GenesisRewardPool is ReentrancyGuard{
    using SafeMath for uint256;
    using SafeERC20 for IERC20;

    // governance
    address public operator;

    // Info of each user.
    struct UserInfo {
        uint256 amount; // How many tokens the user has provided.
        uint256 rewardDebt; // Reward debt. See explanation below.
        bool isTrading;
        int256 totalProfit;
    }

    // Info of each pool.
    struct PoolInfo {
        IERC20 token; // Address of LP token contract.
        uint256 allocPoint; // How many allocation points assigned to this pool. HOPE to distribute.
        uint256 lastRewardTime; // Last time that HOPE distribution occurs.
        uint256 accRewardPerShare; // Accumulated HOPE per share, times 1e18. See below.
        bool isStarted; // if lastRewardBlock has passed
        uint256 depositFeeBP;
        uint256 minAmountFortrading;
        uint256 totalDepositAmount;
    }

    IERC20 public hope;
    address public daoAddress;

    // Info of each pool.
    PoolInfo[] public poolInfo;

    // Info of each user that stakes tokens.
    mapping(uint256 => mapping(address => UserInfo)) public userInfo;

    // Total allocation points. Must be the sum of all allocation points in all pools.
    uint256 public totalAllocPoint = 0;

    // The time when HOPE mining starts.
    uint256 public poolStartTime;

    // The time when HOPE mining ends.
    uint256 public poolEndTime;

    uint256 public hopePerSecond =  0.069 ether; // 30000 HOPE / (24 * 5h * 60min * 60s)
    uint256 public runningTime = 5 days;
    uint256 public constant TOTAL_REWARDS = 30000 ether;
    
// For Leverage Trading

    struct Trade {
        uint256 id;
        address user;
        uint256 pid;
        bool isTrading;
        uint256 borrowAmount;
        uint256 swappedAmount;
        uint256 returnAmount;
        uint256 startPrice;
        uint256 endPrice;
        uint256 limitPrice;
        uint256 startTime;
        uint256 endTime;
    }

    struct TradeInfo {
        uint256 totalBorrowedAmount;
        uint256 totalReturnedAmount;
        uint256 feeAmount;
        uint256 totalProfit;
        uint256 totalLoss;
        uint256 count;
        uint256 lastTradeEndTime;
    }

    mapping(uint256 => Trade) public trades;
    mapping(uint256 => TradeInfo) public tradeInfos;

    uint256 public feeDenominator = 10000;
    uint256 public tradeCount = 0;
    ITradingHelper public tradingHelper;
    IReferalHelper public referalHelper;

    event Deposit(address indexed user, uint256 indexed pid, uint256 amount);
    event Withdraw(address indexed user, uint256 indexed pid, uint256 amount);
    event EmergencyWithdraw(address indexed user, uint256 indexed pid, uint256 amount);
    event RewardPaid(address indexed user, uint256 amount);

    constructor(
        address _hope,
        uint256 _poolStartTime,
        address _tradingHelper,
        address _referalHelper
    ) {
        require(block.timestamp < _poolStartTime, "late");
        if (_hope != address(0)) hope = IERC20(_hope);
        poolStartTime = _poolStartTime;
        poolEndTime = poolStartTime + runningTime;
        operator = msg.sender;
        daoAddress = msg.sender;
        tradingHelper = ITradingHelper(_tradingHelper);
        referalHelper = IReferalHelper(_referalHelper);
    }

    modifier onlyOperator() {
        require(operator == msg.sender, "RewardGenesisPool: caller is not the operator");
        _;
    }

    function checkPoolDuplicate(IERC20 _token) internal view {
        uint256 length = poolInfo.length;
        for (uint256 pid = 0; pid < length; ++pid) {
            require(poolInfo[pid].token != _token, "RewardGenesisPool: existing pool?");
        }
    }

    // Add a new token to the pool. Can only be called by the owner.
    function add(
        uint256 _allocPoint,
        IERC20 _token,
        bool _withUpdate,
        uint256 _lastRewardTime,
        uint256 _depositFeeBP,
        uint256 _minAmountFortrading
    ) public onlyOperator {
        checkPoolDuplicate(_token);
        if (_withUpdate) {
            massUpdatePools();
        }
        if (block.timestamp < poolStartTime) {
            // chef is sleeping
            if (_lastRewardTime == 0) {
                _lastRewardTime = poolStartTime;
            } else {
                if (_lastRewardTime < poolStartTime) {
                    _lastRewardTime = poolStartTime;
                }
            }
        } else {
            // chef is cooking
            if (_lastRewardTime == 0 || _lastRewardTime < block.timestamp) {
                _lastRewardTime = block.timestamp;
            }
        }
        bool _isStarted =
        (_lastRewardTime <= poolStartTime) ||
        (_lastRewardTime <= block.timestamp);
        poolInfo.push(PoolInfo({
            token : _token,
            allocPoint : _allocPoint,
            lastRewardTime : _lastRewardTime,
            accRewardPerShare : 0,
            isStarted : _isStarted,
            depositFeeBP: _depositFeeBP,
            minAmountFortrading: _minAmountFortrading,
            totalDepositAmount: 0
            }));
        if (_isStarted) {
            totalAllocPoint = totalAllocPoint.add(_allocPoint);
        }
    }

    // Update the given pool's HOPE allocation point. Can only be called by the owner.
    function set(uint256 _pid, uint256 _allocPoint, uint256 _depositFeeBP, uint256 _minAmountFortrading) public onlyOperator {
        require(_depositFeeBP <= 100, "set: invalid deposit fee basis points");
        massUpdatePools();
        PoolInfo storage pool = poolInfo[_pid];
        if (pool.isStarted) {
            totalAllocPoint = totalAllocPoint.sub(pool.allocPoint).add(
                _allocPoint
            );
        }
        poolInfo[_pid].allocPoint = _allocPoint;
        poolInfo[_pid].depositFeeBP = _depositFeeBP;
        poolInfo[_pid].minAmountFortrading = _minAmountFortrading;
}

    // Return accumulate rewards over the given _from to _to block.
    function getGeneratedReward(uint256 _fromTime, uint256 _toTime) public view returns (uint256) {
        if (_fromTime >= _toTime) return 0;
        if (_toTime >= poolEndTime) {
            if (_fromTime >= poolEndTime) return 0;
            if (_fromTime <= poolStartTime) return poolEndTime.sub(poolStartTime).mul(hopePerSecond);
            return poolEndTime.sub(_fromTime).mul(hopePerSecond);
        } else {
            if (_toTime <= poolStartTime) return 0;
            if (_fromTime <= poolStartTime) return _toTime.sub(poolStartTime).mul(hopePerSecond);
            return _toTime.sub(_fromTime).mul(hopePerSecond);
        }
    }

    // View function to see pending HOPE on frontend.
    function pendingHOPE(uint256 _pid, address _user) external view returns (uint256) {
        PoolInfo storage pool = poolInfo[_pid];
        UserInfo storage user = userInfo[_pid][_user];
        uint256 accRewardPerShare = pool.accRewardPerShare;
        uint256 tokenSupply = pool.token.balanceOf(address(this));
        if (block.timestamp > pool.lastRewardTime && tokenSupply != 0) {
            uint256 _generatedReward = getGeneratedReward(pool.lastRewardTime, block.timestamp);
            uint256 _hopeReward = _generatedReward.mul(pool.allocPoint).div(totalAllocPoint);
            accRewardPerShare = accRewardPerShare.add(_hopeReward.mul(1e18).div(tokenSupply));
        }
        return user.amount.mul(accRewardPerShare).div(1e18).sub(user.rewardDebt);
    }

    // Update reward variables for all pools. Be careful of gas spending!
    function massUpdatePools() public {
        uint256 length = poolInfo.length;
        for (uint256 pid = 0; pid < length; ++pid) {
            updatePool(pid);
        }
    }

    // Update reward variables of the given pool to be up-to-date.
    function updatePool(uint256 _pid) public {
        PoolInfo storage pool = poolInfo[_pid];
        if (block.timestamp <= pool.lastRewardTime) {
            return;
        }
        uint256 tokenSupply = pool.token.balanceOf(address(this));
        if (tokenSupply == 0) {
            pool.lastRewardTime = block.timestamp;
            return;
        }
        if (!pool.isStarted) {
            pool.isStarted = true;
            totalAllocPoint = totalAllocPoint.add(pool.allocPoint);
        }
        if (totalAllocPoint > 0) {
            uint256 _generatedReward = getGeneratedReward(pool.lastRewardTime, block.timestamp);
            uint256 _hopeReward = _generatedReward.mul(pool.allocPoint).div(totalAllocPoint);
            pool.accRewardPerShare = pool.accRewardPerShare.add(_hopeReward.mul(1e18).div(tokenSupply));
        }
        pool.lastRewardTime = block.timestamp;
    }

    // Deposit LP tokens.
    function deposit(uint256 _pid, uint256 _amount, address _referrer) public nonReentrant {
        address _sender = msg.sender;
        PoolInfo storage pool = poolInfo[_pid];
        UserInfo storage user = userInfo[_pid][_sender];
        updatePool(_pid);
        if (user.amount > 0) {
            uint256 _pending = user.amount.mul(pool.accRewardPerShare).div(1e18).sub(user.rewardDebt);
            if (_pending > 0) {
                safeRewardTransfer(_sender, _pending);
                emit RewardPaid(_sender, _pending);
            }
        }
        if (_amount > 0) {
            pool.token.safeTransferFrom(_sender, address(this), _amount);
            user.amount = user.amount.add(_amount);
            pool.totalDepositAmount = pool.totalDepositAmount.add(_amount);
            if(pool.depositFeeBP > 0){
                uint256 depositFee = _amount.mul(pool.depositFeeBP).div(feeDenominator);
                user.amount = user.amount.sub(depositFee);
                pool.totalDepositAmount = pool.totalDepositAmount.sub(depositFee);

                if(_amount >= pool.minAmountFortrading) {
                    uint256 referFee = depositFee.div(2);
                    pool.token.safeTransfer(_referrer, referFee);
                    if(_pid == 0) {
                        referalHelper.addReferWETHAmount(msg.sender, _referrer, address(pool.token), referFee);
                    } else {
                        referalHelper.addReferUSDCAmount(msg.sender, _referrer, address(pool.token), referFee);
                    }
                    depositFee = depositFee.sub(referFee);
                }
                pool.token.safeTransfer(daoAddress, depositFee);
            }
        }

        user.rewardDebt = user.amount.mul(pool.accRewardPerShare).div(1e18);
        emit Deposit(_sender, _pid, _amount);
    }

    // Withdraw LP tokens.
    function withdraw(uint256 _pid, uint256 _amount) public nonReentrant {
        address _sender = msg.sender;
        PoolInfo storage pool = poolInfo[_pid];
        UserInfo storage user = userInfo[_pid][_sender];
        require(user.amount >= _amount, "withdraw: not good");
        updatePool(_pid);
        uint256 _pending = user.amount.mul(pool.accRewardPerShare).div(1e18).sub(user.rewardDebt);
        if (_pending > 0) {
            safeRewardTransfer(_sender, _pending);
            emit RewardPaid(_sender, _pending);
        }
        if (_amount > 0) {
            user.amount = user.amount.sub(_amount);
            pool.totalDepositAmount = pool.totalDepositAmount.sub(_amount);
            pool.token.safeTransfer(_sender, _amount);
        }
        user.rewardDebt = user.amount.mul(pool.accRewardPerShare).div(1e18);
        emit Withdraw(_sender, _pid, _amount);
    }

    // Withdraw without caring about rewards. EMERGENCY ONLY.
    function emergencyWithdraw(uint256 _pid) public nonReentrant {
        PoolInfo storage pool = poolInfo[_pid];
        UserInfo storage user = userInfo[_pid][msg.sender];
        uint256 _amount = user.amount;
        user.amount = 0;
        user.rewardDebt = 0;
        pool.totalDepositAmount = pool.totalDepositAmount.sub(_amount);
        pool.token.safeTransfer(msg.sender, _amount);
        emit EmergencyWithdraw(msg.sender, _pid, _amount);
    }

    // Safe HOPE transfer function, just in case if rounding error causes pool to not have enough HOPEs.
    function safeRewardTransfer(address _to, uint256 _amount) internal {
        uint256 _hopeBalance = hope.balanceOf(address(this));
        if (_hopeBalance > 0) {
            if (_amount > _hopeBalance) {
                hope.safeTransfer(_to, _hopeBalance);
            } else {
                hope.safeTransfer(_to, _amount);
            }
        }
    }

    function setOperator(address _operator) external onlyOperator {
        operator = _operator;
    }

    function setDaoAddress(address _daoAddress) public{
        require(msg.sender == daoAddress, "setDaoAddress: FORBIDDEN");
        require(_daoAddress != address(0), "setDaoAddress: ZERO");
        daoAddress = _daoAddress;
    }

    function governanceRecoverUnsupported(IERC20 _token, uint256 amount, address to) external onlyOperator {
        if (block.timestamp < poolEndTime + 90 days) {
            // do not allow to drain core token (HOPE or lps) if less than 90 days after pool ends
            require(_token != hope, "hope");
            uint256 length = poolInfo.length;
            for (uint256 pid = 0; pid < length; ++pid) {
                PoolInfo storage pool = poolInfo[pid];
                require(_token != pool.token, "pool.token");
            }
        }
        _token.safeTransfer(to, amount);
    }

    function updateTradingHelper(address _tradingHelper) external onlyOperator {
        require(_tradingHelper != address(0), "invalid address");
        tradingHelper = ITradingHelper(_tradingHelper);
    }

    function updateReferalHelper(address _referalHelper) external onlyOperator {
        require(_referalHelper != address(0), "invalid address");
        referalHelper = IReferalHelper(_referalHelper);
    }

    function openTrade(uint256 _pid, uint256 _borrowAmount, uint256 _limitPrice) public {
        address _trader = msg.sender;
        // _pid = 0: weth pool, _pid = 1: usdc pool
        // _pid = 0 ? short : long
        require(_pid < 2, "wrong pool id");
        PoolInfo storage pool = poolInfo[_pid];
        UserInfo storage user = userInfo[_pid][_trader];
        TradeInfo storage tradeInfo = tradeInfos[_pid];

        require(user.amount >= pool.minAmountFortrading, "need to deposit min amount for trading");
        require(!user.isTrading, "already started one trading");
        uint256 borrowableAmount = getBorrowableAmount(_pid);
        require(_borrowAmount <= borrowableAmount, "wrong borrow amount");

        tradeInfo.totalBorrowedAmount = tradeInfo.totalBorrowedAmount.add(_borrowAmount);

        uint256 swappedAmount = 0;
        if(_pid == 1) {
            swappedAmount = tradingHelper.SwapToWETH(_borrowAmount);
        } else {
            swappedAmount = tradingHelper.SwapWETH(_borrowAmount);
        }

        uint256 startPrice = tradingHelper.getETHprice();
        user.isTrading = true;

        trades[tradeCount] = Trade(
            tradeCount,
            msg.sender,
            _pid,
            true,
            _borrowAmount,
            swappedAmount,
            0,
            startPrice,
            0,
            _limitPrice,
            block.timestamp,
            0
        );
        tradeCount = tradeCount + 1;
        tradeInfo.count = tradeCount;
    }

    function getBorrowableAmount(uint256 _pid) public view returns(uint256) {
        TradeInfo storage tradeInfo = tradeInfos[_pid];
        PoolInfo storage pool = poolInfo[_pid];
        return pool.totalDepositAmount.sub(tradeInfo.totalBorrowedAmount).add(tradeInfo.totalReturnedAmount);
    }

    function endTrade(uint256 _tradeId) public {
        Trade storage trade = trades[_tradeId];
        require(msg.sender == trade.user || tradingHelper.isAutoEnder(msg.sender), "wrong permission");
        // _pid = 0: weth pool, _pid = 1: usdc pool
        // _pid = 0 ? short : long
        require(trade.pid < 2, "wrong pool id");
        PoolInfo storage pool = poolInfo[trade.pid];
        UserInfo storage user = userInfo[trade.pid][trade.user];
        TradeInfo storage tradeInfo = tradeInfos[trade.pid];

        require(user.isTrading, "not started yet");
        require(trade.isTrading, "not started yet");

        uint256 lastAmount;

        if(trade.pid == 1) {
            lastAmount = tradingHelper.SwapWETH(trade.swappedAmount);
        } else {
            lastAmount = tradingHelper.SwapToWETH(trade.swappedAmount);
        }

        trade.returnAmount = lastAmount;
        trade.endPrice = tradingHelper.getETHprice();
        tradeInfo.totalReturnedAmount = tradeInfo.totalReturnedAmount.add(lastAmount);

        updatePool(trade.pid);
        uint256 _pending = user.amount.mul(pool.accRewardPerShare).div(1e18).sub(user.rewardDebt);
        if (_pending > 0) {
            safeRewardTransfer(trade.user, _pending);
            emit RewardPaid(trade.user, _pending);
        }

        uint256 fundsBackFee = user.amount.mul(tradingHelper.fundsBackTax()).div(feeDenominator);

        if(lastAmount > trade.borrowAmount) {
            uint256 profit = lastAmount.sub(trade.borrowAmount);
            tradeInfo.totalProfit = tradeInfo.totalProfit.add(profit);
            if(profit > fundsBackFee) {
                uint256 userProfit = profit.sub(fundsBackFee);
                uint256 profitFee = userProfit.mul(tradingHelper.profitTax()).div(feeDenominator);
                userProfit = userProfit.sub(profitFee);

                tradeInfo.feeAmount = tradeInfo.feeAmount.add(fundsBackFee).add(profitFee);
                if(userProfit > 0) {
                    user.amount = user.amount.add(userProfit);
                    user.totalProfit += int256(userProfit);
                }
            }
        } else {
            uint256 loss = trade.borrowAmount.sub(lastAmount);
            user.totalProfit -= int256(loss);
            tradeInfo.totalLoss = tradeInfo.totalLoss.add(loss);
            if(loss > user.amount) {
                user.amount = 0;
            } else {
                user.amount = user.amount.sub(loss);
                if(fundsBackFee > user.amount) {
                    user.amount = 0;
                } else {
                    user.amount = user.amount.sub(fundsBackFee);
                }
            }
        }

        trade.endTime = block.timestamp;
        tradeInfo.lastTradeEndTime = block.timestamp;
        user.rewardDebt = user.amount.mul(pool.accRewardPerShare).div(1e18);
        user.isTrading = false;
        trade.isTrading = false;
    }

    function needToEnd(uint256 _tradeId) public view returns (bool) {
        Trade storage trade = trades[_tradeId];
        // PoolInfo storage pool = poolInfo[trade.pid];
        UserInfo storage user = userInfo[trade.pid][trade.user];

        require(trade.isTrading, "not started yet");
        if(block.timestamp.sub(trade.startTime) >= tradingHelper.maxTradePeriod()){
            return true;
        } else {
            uint256 fundsBackFee = user.amount.mul(tradingHelper.fundsBackTax()).div(feeDenominator);
            uint256 estimateAmount = 0;

            if(trade.pid == 0) {
                estimateAmount = tradingHelper.getEstimateUSDC(trade.swappedAmount);
            } else {
                estimateAmount = tradingHelper.getEstimateWETH(trade.swappedAmount);
            }

            if(estimateAmount.sub(fundsBackFee) <= trade.borrowAmount){
                return true;
            } else {
                if(trade.limitPrice == 0) {
                    return false;
                } else {
                    if(trade.pid == 1) {
                        return trade.limitPrice <= tradingHelper.getETHprice();
                    } else {
                        return trade.limitPrice >= tradingHelper.getETHprice();
                    }
                }
            }
        }
    }

    function getActiveTrades() public view returns(uint256[] memory) {
        uint256[] memory activeTrades;
        uint256 k = 0;
        for(uint256 i = 0; i < tradeCount; i++) {
            if(trades[i].isTrading) {
                activeTrades[k] = trades[i].id;
                k += 1;
            }
        }

        return activeTrades;
    }

    function getNeedToEndTrades() public view returns(uint256[] memory) {
        uint256[] memory activeTrades = getActiveTrades();
        uint256[] memory needEndTrades;
        uint256 k = 0;
        for(uint256 i = 0; i < activeTrades.length; i++) {
            if(needToEnd(activeTrades[i])) {
                needEndTrades[k] = activeTrades[i];
                k += 1;
            }
        }

        return needEndTrades;
    }

    function getLatestEndTrades(uint256 length) public view returns(Trade[] memory) {
        Trade[] memory endTrades;
        uint256 k = 0;
        for(uint256 i = tradeCount-1; i >=0; i-- ){
            if(!trades[i].isTrading) {
                endTrades[k] = trades[i];
                k += 1;
                if(k == length) {
                    break;
                }
            }
        }
        return endTrades;
    }
}