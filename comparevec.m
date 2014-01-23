function comparevec(a, b),

a = a(:);
b = b(:);

d = norm(a-b, 2);
fprintf('l2 difference = %f\n', d);

[~, iii] = sort(a);
[~, jjj] = sort(b);

clf;

subplot(221);
plot(a(iii), 'b+');
hold on;
plot(b(iii), 'ro');
legend('a', 'b');

subplot(223);
plot(a(jjj), 'b+');
hold on;
plot(b(jjj), 'ro');
legend('a', 'b');

subplot(222);
plot(a - b, 'k+');
legend('difference');
title(sprintf('l2 difference = %f', d), 'FontSize', 20);

subplot(224);
plot(a, 'b+');
hold on;
plot(b, 'ro');
legend('a', 'b');
