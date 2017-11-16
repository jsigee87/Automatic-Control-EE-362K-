%hw 2 problem 2

t = 1:200;
plot(t,epidemic(1),t,epidemic(10),t,epidemic(100),t,epidemic(1000));
title('Population vs. Time with varying immuzation rates')
legend('Imm. Rate = 1', 'Imm. Rate = 10', 'Imm. Rate = 100', 'Imm. Rate = 1000');
