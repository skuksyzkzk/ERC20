// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v5.0.1) (utils/Context.sol)

pragma solidity ^0.8.20;

/**
 * @dev Provides information about the current execution context, including the
 * sender of the transaction and its data. While these are generally available
 * via msg.sender and msg.data, they should not be accessed in such a direct
 * manner, since when dealing with meta-transactions the account sending and
 * paying for execution may not be the actual sender (as far as an application
 * is concerned).

    이유: 일반적으로 msg.sender를 사용하여 현재 트랜잭션의 발신자를 얻을 수 있습니다.
    그러나 이 함수를 사용하면 라이브러리나 다른 계약에서 더 일반적인 방식으로 발신자를 얻을 수 있습니다. 
    예를 들어, 라이브러리가 중간 계약에서 호출되는 경우, msg.sender는 호출한 외부 호출자가 아닌 중간 계약이 될 수 있습니다.
    _msgSender()를 사용하면 항상 현재 호출자에 대한 올바른 정보를 얻을 수 있습니다.
    Context 컨트랙트는 주로 보안 및 안정성을 강화하며, 라이브러리의 일반적 사용 패턴에 대한
    표준화를 제공하기 위한 목적으로 도입되었습니다. 이 컨트랙트를 상속받아 사용하는 것은
    중요한 프로그래밍 모범 사례 중 하나입니다.

    _msgSender() 함수가 view 함수로 선언되어 있어서 호출자에게 어떤 영향도 미치지 않고, 단순히 값을 반환하는 것입니다.

    msg.sender를 직접 호출하는 경우, 컴파일러는 그 호출 지점을 이해하지 못하고, 
    호출자에게 어떤 영향을 미칠지 확신할 수 없어서 몇 가지 예기치 못한 동작을 초래할 수 있습니다. 
    특히 라이브러리가 다른 컨트랙트의 일부로 사용될 때, 라이브러리에서 직접적으로 msg.sender를 사용하면 
    원하지 않는 동작이 발생할 수 있습니다.

 *
 * This contract is only required for intermediate, library-like contracts.
 */
abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes calldata) {
        return msg.data;
    }

    function _contextSuffixLength() internal view virtual returns (uint256) {
        return 0;
    }
}